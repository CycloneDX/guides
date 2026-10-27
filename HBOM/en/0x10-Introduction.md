# Introduction

CycloneDX is a modern standard for the software supply chain: a general-purpose Bill of Materials (BOM) standard representing software, hardware, services, cryptography, and other types of inventory, ratified as ECMA-424 by Ecma International. It is an OWASP flagship project with a formal standardization process and governance model through [Ecma Technical Committee 54](https://tc54.org) (TC54), and the global information security community builds, reviews, and extends it.

## Design Philosophy and Guiding Principles

The simplicity of design is at the forefront of the CycloneDX philosophy, and the format is easily understandable by technical and non-technical roles alike. CycloneDX is a full-stack BOM format with many advanced capabilities that are achieved without sacrificing the design philosophy. Some guiding principles influencing its design include:

* Be easy to adopt and easy to contribute to
* Identify risk to as many adopters as possible, as quickly as possible
* Avoid blockers that prevent the identification of risk
* Continuous improvement: innovate quickly and improve over time
* Encourage innovation and competition through extensions
* Produce immutable and backward-compatible releases
* Focus on high degrees of automation
* Provide a smooth path to specification compliance through prescriptive design

## Defining Hardware Bill of Materials

A Hardware Bill of Materials (HBOM) is a structured inventory of the physical components in a product: the parts, their manufacturers and suppliers, their placements, and the attributes a buyer or assessor needs to judge risk. The CISA Hardware Bill of Materials Framework for Supply Chain Risk Management, published by the ICT Supply Chain Risk Management Task Force, calls for "a consistent naming methodology for attributes of components, a format for identifying and providing information about the different types of components, and guidance of what HBOM information is appropriate depending on the purpose for which the HBOM will be used." CycloneDX implements that call in a machine-readable form and extends it with sourcing, substitution, certification, and part-authenticity data.

Regulation and industry practice both drive the demand for structured hardware inventory data. The European Union's Cyber Resilience Act applies to products with digital elements, hardware included, and requires supply chain due diligence as part of a product's technical documentation. Section 889 of the United States National Defense Authorization Act for Fiscal Year 2019 prohibits federal agencies from procuring covered telecommunications equipment, a determination that requires knowing who made every part. SAE AS5553 defines counterfeit avoidance practices for electronic parts, and SAE AS6171 defines the test methods that detect them. Defense procurement rules such as DFARS 252.225-7009 restrict where specialty metals may be melted, and Section 1502 of the Dodd-Frank Act with the OECD Due Diligence Guidance requires identifying the smelters behind tin, tantalum, tungsten, and gold. Each of these asks a question that only structured hardware inventory data can answer at scale.

## The Role of HBOM in Hardware Supply Chain Transparency

Hardware inventory data exists today, but it rarely travels. Engineering and manufacturing bills of materials live in PLM and ERP systems, approved vendor lists in procurement spreadsheets, certificates in filing cabinets and PDF scans, and country-of-origin data in customs declarations. Each system speaks its own dialect, so a buyer who asks "who made every part on this board, where, and who owns those companies" assembles the answer by hand, and the answer is stale the day it ships.

CycloneDX carries that data in one signed, validatable document, where every part is a component with its manufacturer, suppliers, identifiers, classification, and placement. Approved alternates are recorded as choices with defined logic rather than as footnotes in a drawing.

## High-Level HBOM Use Cases

Procurement and sourcing teams record the manufacturer and the ranked suppliers of every part, so primary and secondary sources are data rather than tribal knowledge. Design and manufacturing teams record approved alternates and substitution groups, including the case where one integrated part and a group of discrete parts produce the same end product.

Risk and compliance teams compute origin exposure: what percentage of a board's parts come from which countries, and which manufacturers are owned or influenced by foreign parents. The same inventory answers certification questions, from radio equipment marks to automotive qualification, with an optional evidence trail. Incoming inspection and anti-counterfeit programs record how a part's identity was verified, down to the photograph of the markings on a chip. Vendor risk programs score suppliers from the documents they collect, quality programs scope a recall by placement and identifier, and an acquirer reads a target's HBOMs during due diligence.

| Use case | Primary capabilities |
|---|---|
| Inventory a physical product | device components, nested assemblies, classification, board location, package type |
| Support procurement and receiving | identifiers, ranked suppliers, lead time, classification codes |
| Identify manufacturers and suppliers | party, roles with preference order, identifiers |
| Record approved alternates and substitutions | component-choice with OR, XOR, and AND logic |
| Analyze origin and foreign influence | origins, party jurisdiction, addresses, parent relations |
| Trace materials to their source | material, origins with stages, performedBy |
| Demonstrate certification | certification, CycloneDX Attestations (CDXA) |
| Verify part authenticity | identity evidence, physical analysis techniques |
| Manage availability | lead time, ranked suppliers, alternates |
| Manage vendor risk | ranked suppliers, origins, certifications, party jurisdiction |
| Scope recalls and field failures | identifiers, board location, physical blueprints |
| Screen an acquisition target | origins, parent relations, certifications, lead time |

## Capabilities

Four capabilities underpin every one of these use cases, and an HBOM that carries only these already answers most procurement, inventory, and recall questions:

* Parts and substances as components: the `device` type for finished parts and the `material` type for raw and processed substances.
* Assemblies and placements: nested `components` state what each assembly contains, and reference designators locate every placement of a part on a board.
* Parties with roles: one party model names manufacturers, suppliers, distributors, and assemblers, and a preference `order` ranks primary and secondary sources.
* Attributed identifiers: manufacturer part numbers, supplier part numbers, order numbers, and serial numbers each name the party that asserts them.

Every other capability attaches to those records. For inventory, a part carries a hierarchical classification with codes from external taxonomies such as HS, NAICS, and JEDEC, its package and mounting style, its supplier lead time, and for a material, the form in which it is supplied. A physical blueprint records what an assembly hierarchy cannot: how separately shipped products connect, and the power and signals that flow between them.

Component substitution is a design consideration, and the specification records it as one. A component-choice wrapper lists the approved alternates for a position and states whether exactly one (XOR), any combination (OR), or all together (AND) may be installed, with the form, fit, and function rationale on the wrapper. Choices nest, so a design can approve one integrated part or a group of discrete parts for the same function, and a document describing a built unit resolves each choice to the part actually installed.

Declared origins state where a component or material came from as percentage distributions on a stated basis, with the total the percentages divide, scoped to stages from mined and smelted through manufactured, and with the performing party named per share. For assurance, certifications attach to any component and can cite CycloneDX Attestations (CDXA) claims. The evidence model records how a part's identity was verified, including visual inspection, x-ray inspection, electrical testing, material analysis, and decapsulation, with photographs, radiographs, and test reports attached and classified by sensitivity. Every document can be signed and carries its own distribution constraints.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
