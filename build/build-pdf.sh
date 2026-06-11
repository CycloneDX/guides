#!/bin/bash
# OWASP CycloneDX guide builder
#
#   markdown (GFM) --pandoc--> HTML --WeasyPrint--> body PDF
#   cover.pdf + body + back.pdf --pypdf--> final PDF (with metadata)
#
# Usage: build/build-pdf.sh <BOMTYPE> [LANG]
set -euo pipefail

cd "$(dirname "$0")/.."
ROOT="$(pwd)"

case ${1:-} in
  ([Ss][Bb][Oo][Mm]) BOMTYPE="SBOM";;
  ([Cc][Bb][Oo][Mm]) BOMTYPE="CBOM";;
  ([Ss][Aa][Aa][Ss][Bb][Oo][Mm]) BOMTYPE="SaaSBOM";;
  ([Vv][Dd][Rr]|[Vv][Ee][Xx]|[Vv][Ee][Xx]_[Vv][Dd][Rr]|[Vv][Dd][Rr]_[Vv][Ee][Xx]) BOMTYPE="VDR_VEX";;
  ([Aa][Tt][Tt][Ee][Ss][Tt][Aa][Tt][Ii][Oo][Nn][Ss]) BOMTYPE="Attestations";;
  ([Mm][Ll][Bb][Oo][Mm]|[Mm][Ll]-[Bb][Oo][Mm]) BOMTYPE="ML-BOM";;
  ([Mm][Bb][Oo][Mm]) BOMTYPE="MBOM";;
  ([Hh][Bb][Oo][Mm]) BOMTYPE="HBOM";;
  ([Oo][Bb][Oo][Mm]) BOMTYPE="OBOM";;
  ([Aa][Ll][Ll]) BOMTYPE="ALL";;
  (*)
    echo "Usage: $0 <SBOM|CBOM|SaaSBOM|VDR|VEX|Attestations|MLBOM|MBOM|HBOM|OBOM|ALL> [lang]"
    exit 1;;
esac

LANG_CODE=${2:-en}

if [ "$BOMTYPE" = "ALL" ]; then
  status=0
  for type in Attestations CBOM HBOM MBOM ML-BOM OBOM SaaSBOM SBOM VDR_VEX; do
    if ls "$ROOT/$type/$LANG_CODE"/*.md >/dev/null 2>&1; then
      "$0" "$type" "$LANG_CODE" || status=1
    else
      echo "Skipping $type ($LANG_CODE): no markdown sources"
    fi
  done
  exit $status
fi

# human-facing name for PDF metadata (directory slugs are not display names)
case $BOMTYPE in
  (VDR_VEX) DISPLAYNAME="VDR and VEX";;
  (*) DISPLAYNAME="$BOMTYPE";;
esac

SRCDIR="$ROOT/$BOMTYPE/$LANG_CODE"
OUTDIR="$ROOT/docs"
OUT="$OUTDIR/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG_CODE.pdf"
TMPDIR_BUILD="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_BUILD"' EXIT

if [ ! -d "$SRCDIR" ]; then
  echo "No guide sources found in $SRCDIR"
  exit 1
fi

# Python environment: use $PYTHON if set, else the repo venv, else python3
PYTHON="${PYTHON:-}"
if [ -z "$PYTHON" ]; then
  if [ -x "$ROOT/.venv-pdf/bin/python" ]; then
    PYTHON="$ROOT/.venv-pdf/bin/python"
  else
    PYTHON="python3"
  fi
fi

# WeasyPrint on macOS needs Homebrew's native libraries
if [[ "$OSTYPE" == "darwin"* ]] && [ -d /opt/homebrew/lib ]; then
  export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib${DYLD_FALLBACK_LIBRARY_PATH:+:$DYLD_FALLBACK_LIBRARY_PATH}"
fi

command -v pandoc >/dev/null || { echo "Error: pandoc is required"; exit 1; }

echo "Generating CycloneDX Authoritative Guide to $BOMTYPE ($LANG_CODE)..."

mkdir -p "$OUTDIR"

pandoc -s -f gfm -t html5 \
  --template "$ROOT/templates/pdf/guide.html" \
  --lua-filter "$ROOT/templates/pdf/filters/pagebreak-html.lua" \
  --columns 10000 \
  --toc \
  --toc-depth=2 \
  --css "$ROOT/templates/pdf/print.css" \
  --metadata title="Authoritative Guide to $DISPLAYNAME" \
  --metadata author="OWASP Foundation" \
  --metadata description="CycloneDX BOM Standard" \
  -o "$TMPDIR_BUILD/body.html" \
  "$SRCDIR"/*.md

"$PYTHON" "$ROOT/templates/pdf/build_pdf.py" \
  --html "$TMPDIR_BUILD/body.html" \
  --base-url "$SRCDIR/" \
  --cover "$SRCDIR/images/cover.pdf" \
  --back "$ROOT/images/back.pdf" \
  --watermark "$ROOT/templates/watermark.pdf" \
  --out "$OUT" \
  --title "Authoritative Guide to $DISPLAYNAME" \
  --keywords "OWASP, CycloneDX, SBOM, BOM, Transparency, SCRM, C-SCRM, Standard, Guide, Best Practice, How-To, ECMA-424, TC54"

echo "Generated $OUT"
