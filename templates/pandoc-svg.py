#! /usr/bin/env python
"""
Pandoc filter to convert svg files to pdf as suggested at:
https://github.com/jgm/pandoc/issues/265#issuecomment-27317316
"""

__author__ = "Jerome Robert"

import mimetypes
import subprocess
import os
import sys
from pandocfilters import toJSONFilter, Image

fmt_to_option = {
    #use PNG because EMF and WMF break transparency
    #"docx": ("--export-type=png", "png"),
    "docx": ("--export-type=emf", "emf")
}


def svg_to_any(key, value, fmt, meta):
    if key == 'Image':
        attrs, alt, [src, title] = value
        mimet, _ = mimetypes.guess_type(src)
        option = fmt_to_option.get(fmt)
        if mimet == 'image/svg+xml' and option:
            base_name, _ = os.path.splitext(src)
            eps_name = base_name + "." + option[1]
            try:
                mtime = os.path.getmtime(eps_name)
            except OSError:
                mtime = -1
            if mtime < os.path.getmtime(src):
                cmd_line = ['inkscape', option[0], src]
                sys.stderr.write("Running %s" % " ".join(cmd_line))
                env = os.environ.copy()
                env["GDK_BACKEND"] = "cairo"
                process = subprocess.Popen(
                    cmd_line,
                    stdout=sys.stderr,
                    stderr=subprocess.PIPE,
                    env=env,
                    text=True
                )
                for line in process.stderr:
                    if "GtkRecentManager" not in line:
                        sys.stderr.write(line)
                process.wait()
            return Image(attrs, alt, [eps_name, title])

if __name__ == "__main__":
    toJSONFilter(svg_to_any)
