# Use Cases
Applications For Using SBOMs

User managed software, IoT, IIoT, developer (p.24)

## Inventory
A complete and accurate inventory of all first-party and third-party components is essential for risk identification. 
BOMs should ideally contain all direct and transitive components and the dependency relationships between them.

CycloneDX is capable of describing the following types of components:

| **Type**               | **Class** | **Description**                                                                                                                                                                                                                                                                                                 |
|------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Application            | Component | A software application                                                                                                                                                                                                                                                                                          |
| Container              | Component | A packaging and/or runtime format, not specific to any particular technology, which isolates software inside the container from software outside of a container through virtualization technology.                                                                                                              |
| Data                   | Component | A collection of discrete values that convey information.                                                                                                                                                                                                                                                        |
| Device                 | Component | A hardware device such as a processor, or chip-set. A hardware device containing firmware SHOULD include a component for the physical hardware itself, and another component of type 'firmware' or 'operating-system' (whichever is relevant), describing information about the software running on the device. |
| Device Driver          | Component | A special type of software that operates or controls a particular type of device.                                                                                                                                                                                                                               |
| File                   | Component | A computer file.                                                                                                                                                                                                                                                                                                |
| Firmware               | Component | A special type of software that provides low-level control over a devices hardware.                                                                                                                                                                                                                             |
| Framework              | Component | A software framework                                                                                                                                                                                                                                                                                            |
| Library                | Component | A software library. Many third-party and open source reusable components are libraries. If the library also has key features of a framework, then it should be classified as a framework. If not, or is unknown, then specifying library is RECOMMENDED.                                                        |
| Machine Learning Model | Component | A model based on training data that can make predictions or decisions without being explicitly programmed to do so.                                                                                                                                                                                             |
| Operating System       | Component | A software operating system without regard to deployment model (i.e. installed on physical hardware, virtual machine, image, etc)                                                                                                                                                                               |
| Platform               | Component | A runtime environment which interprets or executes software. This may include runtimes such as those that execute bytecode or low-code/no-code application platforms.                                                                                                                                           |
| Service                | Service   | A service including microservices, function-as-a-service, and other types of network or intra-process services.                                                                                                                                                                                                 |


> The component type is a required property for every component. It is an abstract concept to aid with separation of 
> concerns. For example, a development team focused on application creation may not be the same team responsible for 
> maintaining container images or operating systems. When viewing components and their dependency relationships, 
> component type helps to identify inventory that may be in scope for that team, and the inventory that may not.


Component identity is an essential requirement for managing inventory. CycloneDX supports multiple methods of identity
including:

