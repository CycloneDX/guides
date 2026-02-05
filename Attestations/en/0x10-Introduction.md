# Introduction
CycloneDX Attestations is a modern standard for security compliance. It enables organizations to use a machine-readable format for communication about security standards, claims, and evidence about security requirements, as well as attestations to the veracity and completeness of those claims. You can think of Attestations as a way to manage "compliance as code." The Attestations project began in 2023 as part of the broader CycloneDX project.

CycloneDX Attestations is part of OWASP CycloneDX. CycloneDX is an OWASP flagship project, has a formal standardization
process and governance model through [Ecma Technical Committee 54](https://tc54.org), and is supported by the global
information security community.

## Intended Audience
CycloneDX Attestations is intended for use by:
* Software development teams that want to meet security requirements and automate security evidence generation and communication.
* Security teams that want to ensure the security and compliance of software projects being created and manage the compliance process with assessors.
* Executives who are required to attest to their compliance with security standards.
* Security assessors that want to have a standard way of processing compliance documentation and tracking compliance.
* Security tool providers that build software for managing compliance processes.
* Security standard creators that want to create a machine-readable version of their requirements.

## Problem Statement
Currently, organizations use a variety of paper-based and non-standard electronic documents to communicate security requirements, evidence, and attestations. The labor required to create, process, manage, update, and track these documents is expensive, labor-intensive, and often overwhelming. There are often large gaps between what the original requirement envisioned and the argument presented by the software producer. Similarly, assessors often misinterpret requirements and focus on minutae instead of the intent of the original requirement.

The problem is widespread, and many [articles](https://www.google.com/search?q=compliance+is+not+security) explain why compliance is not the same as security. If the security requirements represented the shared security interests of all stakeholders, then security and compliance would be aligned. Unfortunately, in most cases, at least some of the requirements make no sense to apply to a product, and many critical aspects of security are not reflected in the requirements.

The root cause of these issues is a fundamental communications problem. Security requirements don't often match up well with the expected threats for a particular real-world system and its defenses. Further, security requirements are often too abstract for development organizations to clearly understand what they must do with their particular organization, processes, and technologies. The assessors who should be facilitating the interpretation of the requirements in the context of the actual system are often relegated to a strict interpretation of the words in vague, high-level requirements.

Our challenge is encouraging standards bodies, builders, and assessors to communicate effectively. All the parties need a way to ensure that the *intent* of each requirement is applied appropriately to a particular product or system and achieved with confidence.

## How CycloneDX Attestations Addresses Challenge
While CycloneDX Attestations may not completely eradicate this issue, they offer a solution that significantly reduces the paperwork burden. CycloneDX Attestations fosters a more efficient and streamlined interaction process by facilitating communication in a standard, machine-readable format.

We believe:

* The use of machine-readable standards in Attestations format will encourage faster and deeper understanding by all parties.
* The Attestations claims and evidence approach will allow development organizations to articulate their compliance rationale quickly and clearly.
* The use of Attestations will enable all forms of assessors, certifiers, and accreditors to quickly evaluate compliance and provide feedback to producers.
* Attestations will enable faster compliance feedback loops and fewer surprises and delays.

## Intended Use Cases

CycloneDX Attestations provides a non-repudiatable way to communicate compliance to standards. It is intended to be used in a variety of use cases, including:

* **Standard authorities**: Authors of security standards that want to create a machine-readable version of their requirements. For example, CycloneDX may be used to represent the requirements of the U.S. Cybersecurity Infrastructure Security Agency's [CISA Secure Software Attestation Form](https://www.cisa.gov/secure-software-attestation-form) for federal agencies or information required by the [EU Artificial Intelligence (AI) Act](https://artificialintelligenceact.eu/).
* **Providers in highly regulated verticals**: Adherence to existing regulatory and industry compliance requirements like [PCI DSS](https://www.pcisecuritystandards.org/standards/pci-dss/), [HIPAA](https://www.hhs.gov/hipaa/index.html), [NIST](https://www.nist.gov/), etc.; CycloneDX can be used to provide non-repudiatable evidence of compliance.
* **Providers building customer trust**:  Providers who wish to demonstrate compliance with a specific security standard and/or adherence to a specific security standard via references, evidence and other information provided within BOMs.
* **Governance, Risk, and Compliance (GRC) teams**:  GRC teams who want to use CycloneDX to assess adherence to their policies, security standards and requirements as well as supporting the automation of compliance processes.
* **Engineering teams** - Engineering teams who collect and manage evidence of compliance with internal security standards using CycloneDX BOMs.
* **Consumers** who want to restrict the use of AI/ML software and models to only those that meet specific security standards.

## Tool Support
Over time, we expect tools to emerge to manage all aspects of security attestation. As a producer, imagine being able to select appropriate standards for a project, eliminate duplication, articulate compliance rationales, automatically generate and include supporting evidence, manage reviews, and digitally sign attestations. From the assessor's point of view, imagine being able to quickly evaluate claims and evidence, easily identify changes, point out gaps, and digitally sign approvals.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

