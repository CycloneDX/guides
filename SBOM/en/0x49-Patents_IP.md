# Patents and Intellectual Property
Intellectual property (IP) plays a critical role in the supply chain. As products increasingly incorporate patented 
technologies, organizations require a structured, verifiable way to identify and declare those patents. CycloneDX 
provides a framework for representing patents and related assertions across software, hardware, services, and operational
workflows. Developed in collaboration with the [World Intellectual Property Organization](https://www.wipo.int/) (WIPO) 
and aligned with the [ST.96](https://www.wipo.int/standards/en/st96) international patent data standard, CycloneDX 
enables precise modelling of individual patents, patent families, and ownership assertions. 

## Key Use Cases for Intellectual Property Transparency
The following use cases highlight how CycloneDX enables organizations to manage patent-related risks and improve 
transparency across the software and hardware supply chain. 

### IP Risk Assessment During Procurement
Organizations use CycloneDX to identify whether components, services, or processes are covered by patents, especially 
when sourcing from third parties. This helps procurement teams assess legal exposure, validate IP indemnification 
clauses, and reduce the risk of inadvertent patent infringement before products are acquired or integrated.

### Patent Assertions for Commercial Software
Vendors declare patents they own or license in relation to their software or services. This establishes clear ownership,
enables downstream customers to assess compliance obligations, and reduces ambiguity that might otherwise lead to 
licensing disputes or delayed adoption of products.

### Export Control and Jurisdictional Compliance
Many national export regulations apply to patented technologies, particularly in areas such as cryptography, 
telecommunications, and dual-use capabilities. By modeling patents and patent families in CycloneDX, organizations can
identify components subject to export control and make informed decisions about licensing, disclosure, or market access.

### Mergers, Acquisitions, and Due Diligence
When evaluating acquisition targets or entering strategic partnerships, legal and engineering teams use CycloneDX BOMs
to audit declared patents and their applicability to critical systems. This improves due diligence accuracy, surfaces
potential IP conflicts early, and facilitates cleaner integration of assets post-transaction.

### Supply Chain Dispute Resolution and Auditability
Disagreements over patent usage or ownership can delay deployments, disrupt services, or result in legal action. 
CycloneDX enables each entity in the supply chain to document and share structured patent assertions, reducing ambiguity
and creating a verifiable, timestamped audit trail for IP-related claims.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

## Individual Patents
Transparency in intellectual property is essential to mitigating risk and enabling responsible innovation. In complex 
supply chains, where components may originate from multiple sources and jurisdictions, understanding which patents apply
to a given product or process is key to avoiding disputes and ensuring legal clarity. 

```json
"patents": [
  {
    "bom-ref": "patent-1",
    "patentNumber": "US1234567890",
    "applicationNumber": "12345",
    "jurisdiction": "US",
    "publicationNumber": "US-12345",
    "title": "Efficient Data Processing Algorithm",
    "abstract": "A novel system and method for improving data processing efficiency.",
    "filingDate": "2021-01-15",
    "grantDate": "2022-06-01",
    "patentExpirationDate": "2042-01-15",
    "patentLegalStatus": "in-force",
    "patentAssignee": [ 
      {
        "name": "Example, Inc.",
        "url": [ "https://example.com" ]
      }
    ],
    "externalReferences": [
      {
        "type": "patent",
        "url": "https://uspto.gov/patent/US12345678B1",
        "comment": "Official USPTO page for the patent."
      }
    ]
  }
]
```

## Patent Families
Many patents are not standalone filings but form part of broader families that span jurisdictions. Tracking these
relationships, is vital for due diligence, ownership analysis, and compliance. CycloneDX supports the declaration of 
both individual patents and structured patent families, referencing authoritative sources where possible.

The following example ties multiple patents together into a family.

```json
"patents": [
  {
    "bom-ref": "patent-family-1",
    "familyId": "PF-2023001",
    "priorityApplication": {
      "applicationNumber": "12345",
      "jurisdiction": "US",
      "filingDate": "2021-01-15"
    },
    "members": ["patent-1", "patent-2"]
  }        
]
```

## Ownership Assertions
Clarity in patent ownership and usage rights is essential to fostering trust. CycloneDX supports the explicit assertion 
of patent rights, allowing organizations to declare ownership, licensing status, or usage claims for patented 
technologies. These assertions can be linked to specific components, services, or stages in a formulation process, 
enabling precise modeling of IP coverage.

```json
"patentAssertions": [
  {
    "bom-ref": "patent-assertion-1",
    "assertionType": "ownership",
    "asserter": "org-acme-inc",
    "patentRefs": [ "patent-1" ],
    "notes": "Covers the core processing architecture for advanced computation."
  },
  {
    "bom-ref": "patent-assertion-2",
    "assertionType": "license",
    "asserter": "org-acme-inc",
    "patentRefs": [ "patent-3" ],
    "notes": "Licensed for use in North America."
  }
]
```

### Patent Assertion Types
Patent assertions in CycloneDX apply broadly across components, services, and formulation processes, and even to 
specific steps within those processes. This allows precise modeling of ownership or licensing at the point where 
innovation occurs, whether in code, infrastructure, or a manufacturing pipeline.

| **Assertion Type** | **Description**                                                                                               |
|---------------------------|---------------------------------------------------------------------------------------------------------------|
| ownership                 | The manufacturer asserts ownership of the patent or patent family.                                            |
| license                   | The manufacturer asserts they have a license to use the patent or patent family.                              |
| third-party-claim         | A third party has asserted a claim or potential infringement against the manufacturer’s component or service. |
| standards-inclusion       | The patent is part of a standard essential patent (SEP) portfolio relevant to the component or service.       |
| prior-art                 | The manufacturer asserts the patent or patent family as prior art that invalidates another patent or claim.   |
| exclusive-rights          | The manufacturer asserts exclusive rights granted through a licensing agreement.                              |
| non-assertion             | The manufacturer asserts they will not enforce the patent or patent family against certain uses or users.     |
| research-or-evaluation    | The patent or patent family is being used under a research or evaluation license.                             |


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
