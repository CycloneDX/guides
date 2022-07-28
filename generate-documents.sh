#!/bin/bash

echo "OWASP Markdown Conversion Tool"
echo ""

function command_exists () {
    command -v $1 >/dev/null 2>&1;
}

if ! command_exists pandoc; then
    echo "Error: Please install pandoc. Cannot continue"
    exit;
fi

generate_docx() {
    pandoc -s -f gfm --reference-doc=../../templates/reference.docx \
        --lua-filter=../../templates/pagebreak.lua \
        --columns 10000 \
        -t docx \
        -o "../OWASP_CycloneDX-SBOM-Guide-SNAPSHOT-$1.docx" *.md
}

# generate_html() {
#     pandoc -s -f markdown_github -t html5 -o "../OWASP_SCVS-SNAPSHOT-$1.html" *.md
# }

generate() {
    echo -n "Generating CycloneDX SBOM Guide ($1)..."
    if [ -d "$1" ];
    then
        cd "SBOM/$1"
        generate_docx $1
        # generate_html $1
        cd ..
        echo " done."
    else
        echo " No CycloneDX guide found in directory $1"
    fi
}

# Arabic
#generate "ar"

# Brazil
#generate "br"

# Chinese
#generate "cn"

# Czech
#generate "cz"

# English
generate "en"

# French
#generate "fr"

# German
# generate "de"

# Hebrew
#generate "heb"

# Italian
#generate "it"

# Japanese
#generate "jp"

# Korean
#generate "kr"

# Spanish
# generate "es"

# Ukraine
#generate "ukr"

echo
echo "Generated OWASP CycloneDX Guide"
