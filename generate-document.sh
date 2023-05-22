#!/bin/bash

echo "OWASP Markdown Conversion Tool"

BOMTYPE=;

case $1 in
  ([Ss][Bb][Oo][Mm]) BOMTYPE="SBOM";;
  ([Ss][Aa][Aa][Ss][Bb][Oo][Mm]) BOMTYPE="SaaSBOM";;
  ([Vv][Dd][Rr]) BOMTYPE="VDR+VEX";;
  ([Vv][Ee][Xx]) BOMTYPE="VDR+VEX";;
  (*)
    echo Invalid argument. Valid arguments are "SBOM", "SaaSBOM", and "VDR"
    exit;;
esac

echo "Task: Generate CycloneDX $BOMTYPE guide"

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
      -o "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.docx" *.md
  echo -n "\nRemoving temporary eps files...\n"
  find ../.. -type f -name '*.eps' -print -delete
}

generate_pdf() {
    BOMTYPE=$1
    LANG=$2
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        libreoffice --headless --convert-to pdf "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.docx" --outdir ../
        #mv "../OWASP_CycloneDX-SBOM-Guide-SNAPSHOT-$1.pdf" "../OWASP_CycloneDX-SBOM-Guide-TEMP-$1.pdf"
    else
        pyenv local 3.10.8
        docx2pdf "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.docx" "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.pdf"
        pdfcli watermark -o "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.pdf" "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.pdf" "../../templates/watermark.pdf"
    fi
    pdfcli join "../en/images/cover.pdf" "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.pdf" -o "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.pdf"
    exiftool -Title="My Doc Title" -Author="Open Web Application Security Project (OWASP)" -Subject="CycloneDX BOM Standard" "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.pdf"
}

generate_epub() {
    BOMTYPE=$1
    LANG=$2
    pandoc -s -f gfm --css=../../templates/book.css \
        --lua-filter=../../templates/pagebreak.lua \
        --columns 10000 \
        --metadata title="My Doc Title" --metadata author="OWASP CycloneDX" \
        --epub-cover-image=../en/images/cover.jpg \
        --toc \
        --toc-depth=1 \
        -t epub \
        -o "../OWASP_CycloneDX-$BOMTYPE-Guide-SNAPSHOT-$LANG.epub" *.md
}

# generate_html() {
#     pandoc -s -f markdown_github -t html5 -o "../OWASP_SCVS-SNAPSHOT-$1.html" *.md
# }

generate() {
    BOMTYPE=$1
    LANG=$2
    echo -n "Generating CycloneDX $BOMTYPE Guide ($LANG)..."
    if [ -d "$BOMTYPE/$LANG" ];
    then
        cd "$BOMTYPE/$LANG"
        generate_docx $BOMTYPE $LANG
        generate_pdf $BOMTYPE $LANG
        generate_epub $BOMTYPE $LANG
        # generate_html $1
        cd ../..
        echo " done."
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
echo "Generated OWASP CycloneDX $BOMTYPE Guide"
