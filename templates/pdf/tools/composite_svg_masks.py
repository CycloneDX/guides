#!/usr/bin/env python3
"""Make pdftocairo-generated SVGs renderable by WeasyPrint.

pdftocairo -svg represents PDF images that carry a soft mask (SMask) as an
RGB <image> wrapped in <g mask="..."> whose mask extracts alpha from a
second grayscale <image> via feColorMatrix filters. WeasyPrint does not
support SVG filters, so those images render as opaque boxes.

This tool pre-composites each color/mask image pair into a single RGBA
image and drops the mask wrapper. All vector content is left untouched.

Usage: composite_svg_masks.py input.svg [output.svg]

Typical figure conversion from a PDF source:
    pdftocairo -svg figure.pdf figure.svg
    composite_svg_masks.py figure.svg
"""

import base64
import io
import re
import sys

from PIL import Image


def main():
    src = sys.argv[1]
    dst = sys.argv[2] if len(sys.argv) > 2 else src
    svg = open(src, encoding="utf-8").read()

    images = {
        m.group(1): m.group(2)
        for m in re.finditer(
            r'<image id="(source-\d+)"[^>]*xlink:href="data:image/png;base64,'
            r'([^"]+)"', svg)
    }
    masks = {
        m.group(1): m.group(2)
        for m in re.finditer(
            r'<mask id="(mask-\d+)">\s*<g[^>]*>\s*<use[^>]*xlink:href="#'
            r'(source-\d+)"[^>]*/>\s*</g>\s*</mask>', svg, re.S)
    }

    composited = {}

    def composite(color_id, mask_id):
        color = Image.open(io.BytesIO(base64.b64decode(images[color_id])))
        mask = Image.open(io.BytesIO(base64.b64decode(images[masks[mask_id]])))
        alpha = mask.convert("L").resize(color.size)
        rgba = color.convert("RGB")
        rgba.putalpha(alpha)
        buf = io.BytesIO()
        rgba.save(buf, "PNG")
        return base64.b64encode(buf.getvalue()).decode()

    def unwrap(m):
        mask_id, use = m.group(1), m.group(2)
        ref = re.search(r'xlink:href="#(source-\d+)"', use)
        if not ref or mask_id not in masks:
            return m.group(0)
        composited[ref.group(1)] = composite(ref.group(1), mask_id)
        return use

    svg = re.sub(r'<g mask="url\(#(mask-\d+)\)">\s*(<use[^>]*/>)\s*</g>',
                 unwrap, svg)

    for source_id, data in composited.items():
        svg = re.sub(
            r'(<image id="%s"[^>]*xlink:href="data:image/png;base64,)[^"]+'
            % source_id,
            lambda m: m.group(1) + data, svg)

    open(dst, "w", encoding="utf-8").write(svg)
    print(f"composited {len(composited)} masked images -> {dst}")


if __name__ == "__main__":
    main()
