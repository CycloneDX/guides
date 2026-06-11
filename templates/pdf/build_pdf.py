#!/usr/bin/env python3
"""Render a guide HTML file to PDF and assemble the final document.

WeasyPrint renders the body, pypdf stamps the background art, prepends the
cover, appends the back page, and writes the PDF metadata.
"""

import argparse
import io
import re
import sys
from datetime import datetime, timezone

from pypdf import PdfReader, PdfWriter
from weasyprint import HTML
from weasyprint.text.fonts import FontConfiguration


def merge_leading_json_key(html):
    """Render the first key of JSON fragments as one error token (red bold).

    Pandoc tokenizes the leading key of a JSON fragment (which is not valid
    standalone JSON) as a string token plus an error colon; merge them into
    a single error token so the whole key reads as one highlighted unit.
    """
    return re.sub(
        r'(<span id="cb\d+-1"><a[^>]*></a>)<span class="st">([^<]*)</span>'
        r'<span class="er">:</span>',
        r'\1<span class="er">\2:</span>',
        html)


def classify_toc_entries(html):
    """Tag TOC list items with the level of the heading they point to.

    TOC entries are styled by their target heading's level, independent of
    list nesting. Pandoc's HTML TOC only encodes nesting, so an H2 without
    a parent H1 would otherwise render as a top-level (uppercase) entry.
    """
    heading_levels = {
        m.group(2): m.group(1)
        for m in re.finditer(r'<h([1-6])[^>]*\bid="([^"]+)"', html)
    }

    nav = re.search(r'<nav id="TOC".*?</nav>', html, re.S)
    if not nav:
        return html

    def add_class(m):
        level = heading_levels.get(m.group(1), "1")
        return f'<li class="toc-h{level}">{m.group(0)[4:]}'

    classified = re.sub(r'<li><a href="#([^"]+)"', add_class, nav.group(0))
    return html[:nav.start()] + classified + html[nav.end():]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--html", required=True, help="input HTML file")
    ap.add_argument("--base-url", required=True,
                    help="directory for resolving relative image URLs")
    ap.add_argument("--cover", help="cover PDF to prepend")
    ap.add_argument("--back", help="back page PDF to append")
    ap.add_argument("--watermark",
                    help="single-page PDF stamped under every body page "
                         "(full-bleed background art)")
    ap.add_argument("--out", required=True, help="output PDF path")
    ap.add_argument("--title", default="")
    ap.add_argument("--author", default="OWASP Foundation")
    ap.add_argument("--subject", default="CycloneDX BOM Standard")
    ap.add_argument("--keywords", default="")
    args = ap.parse_args()

    print(f"Rendering {args.html} with WeasyPrint...", file=sys.stderr)
    with open(args.html, encoding="utf-8") as fh:
        html_text = merge_leading_json_key(classify_toc_entries(fh.read()))
    font_config = FontConfiguration()
    body_bytes = io.BytesIO()
    HTML(string=html_text, base_url=args.base_url).write_pdf(
        body_bytes, font_config=font_config)
    body_bytes.seek(0)
    body = PdfReader(body_bytes)
    print(f"Body: {len(body.pages)} pages", file=sys.stderr)

    if args.watermark:
        # The art is stamped over the page; it is translucent pastel, so
        # content stays readable and table/code fills pick up a faint tint.
        stamp = PdfReader(args.watermark).pages[0]
        for page in body.pages:
            page.merge_page(stamp, over=True)

    writer = PdfWriter()
    if args.cover:
        writer.append(args.cover)
    first_body = len(writer.pages)
    writer.append(body)
    if args.watermark:
        # merge_page leaves the combined streams uncompressed
        for page in writer.pages[first_body:first_body + len(body.pages)]:
            page.compress_content_streams()
    if args.back:
        writer.append(args.back)

    now = datetime.now(timezone.utc).strftime("D:%Y%m%d%H%M%SZ")
    writer.add_metadata({
        "/Title": args.title,
        "/Author": args.author,
        "/Subject": args.subject,
        "/Keywords": args.keywords,
        "/Creator": "Markdown to PDF Pipeline via GitHub Action",
        "/CreationDate": now,
        "/ModDate": now,
    })

    with open(args.out, "wb") as fh:
        writer.write(fh)
    print(f"Wrote {args.out} ({len(writer.pages)} pages)", file=sys.stderr)


if __name__ == "__main__":
    main()
