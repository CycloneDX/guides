#!/bin/bash

echo "OWASP Markdown Conversion Tool"

BOMTYPE=;

case $1 in
  ([Ss][Bb][Oo][Mm]) BOMTYPE="SBOM";;
  ([Cc][Bb][Oo][Mm]) BOMTYPE="CBOM";;
  ([Ss][Aa][Aa][Ss][Bb][Oo][Mm]) BOMTYPE="SaaSBOM";;
  ([Vv][Dd][Rr]) BOMTYPE="VDR+VEX";;
  ([Vv][Ee][Xx]) BOMTYPE="VDR+VEX";;
  ([Aa][Tt][Tt][Ee][Ss][Tt][Aa][Tt][Ii][Oo][Nn][Ss]) BOMTYPE="Attestations";;
  (*)
    echo Invalid argument. Valid arguments are "SBOM", "CBOM", "SaaSBOM", "VDR", and "Attestations"
    exit;;
esac

echo -n "Task: Generate CycloneDX $BOMTYPE guide"

function command_exists () {
    command -v $1 >/dev/null 2>&1;
}

if ! command_exists pandoc; then
    echo "Error: Please install pandoc. Cannot continue"
    exit;
fi

generate_docx() {
  BOMTYPE=$1
  LANG=$2
  pandoc -s -f gfm --reference-doc=../../templates/reference.docx \
      --lua-filter=../../templates/pagebreak.lua \
      --lua-filter=../../templates/emptyparagraph.lua \
      --filter=../../templates/pandoc-svg.py \
      --columns 10000 \
      --toc \
      --toc-depth=2 \
      -t docx \
      -o "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx" *.md
  echo -n "\nRemoving temporary emf files...\n"
  find ../.. -type f -name '*.emf' -print -delete
}

generate_pdf() {
    BOMTYPE=$1
    LANG=$2
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        libreoffice --headless --convert-to pdf "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx" --outdir ../
        #mv "../OWASP_CycloneDX-SBOM-Guide-SNAPSHOT-$1.pdf" "../OWASP_CycloneDX-SBOM-Guide-TEMP-$1.pdf"
    else
        pyenv local 3.10.8
        docx2pdf "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx" "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
        pdfcli watermark -o "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../templates/watermark.pdf"
    fi
    pdfcli join "../en/images/cover.pdf" "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../images/back.pdf" -o "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
    exiftool -Title="Authoritative Guide to $BOMTYPE" -Author="OWASP Foundation" -Subject="CycloneDX BOM Standard" "../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
}

cleanup() {
    BOMTYPE=$1
    LANG=$2
    echo -n "Cleaning up temporary documents\n"
    rm -f ../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-$LANG.docx || true
    rm -f ../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-$LANG.pdf || true
    rm -f ../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx || true
    rm -f ../OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf_original || true
}

generate() {
    BOMTYPE=$1
    LANG=$2
    echo -n "Generating CycloneDX Authoritative Guide to $BOMTYPE ($LANG)...\n"
    if [ -d "$BOMTYPE/$LANG" ];
    then
        cd "$BOMTYPE/$LANG"
        generate_docx $BOMTYPE $LANG
        generate_pdf $BOMTYPE $LANG
        cleanup $BOMTYPE $LANG
        cd ../..
        echo "Done"
        echo "Generated OWASP CycloneDX Authoritative Guide to $BOMTYPE ($LANG)"
    else
        echo " No CycloneDX guide found in directory $1"
    fi
}

# Arabic
#generate $BOMTYPE "ar"

# Brazil
#generate $BOMTYPE "br"

# Chinese
#generate $BOMTYPE "cn"

# Czech
#generate $BOMTYPE "cz"

# English
generate $BOMTYPE "en"

# French
#generate $BOMTYPE "fr"

# German
# generate $BOMTYPE "de"

# Hebrew
#generate $BOMTYPE "heb"

# Italian
#generate $BOMTYPE "it"

# Japanese
#generate $BOMTYPE "jp"

# Korean
#generate $BOMTYPE "kr"

# Spanish
# generate $BOMTYPE "es"

# Ukraine
#generate $BOMTYPE "ukr"

echo
