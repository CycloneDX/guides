#!/bin/bash
# OWASP CycloneDX guide builder
#
#   markdown (GFM) --pandoc--> HTML --WeasyPrint--> body PDF
#   cover.pdf + body + back.pdf --pypdf--> final PDF (with metadata)
#
# Usage: build/build-pdf.sh <BOMTYPE> [LANG] [--final]
#
# Builds carry a diagonal DRAFT watermark by default; --final (or
# --no-draft) produces a clean release build.
set -euo pipefail

cd "$(dirname "$0")/.."
ROOT="$(pwd)"

DRAFT=1
ARGS=()
for arg in "$@"; do
  case $arg in
    --final|--no-draft) DRAFT=0 ;;
    --draft) DRAFT=1 ;;
    *) ARGS+=("$arg") ;;
  esac
done
set -- ${ARGS[@]+"${ARGS[@]}"}

shopt -s nocasematch
case ${1:-} in
  SBOM ) BOMTYPE="SBOM" ;;
  CBOM ) BOMTYPE="CBOM" ;;
  SaaSBOM ) BOMTYPE="SaaSBOM" ;;
  VDR_VEX ) BOMTYPE="VDR_VEX" ;;
  Attestations ) BOMTYPE="Attestations" ;;
  Design-Assurance ) BOMTYPE="Design-Assurance" ;;
  ML-BOM) BOMTYPE="ML-BOM" ;;
  MBOM ) BOMTYPE="MBOM" ;;
  HBOM) BOMTYPE="HBOM" ;;
  OBOM ) BOMTYPE="OBOM" ;;
  ALL ) BOMTYPE="ALL" ;;
  * ) echo "Usage: $0" \
    "<SBOM|CBOM|SaaSBOM|VDR|VEX|Attestations|Design-Assurance|MLBOM|MBOM|HBOM|OBOM|ALL>" \
    "[lang] [--final]"
    exit 1 ;;
esac

LANG_CODE=${2:-en}

DRAFT_FLAG=""
if [ "$DRAFT" = 0 ]; then DRAFT_FLAG="--final"; fi

if [ "$BOMTYPE" = "ALL" ]; then
  status=0
  for type in Attestations Design-Assurance CBOM HBOM MBOM ML-BOM OBOM SaaSBOM SBOM VDR_VEX; do
    if ls "$ROOT/$type/$LANG_CODE"/*.md >/dev/null 2>&1; then
      "$0" "$type" "$LANG_CODE" $DRAFT_FLAG || status=1
    else
      echo "Skipping $type ($LANG_CODE): no markdown sources"
    fi
  done
  exit $status
fi

# human-facing name for PDF metadata (directory slugs are not display names)
case $BOMTYPE in
  VDR_VEX) DISPLAYNAME="VDR and VEX" ;;
  *) DISPLAYNAME="$BOMTYPE" ;;
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

if [ "$DRAFT" = 1 ]; then
  echo "Generating CycloneDX Authoritative Guide to $BOMTYPE ($LANG_CODE) [DRAFT; use --final to disable]..."
  DRAFT_META="--metadata draft=true"
else
  echo "Generating CycloneDX Authoritative Guide to $BOMTYPE ($LANG_CODE)..."
  DRAFT_META=""
fi

mkdir -p "$OUTDIR"

pandoc -s -f gfm -t html5 $DRAFT_META \
  --syntax-definition "$ROOT/templates/syntax/json5.xml" \
  --syntax-definition "$ROOT/templates/syntax/jsonc.xml" \
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
