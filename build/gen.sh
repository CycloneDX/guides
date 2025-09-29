#!/bin/bash
printf "OWASP Markdown Conversion Tool\n"

BOMTYPE=;

shopt -s nocasematch
case $1 in
  "SBOM" )
    BOMTYPE="SBOM"
    ;;
  "CBOM" )
    BOMTYPE="CBOM"
    ;;
  "SaaSBOM" )
    BOMTYPE="SaaSBOM"
    ;;
  "VDR" | "VEX" | "VDR_VEX" | "VDR+VEX" )
    BOMTYPE="VDR_VEX"
    ;;
  "Attestations" )
    BOMTYPE="Attestations"
    ;;
  "ML-BOM" | "MLBOM")
    BOMTYPE="ML-BOM"
    ;;
  "MBOM" )
    BOMTYPE="MBOM"
    ;;
  "HBOM" )
    BOMTYPE="HBOM"
    ;;
  * )
    echo 'Invalid argument. Valid arguments are "SBOM", "CBOM", "SaaSBOM", "MLBOM", "MBOM", "HBOM", "VDR", and "Attestations"'
    exit 1
    ;;
esac

printf "Task: Generate CycloneDX $BOMTYPE guide\n"

function command_exists () {
    command -v $1 >/dev/null 2>&1;
}

if ! command_exists pandoc; then
    printf "Error: Please install pandoc. Cannot continue"
    exit 2;
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
  printf "Creating pdf\n"
  cloudconvert convert -f pdf --overwrite --outputdir "../../docs" -p.engine=office -p.engine_version=2.1 -p,optimize_print=false "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.docx"
  printf "Adding watermark to pdf...\n"
  pdfcli watermark -o "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../templates/watermark.pdf"
  printf "Applying cover page...\n"
  pdfcli join "../en/images/cover.pdf" "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf" "../../images/back.pdf" -o "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
  printf "Updating Exif...\n"
  exiftool -Title="Authoritative Guide to $BOMTYPE" -Author="OWASP Foundation" -Subject="CycloneDX BOM Standard" "../../docs/OWASP_CycloneDX-Authoritative-Guide-to-$BOMTYPE-SNAPSHOT-$LANG.pdf"
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
