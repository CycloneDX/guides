# Standards
In CDXA, a "standard" is just a collection of security requirements. Each "standard" has a version number, description, an owner, and a list of requirements. The requirements themselves may be very specific and concrete, with best practices, guidance, or even just principles. That's up to the standard creator. Many security standards are available in CDXA. You can see a list below.

In CDXA every requirement has:
* Identifier - should tie back to the original standard as much as possible
* Title - a short description
* Text - the actual text of the requirement
* Descriptions - an array of supplemental text that provides guidance but is not directly part of the text
* OpenCRE Identifier (where possible)
* Parent (to support a hierarchy of requirements)
* External References

## Creating Your Own Standard
In CDXA, you're free to create your own security standard. It could be a subset or superset of an existing standard. 
There are a lot of good reasons to tailor a security standard to your particular system. But remember, you may be 
required to follow one or more external security standards. As we move into making claims and substantiating those 
claims in CDXA, you'll see how you can capture your approach to existing requirements to show compliance.

| Original Standard | CDXA Version |
| --- | --- |
| [NIST Secure Software Development Framework (SSDF)](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218.pdf) | [CDXA-SSDF](https://github.com/CycloneDX/official-3rd-party-standards/blob/main/standards/NIST/SSDF/nist_secure-software-development-framework_1.1.cdx.json) |
| [PCI Secure SLC Standard](https://docs-prv.pcisecuritystandards.org/Software%20Security/Standard/PCI-Secure-SLC-Standard-v1_1.pdf) | [CDXA-PCI-SSLC](https://github.com/CycloneDX/official-3rd-party-standards/blob/main/standards/PCI_Security_Standards_Council/Secure_SLC/pcissc-secure-slc-1.1.cdx.json) |
| [Build Security In Maturity Model (BSIMM)](https://www.synopsys.com/software-integrity/resources/analyst-reports/bsimm.html) | [CDXA-BSIMM](https://github.com/CycloneDX/official-3rd-party-standards/blob/main/standards/BSIMM/bsimm-v13.cdx.json) |
| [OWASP Application Security Verification Standard (ASVS)](https://github.com/OWASP/ASVS/raw/v4.0.3/4.0/OWASP%20Application%20Security%20Verification%20Standard%204.0.3-en.pdf) | [CDXA-OWASP-ASVS](https://github.com/CycloneDX/official-3rd-party-standards/blob/main/standards/OWASP/ASVS/asvs-4.0.3.cdx.json) |
| [OWASP Mobile Application Security Verification Standard (MASVS)](https://github.com/OWASP/owasp-masvs/releases/latest/download/OWASP_MASVS.pdf) | [CDXA-OWASP-MASVS](https://github.com/CycloneDX/official-3rd-party-standards/blob/main/standards/OWASP/MASVS/masvs-2.0.0.cdx.json) |
| [OWASP Software Component Verification Standard (SCVS)](https://scvs.owasp.org/scvs/) | [CDXA-OWASP-SCVS](scvs-1.0.0.cdx.json) |

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>