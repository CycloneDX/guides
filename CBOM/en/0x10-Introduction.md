# Introduction

CBOM:
NIST:
SP: https://www.nccoe.nist.gov/sites/default/files/2023-12/pqc-migration-nist-sp-1800-38b-preliminary-draft.pdf
Lines 536 and 952 onwards
as part of NCCOE effort
Apache 2.0 - attribute IBM





CycloneDX Attestations is a modern standard for security compliance. CycloneDX Attestations enable organizations with a machine-readable format for communication about security standards, claims and evidence about security requirements, and attestations to the veracity and completeness of those claims. You can think of Attestations as a way to manage "compliance as code." The Attestations project began in 2023 as part of the broader CycloneDX project.

CycloneDX Attestations is a part of the OWASP CycloneDX project. CycloneDX is an OWASP flagship project, has a formal standardization process and governance model, and is supported by the global information security community.

## Intended Audience
CycloneDX Attestations is intended for use by:
* Software development teams that want to meet security requirements and automate security evidence generation and communication
* Security teams that want to ensure the security and compliance of software projects being created, and manage the compliance process with assessors.
* Executives who are required to attest to their compliance with security standards.
* Security assessors that want to have a standard way of processing compliance documentation and tracking compliance.
* Security tool providers that build software for managing compliance processes.
* Security standard creators that want to create a machine-readable version of their requirements.

## Problem Statement
Currently, organizations use a variety of paper-based and non-standard electronic documents to communicate about security requirements, evidence, and attestation. The labor required to create, process, manage, update, and track these documents is expensive, labor-intensive, and often overwhelming. Not surprisingly, the results are generally underwhelming. There are often large gaps between what the original requirement envisioned and the argument presented by the software producer.  Similarly, assessors often misinterpret requirements and focus on minutae instead of the intent of the original requirement.

The problem is so bad there are endless [articles](https://www.google.com/search?q=compliance+is+not+security) explaining why compliance is not the same as security. This is unfortunate.  If the security requirements really represented the shared security interests of all stakeholders, then security and compliance would be aligned. Unfortunately, in most cases, at least some of the requirements make no sense to apply to the product, and many critical aspects of security are not reflected in the requirements.

The root cause of these issues is a fundamental communications problem. Security requirements don't often match up well with the expected threats for a particular real-world system and its defenses. Further, security requirements are often far too abstract for development organizations to clearly understand what they must do with their particular organization, processes, and technologies. The assessors that should be facilitating the interpretation of the requirements in the context of the actual system are often relegated to strict interpretation of the words in vague, high-level requirements.

Our challenge is to encourage standards bodies, builders, and assessors to communicate effectively. All the parties need a way to ensure that the *intent* of each requirement is applied appropriately to a particular product or system and achieved with confidence.

## How CycloneDX Attestations Addresses Challenge
Of course, CycloneDX Attestations can't solve this problem entirely. However, by allowing all parties to communicate in a standard machine-readable format, we hope to encourage more productive interaction and far less paperwork.

We believe:

* The use of machine-readable standards in Attestations format will encourage faster and deeper understanding by all parties.
* The Attestations claims and evidence approach will allow development organizations to articulate their compliance rationale quickly and clearly
* The use of Attestations will enable all forms of assessors, certifiers, and accreditors to more quickly evaluate compliance and provide feedback to producers
* Attestations will enable faster compliance feedback loops and less surprises and delays

## Intended Use Cases
// TODO
// * Supplier to consumer use case where the consumer requires adherence to something (e.g. SSDF)
// * Internal use case where an internal policy is created from requirements defined in CDXA
// * Regulatory and industry compliance requirements

## Tool Support

Over time, we expect better tools for managing all aspects of security attestation to emerge. As a producer, imagine being able to select appropriate standards for a project, eliminate duplication, articulate compliance rationales, automatically generate and include supporting evidence, manage reviews, and digitally sign attestations. From the assessor point of view, imagine being able to quickly evaluate claims and evidence, easily identify changes, point out gaps, and digitally sign approvals.

## Join Us

If you are interested in using CycloneDX Attestations or want to help us realize our vision, please join us!

https://www.youtube.com/@CycloneDX
https://owasp.org/www-project-cyclonedx/
https://cyclonedx.org/about/participate/

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

