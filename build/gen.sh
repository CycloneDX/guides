#!/bin/bash
printf "OWASP Markdown Conversion Tool\n"

BOMTYPE=;

case $1 in
  ([Ss][Bb][Oo][Mm]) BOMTYPE="SBOM";;
  ([Cc][Bb][Oo][Mm]) BOMTYPE="CBOM";;
  ([Ss][Aa][Aa][Ss][Bb][Oo][Mm]) BOMTYPE="SaaSBOM";;
  ([Vv][Dd][Rr]) BOMTYPE="VDR_VEX";;
  ([Vv][Ee][Xx]) BOMTYPE="VDR_VEX";;
  ([Aa][Tt][Tt][Ee][Ss][Tt][Aa][Tt][Ii][Oo][Nn][Ss]) BOMTYPE="Attestations";;
  ([Mm][Ll][Bb][Oo][Mm]) BOMTYPE="ML-BOM";;
  ([Mm][Bb][Oo][Mm]) BOMTYPE="MBOM";;
  ([Hh][Bb][Oo][Mm]) BOMTYPE="HBOM";;
  (*)
    echo Invalid argument. Valid arguments are "SBOM", "CBOM", "SaaSBOM", "MLBOM", "MBOM", "HBOM", "VDR", and "Attestations"
    exit;;
esac

printf "Task: Generate CycloneDX $BOMTYPE guide\n"

function command_exists () {
    command -v $1 >/dev/null 2>&1;
}

if ! command_exists pandoc; then
    printf "Error: Please install pandoc. Cannot continue"
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
      -o "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx" *.md
  printf "\nRemoving temporary emf files...\n"
  find ../.. -type f -name '*.emf' -print -delete
}

generate_pdf() {
  BOMTYPE=$1
  LANG=$2
  # Get the current date in the proper PDF format
  current_date=$(date +"D:%Y%m%d%H%M%S")
  printf "Creating pdf\n"
  cloudconvert convert -f pdf --overwrite --outputdir "../../docs" -p.engine=office -p.engine_version=2.1 -p,optimize_print=false "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx"
  printf "Adding watermark to pdf...\n"
  pdfcli watermark -o "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../templates/watermark.pdf"
  printf "Applying cover page...\n"
  pdfcli join "../en/images/cover.pdf" "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../images/back.pdf" -o "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
  printf "Updating Exif...\n"
  exiftool -Title="Authoritative Guide to $BOMTYPE" -Author="OWASP Foundation" -Subject="CycloneDX BOM Standard" -Creator="Markdown to PDF Pipeline via GitHub Action" -CreateDate=$current_date -Keywords="OWASP, CycloneDX, SBOM, BOM, Transparency, SCRM, C-SCRM, Standard, Guide, Best Practice, How-To, ECMA-424, TC54" "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
}

generate() {
    BOMTYPE=$1
    LANG=$2
    printf "Generating CycloneDX Authoritative Guide to $BOMTYPE ($LANG)...\n"
    if [ -d "$BOMTYPE/$LANG" ];
    then
        cd "$BOMTYPE/$LANG"
        generate_docx $BOMTYPE $LANG
        generate_pdf $BOMTYPE $LANG
        cd ../..
        printf "Done\n"
        printf "Generated OWASP CycloneDX Authoritative Guide to $BOMTYPE ($LANG)\n"
    else
        printf " No CycloneDX guide found in directory $1"
    fi
}

# English
generate $BOMTYPE "en"

echo
