# Applications For Using SBOMs

User managed software, IoT, IIoT, developer (p.24)

# Use Cases


## What is affected and where (impact analysis)

## Vulnerability Management
CycloneDX can be used for vulnerability management and impact analysis through support of comprehensive inventory and
assertions of component identity. By having this information, security teams can identify which components are affected
by known vulnerabilities, estimate effort, and quickly prioritize remediation efforts.

By leveraging CycloneDX in this way, organizations can enhance their software supply chain security and reduce the
risks associated with software vulnerabilities.

> Identifying known vulnerabilities in components can be achieved through the use of three fields: `cpe`, `purl`, and
> `swid`. Not all fields apply to all types of components. The [CPE](https://nvd.nist.gov/products/cpe) specification was 
> designed for operating systems, applications, and hardware devices. CPE is maintained by the NVD.
> [Package URL](https://github.com/package-url/purl-spec) (PURL) standardizes how software package metadata is represented
> so that packages can universally be located regardless of what vendor, project, or ecosystem the packages belongs. 
> Software ID (SWID) as defined in [ISO/IEC 19770-2:2015](https://www.iso.org/standard/65666.html) is used primarily to 
> identify installed software.
> 
> Components that have a cpe, purl, or swid defined can be analyzed for known vulnerabilities.

## Component Inventory and Management

## Enterprise Visibility Using CMDB
A Configuration Management Database (CMDB) is a repository that stores information about an organization's assets, 
including hardware, software, and other components. Tracking assets in a CMDB involves collecting and maintaining 
accurate information about each asset's configuration, location, status, and relationships with other assets. This 
information helps organizations manage their assets more effectively, including monitoring their performance, 
identifying potential risks, and supporting incident management.

There is tremendous benefits in capturing BOMs for assets tracked in a CMDB. By including BOMs in a CMDB, organizations 
can gain a more comprehensive view of their assets, which can help them make more informed decisions about managing their 
IT/OT infrastructure.


Reduce unused dependencies, standardize libraries, etc


## Integrity Verification
CycloneDX can be used for integrity verification using cryptographic hashing algorithms. The specification allows for the 
inclusion of cryptographic hashes, such as SHA-256, SHA-384, or SHA-512, for each software component listed in the BOM. 
By calculating the hash of each file, package, or library, and comparing it with the hash value listed in the BOM, 
organizations can verify the integrity of the software and detect unauthorized modifications. 

By leveraging CycloneDX for integrity verification, organizations can enhance the security and reliability of their 
software applications and systems.

## Authenticity
When an SBOM is signed, the authenticity and integrity of the BOM can been verified by a trusted third party, such as a 
software vendor or a security researcher. This verification can provide assurance that the components listed in the BOM 
have not been tampered with or replaced with malicious components, and that the product was built with the intended 
components and dependencies. The use of a signed BOM can help increase trust and confidence in a software product, 
particularly in cases where the product is used in sensitive or critical applications.

## License Compliance
CycloneDX can be used for open source and commercial license compliance. By leveraging the licensing capabilities of
CycloneDX, organizations can identify any licenses that may be incompatible or require specific compliance obligations, 
such as attribution or sharing of source code. CycloneDX can also help organizations manage their commercial software 
licenses by providing a clear understanding of what licenses are in use and which ones require renewal or additional 
purchases, which may impact the operational aspects of applications or systems. By leveraging CycloneDX for open source 
and commercial license compliance, organizations can reduce the risks associated with license violations, enhance their 
license management practices, and ensure compliance with regulatory requirements.

## Outdated Component Analysis
Relying on outdated components can have a significant impact on the security, stability, and performance of software. 
Outdated components may have known vulnerabilities that can be exploited by attackers, leading to data breaches or other
security issues. Additionally, newer versions of components may include bug fixes or performance improvements that can 
enhance the overall functionality of the software. 

Updating components is not a one-time task but a continuous process. New vulnerabilities and bugs are constantly being 
discovered, and new updates are being released to fix them. Thus, it is crucial to regularly check for updates and keep 
components up to date. Ignoring updates and running software with outdated components can lead to increased time to 
mitigate vulnerabilities should a previously unknown vulnerability become known.

open source, end-of-life

## Provenance
Provenance refers to the history of the origin and ownership of a component. In the context of a software supply chain, 
provenance provides a way to trace the lineage of a component and ensure its authenticity is in alignment.

Provenance information can help software developers and users identify the source of a component, and helps to establish 
trust and accountability among different parties involved in the software supply chain, such as software vendors, 
distributors, and consumers.

By maintaining a record of provenance information throughout the software supply chain, organizations can improve their 
ability to detect and mitigate security risks, reduce the likelihood of supply chain attacks, and increase the overall 
reliability and quality of their software products.

Furthermore, regulatory compliance requirements, such as those related to data privacy, data protection, and intellectual 
property, often mandate the use of provenance tracking to ensure compliance with legal and ethical standards.

## Pedigree
CycloneDX can represent component pedigree including ancestors, descendants, and variants which describe component 
lineage from any viewpoint and the commits, patches, and diffs which make it unique. The addition of a digital signature
applied to a component with detailed pedigree information serves as affirmation to the accuracy of the pedigree.

Maintaining accurate pedigree information is especially important with open source components whos source code is readily
available, modifiable, and redistributable. Identifying changes to a component or a components coordinates along with 
information describing the original component, may be necessary for the analysis of various forms of risk.

## Foreign Ownership, Control, or Influence (FOCI)
Foreign Ownership, Control, or Influence (FOCI) is a critical concern in the software supply chain that should be taken 
seriously by all organizations involved. FOCI refers to the degree to which foreign entities have control or influence
over the operations or assets of companies in another governments' jurisdiction. FOCI is a term specific to the U.S., but
many world governments have similar concepts.


## Architectural Analysis

## Export Compliance
CycloneDX can help organizations achieve export compliance in the software supply chain by providing a comprehensive 
inventory of all software components used in a product, including their origin, version, and licensing. This information 
can enable organizations to identify potential export control issues, such as the use of components developed in foreign
countries or containing encryption technology, and take appropriate measures to ensure compliance. 

## Packaging and Distribution

## Supplier Risk Assessment
Project risk

## Vulnerability Remediation

## Security Advisories

## Formulation Assurance and Verification



<div style="page-break-after: always; visibility: hidden">
\newpage
</div>