- Coordinates: The combination of the group, name, and version fields form the coordinates of a component.
- Package URL: [Package URL](https://github.com/package-url/purl-spec) (PURL) standardizes how software package metadata is represented so that packages can universally be identified and located regardless of what vendor, project, or ecosystem the packages belongs. 
- SWID: Software ID (SWID) as defined in [ISO/IEC 19770-2:2015](https://www.iso.org/standard/65666.html) is used primarily to identify installed software.
- CPE: The [Common Platform Enumeration](https://nvd.nist.gov/products/cpe) (CPE) specification was designed for operating systems, applications, and hardware devices. CPE is maintained by the NVD.

Assertion of identity can also be substantiated in the form of evidence, which include the methods and techniques used 
during analysis, the confidence, and the tool(s) that performed the analysis. Refer to the "Evidence" chapter for more
information.

The follow example illustrates component identity in CycloneDX.

```json
"components": [
  {
    "type": "library",
    "group": "org.apache.tomcat",
    "name": "tomcat-catalina",
    "version": "9.0.14",
    "cpe": "cpe:2.3:a:acme:awesome:1.0.0:*:*:*:*:*:*:*",
    "purl": "pkg:maven/com.example/awesome-library@1.0.0",
    "swid": {
      "tagId": "swidgen-242eb18a-503e-ca37-393b-cf156ef09691_1.0.0",
      "name": "Acme Awesome Library",
      "version": "1.0.0",
      "text": {
        "contentType": "text/xml",
        "encoding": "base64",
        "content": "U1dJRCBkb2N1bWVudCBkb2VzIGhlcmU="
      }
    }
  }
]
```

CycloneDX also supports several identifiers specific to hardware devices. Refer to https://cyclonedx.org/capabilities/hbom/
for more information.

## Vulnerability Management
CycloneDX is ideal for vulnerability management and impact analysis through support of comprehensive inventory and
assertions of component identity. With this information, security teams can identify which components are affected
by known vulnerabilities, estimate effort, and quickly prioritize remediation efforts.

By leveraging CycloneDX in this way, organizations can enhance their software supply chain security and reduce the
risks associated with software vulnerabilities.

> Identifying known vulnerabilities in components can be achieved through the use of three fields: `cpe`, `purl`, and
`swid`. Not all fields apply to all types of components. Components that have a cpe, purl, or swid defined can be analyzed
for known vulnerabilities.

There are many tools and platforms that support vulnerability management use cases using CycloneDX, including [OWASP
Dependency-Track](https://dependencytrack.org/), often cited as a reference implementation for consuming and 
analyzing SBOMs. Using a platform such as Dependency-Track, organizations can quickly identify what is affected, and
where in their environment they are affected.

## Enterprise Configuration Management Database (CMDB)
A Configuration Management Database (CMDB) is a repository that stores information about an organization's assets, 
including hardware, software, and other components. Tracking assets in a CMDB involves collecting and maintaining 
accurate information about each asset's configuration, location, status, and relationships with other assets. This 
information helps organizations manage their assets more effectively, including monitoring their performance, 
identifying potential risks, and supporting incident management.

There is tremendous benefits in capturing BOMs for assets tracked in a CMDB. By including BOMs in a CMDB, organizations 
gain a more comprehensive view of their assets, which can help them make more informed decisions about managing their 
IT and OT infrastructure. Organizations that integrate SBOMs with a CMDB have the broadest array of possible use cases 
including DevOps, vendor risk management, procurement, vulnerability response, supply chain management, among others.

## Integrity Verification
Integrity verification is the process of ensuring that the software components have not been modified or tampered with 
since they were released. This helps to identify unauthorized modifications to software components that may introduce 
security vulnerabilities or cause the software to malfunction. Integrity verification uses a cryptographic hash function 
that used to generate a unique digital fingerprint, or hash value, for each software component. The hash value can then 
be compared with the expected hash value for that component to ensure that it has not been altered.

CycloneDX can be used for integrity verification using cryptographic hashing algorithms. The specification allows for the 
inclusion of cryptographic hashes, such as SHA-256, SHA-384, or SHA-512, for each software component listed in the BOM. 
By calculating the hash of each file, package, or library, and comparing it with the hash value listed in the BOM, 
organizations can verify the integrity of the software and detect unauthorized modifications. 

The following example illustrates how to represent hashes on a component.

```json
"components": [
    {
      "type": "library",
      "name": "acme-example",
      "version": "1.0.0",
      "hashes": [{
        "alg": "SHA-256",
        "content": "d88bc4e70bfb34d18b5542136639acbb26a8ae2429aa1e47489332fb389cc964"
      },{
        "alg": "BLAKE3",
        "content": "26cdc7fb3fd65fc3b621a4ef70bc7d2489d5c19e70c76cf7ec20e538df0047cf"
      }]
    }
  ]
}
```

In addition, external references (covered later in the "Relationships" chapter) also supports hashes. The following 
example illustrates how CycloneDX can refer to an external BOM and include the hashes for that BOM. In doing so, the
integrity of the external BOM can be evaluated prior to use.

```json
"components": [
  {
    "type": "library",
    "group": "org.example",
    "name": "persistence",
    "version": "5.2.0",
    "externalReferences": [
      {
        "type": "bom",
        "url": "https://example.com/sbom.json",
        "hashes": [
          {
            "alg": "SHA-256",
            "content": "9048a24d72d3d4a1a0384f8f925566b44f133dd2a0194111a2daeb1cf9f7015b"
          }
        ]
      }
    ]
  }
]
```

CycloneDX supports SHA-1, SHA-2, and SHA-3 hashing algorithms along with BLAKE2b and BLAKE3.

By leveraging CycloneDX for integrity verification, organizations can enhance the security and reliability of their 
software applications and systems.

## Authenticity
Authenticity refers to the assurance that a component, or the BOM itself came from the expected source and has not been 
tampered with. Authenticity can be verified through the use of digital signatures and code signing certificates, which are 
issued by trusted certificate authorities. These signatures provide a way for users to verify the identity of the supplier 
and ensure that the artifact has not been modified since it was signed.

When a BOM is signed, the authenticity and integrity of the BOM can been verified by a trusted third party, such as a 
software vendor or a security researcher. This verification can provide assurance that the components listed in the BOM 
have not been tampered with or replaced with malicious components, and that the product was built with the intended 
components and dependencies. The use of a signed BOM can help increase trust and confidence in a software product, 
particularly in cases where the product is used in sensitive or critical applications.

CycloneDX supports enveloped signing including XML Signature (xmlsig) and JSON Signature Format (JSF). In addition, 
detached signatures are also supported.

## License Compliance
CycloneDX can be used for open source and commercial license compliance. By leveraging the licensing capabilities of
CycloneDX, organizations can identify any licenses that may be incompatible or require specific compliance obligations, 
such as attribution or sharing of source code. 

### Open Source Licensing
The following is an example of a components license. CycloneDX communicates this information using the SPDX license ID's 
along with optionally including a Base64 encoded representation of the full license text.

```json
"licenses": [
  {
    "license": {
      "id": "Apache-2.0",
      "text": {
        "contentType": "text/plain",
        "encoding": "base64",
        "content": "RW5jb2RlZCBsaWNlbnNlIHRleHQgZ29lcyBoZXJlLg=="
      },
      "url": "https://www.apache.org/licenses/LICENSE-2.0.txt"
    }
  }
]
```

SPDX license expressions are also fully supported.

```json
"licenses": [
  {
    "expression": "(LGPL-2.1 OR BSD-3-Clause AND MIT)"
  }
]
```

In addition to asserting the license(s) of a component, CycloneDX also supports evidence of other licenses and copyrights
found in a given component. For example:

```json
"evidence": {
  "licenses": [
    {
      "license": { "id": "Apache-2.0" }
    },
    {
      "license": { "id": "LGPL-2.1-only" }
    }
  ],
  "copyright": [
    { 
      "text": "Copyright 2012 Acme Inc. All Rights Reserved." 
    },
    { 
      "text": "Copyright (C) 2004,2005 University of Example" 
    }
  ]
}
```
Refer to the "Evidence" chapter for more information.

### Commercial Licensing
CycloneDX can also help organizations manage their commercial software licenses by providing a clear understanding of 
what licenses are in use and which ones require renewal or additional purchases, which may impact the operational aspects
of applications or systems. By leveraging CycloneDX for open source and commercial license compliance, organizations can
reduce the risks associated with license violations, enhance their license management practices, and ensure compliance 
with regulatory requirements.

The following example illustrates a commercial license for a given component. 

```json
"licenses": [
  {
    "license": {
      "name": "Acme Commercial License",
      "licensing": {
        "licensor": {
          "organization": {
            "name": "Acme Inc",
          }
        },
        "licensee": {
          "organization": {
            "name": "Example Co."
          }
        },
        "purchaser": {
          "individual": {
            "name": "Samantha Wright",
            "email": "samantha.wright@gmail.com",
            "phone": "800-555-1212"
          }
        },
        "purchaseOrder": "PO-12345",
        "licenseTypes": [ "appliance" ],
        "lastRenewal": "2022-04-13T20:20:39+00:00",
        "expiration": "2023-04-13T20:20:39+00:00"
      }
    }
  }
]
```

All commercial license fields are optional. The licensor, licensee, and purchaser may be an organization or individual.
Multiple license types may be specified and include:

| **License Type** | **Description**                                                                                                                                                   |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| academic         | A license that grants use of software solely for the purpose of education or research.                                                                            |
| appliance        | A license covering use of software embedded in a specific piece of hardware.                                                                                      |
| client-access    | A Client Access License (CAL) allows client computers to access services provided by server software.                                                             |
| concurrent-user  | A Concurrent User license (aka floating license) limits the number of licenses for a software application and licenses are shared among a larger number of users. |
| core-points      | A license where the core of a computer's processor is assigned a specific number of points.                                                                       |
| custom-metric    | A license for which consumption is measured by non-standard metrics.                                                                                              |
| device           | A license which covers a defined number of installations on computers and other types of devices.                                                                 |
| evaluation       | A license which grants permission to install and use software for trial purposes.                                                                                 |
| named-user       | A license that grants access to the software to one or more pre-defined users.                                                                                    |
| node-locked      | A license that grants access to the software on one or more pre-defined computers or devices.                                                                     |
| oem              | An Original Equipment Manufacturer license that is delivered with hardware, cannot be transferred to other hardware, and is valid for the life of the hardware.   |
| perpetual        | A license where the software is sold on a one-time basis and the licensee can use a copy of the software indefinitely.                                            |
| processor-points | A license where each installation consumes points per processor.                                                                                                  |
| subscription     | A license where the licensee pays a fee to use the software or service.                                                                                           |
| user             | A license that grants access to the software or service by a specified number of users.                                                                           |
| other            | Another license type.                                                                                                                                             |


Solutions supporting the Software Development Life Cycle (SDLC) typically involve open source license compliance or 
intellectual property use cases. Whereas Software Asset Management (SAM) is largely concerned with commercial license 
and procurement use cases. OWASP CycloneDX has extensive support for both and can be applied to any component or service
within a BOM.

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

## Vendor Risk Management

## Procurement

## Supply Chain Management

Reduce unused dependencies, standardize libraries, etc

## Supplier Risk Assessment
Project risk

## Vulnerability Remediation

## Security Advisories

## Formulation Assurance and Verification

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

## SBOM Quality
SBOMs can be analyzed for their overall usefulness for given use cases. What is a "quality" SBOM may be different 
depending on the stakeholder role and type of analysis required for that role. Quality is a multidimensional construct 
and not a single characteristic. OWASP supports a holistic view of quality. The following illustrates an example
of dimensions to consider in determining quality.

![Quality Dimensions](../../images/quality-dimensions.svg)

| **Dimension** | **Supported**                                                                                                       |
|---------------|---------------------------------------------------------------------------------------------------------------------|
| Breadth       | The coverage in the types of data represented for a component within a BOM.                                         |
| Depth         | The amount of detail or difficulty needed to represent data for a component within a BOM.                           |
| Lifecycles    | The number of lifecycles or the favorability of specific lifecycles in the creation of a BOM.                       |
| Techniques    | The approaches used to determine component identity.                                                                |
| Confidence    | The confidence of individual techniques, and the analysis of the sum of all techniques used to identity components. |

<div style="page-break-after: always; visibility: hidden">
\emptyparagraph
</div>

The [OWASP SCVS BOM Maturity Model](https://scvs.owasp.org/bom-maturity-model/) is a formal taxonomy of different types 
of data possible in a Bill of Materials along with the level of complexity or difficulty in supporting different types of 
data. The BOM Maturity Model can be used as the basis for the Breadth and Depth dimensions.

Lifecycles are supported in CycloneDX. Refer to the "Lifecycle Phases" chapter for more information. Evidence is also a 
capability of CycloneDX. Identity evidence consists of:
- The field for which the evidence describes (name, version, purl, etc)
- The overall confidence derived from all supporting evidence
- The methods which include the techniques used to determine component identity and the confidence of each technique
- The tools used which performed the analysis

Together, The BOM Maturity Model and native features of CycloneDX can be leveraged to form a high-quality, high-confidence
assessment of SBOM quality.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>