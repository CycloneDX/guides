# PDF pipeline

This directory contains everything that styles and assembles the Authoritative Guide PDFs

```
markdown (GFM) --pandoc--> HTML --WeasyPrint--> body PDF
cover.pdf + body + back.pdf --pypdf--> final PDF
```

| File | Role |
|------|------|
| `print.css` | The entire visual design. Page geometry, fonts, headings, TOC leaders, tables, code blocks, running header/footer. |
| `guide.html` | Minimal pandoc template (metadata, TOC nav, body). |
| `filters/pagebreak-html.lua` | Converts the `\newpage`/`\emptyparagraph` markers, remaps `.pdf` images to `.svg`, and tunes URL line breaking. |
| `build_pdf.py` | Renders HTML with WeasyPrint, stamps `templates/watermark.pdf` under each page (full-bleed background art), joins cover/back, writes PDF metadata. |
| `fonts/` | Vendored OFL/Apache fonts: Roboto Light/Medium (body) and JetBrains Mono Light (code). |
| `art/owasp-logo.svg` | Running-header logo (vector, includes the ® mark). |
| `tools/composite_svg_masks.py` | Makes `pdftocairo -svg` output WeasyPrint-compatible by pre-compositing soft-masked raster icons; use when converting `.pdf` figures to `.svg`. |
| `requirements.txt` | Pinned Python dependencies (WeasyPrint, pypdf). |

All figures render as vectors in the output PDF (SVGs are not rasterized);
the on-page display size is controlled here in CSS, never in the markdown.

Build a guide:

```
build/build-pdf.sh SBOM en
```

Requirements: `pandoc` 3.x, Python 3.10+ with `pip install -r
templates/pdf/requirements.txt`, and Pango (preinstalled on most Linux;
`brew install pango` on macOS). Or use the repository `Dockerfile`.

Authors keep writing plain GFM markdown — no classes, styles, or HTML
needed. All look-and-feel decisions live in `print.css`.

For future translations: add `@font-face` rules (e.g. Noto Sans JP/SC/KR,
Noto Sans Arabic/Hebrew — Light 300) and a small per-language CSS override;
the Docker image already ships Noto CJK.
