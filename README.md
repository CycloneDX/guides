[![Website](https://img.shields.io/badge/https://-cyclonedx.org-blue.svg)](https://cyclonedx.org/)
[![Slack Invite](https://img.shields.io/badge/Slack-Join-blue?logo=slack&labelColor=393939)](https://cyclonedx.org/slack/invite)
[![ECMA TC54](https://img.shields.io/badge/ECMA-TC54-FC7C00?labelColor=404040)](https://tc54.org)

# CycloneDX Authoritative Guides

Welcome to the Authoritative Guide series by the OWASP Foundation and OWASP CycloneDX. In this
series, we aim to provide comprehensive insights and practical guidance, ensuring that security
professionals, developers, and organizations alike have access to the latest best practices and
methodologies.

Contributions to these guides are highly encouraged, as they thrive on the collective knowledge 
and experiences of the community. Whether through writing, reviewing, or providing feedback, 
contributors play a vital role in maintaining the relevance and accuracy of the content, ultimately
supporting the continuous improvement and adoption of BOM standards globally.

All content in the CycloneDX Authoritative Guides is written in Markdown.

All images in the CycloneDX Authoritative Guides are in SVG format, ensuring high-quality, 
resolution-independent visuals.

## Building the Guides

The PDFs are produced by a fully open-source pipeline — pandoc converts the Markdown to HTML,
[WeasyPrint](https://weasyprint.org/) typesets it ([templates/pdf/print.css](templates/pdf/print.css)
defines the entire design), and pypdf assembles the cover, back page, background art, and metadata.
No proprietary software is required.

```
build/build-pdf.sh SBOM        # one guide
build/build-pdf.sh ALL         # every guide with sources
```

Requirements: pandoc 3.x, Python 3.10+ with `pip install -r templates/pdf/requirements.txt`, and
Pango (preinstalled on most Linux distributions; `brew install pango` on macOS) — or simply use the
repository [Dockerfile](Dockerfile). Guides can also be generated from the
[Generate Guide](.github/workflows/generate-guide.yml) GitHub Action.

See [templates/pdf/README.md](templates/pdf/README.md) for the pipeline details.
