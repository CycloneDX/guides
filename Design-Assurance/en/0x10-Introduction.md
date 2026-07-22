# Introduction

CycloneDX is a modern standard for the software supply chain: a general-purpose Transparency Expression Language and Bill of Materials (BOM) standard representing software, hardware, services, cryptography, and other types of inventory, ratified as ECMA-424 by Ecma International. It is an OWASP flagship project with a formal standardization process and governance model through [Ecma Technical Committee 54](https://tc54.org) (TC54). The global information security community builds, reviews, and extends it.

## Design Philosophy and Guiding Principles

The simplicity of design is at the forefront of the CycloneDX philosophy, and the format is easily understandable by technical and non-technical roles alike. CycloneDX has many advanced capabilities that are achieved without sacrificing the design philosophy. Some guiding principles influencing its design include:

* Be easy to adopt and easy to contribute to
* Identify risk to as many adopters as possible, as quickly as possible
* Avoid blockers that prevent the identification of risk
* Continuous improvement: innovate quickly and improve over time
* Encourage innovation and competition through extensions
* Produce immutable and backward-compatible releases
* Focus on high degrees of automation
* Provide a smooth path to specification compliance through prescriptive design

## Defining Design and Assurance

Design and assurance is the CycloneDX model family that records how a system is designed and why anyone should trust it. The design half describes the system: its architecture as a blueprint of assets, zones, boundaries, and flows, its intended use as machine-readable use cases and requirement declarations, its data as stores, sets, and profiled records, and its behavior as declared and observed activity coded against a shared taxonomy. The assurance half analyzes and answers for it: threats and the scenarios that realize them, risks rated and traced to business objectives, controls with implementation status and effectiveness, assessments, attestations, and vulnerability responses substantiated by evidence.

The family gives structured form to work that regulators and frameworks already demand. The NIST Secure Software Development Framework (SSDF, SP 800-218) directs organizations to design software to meet security requirements and to use threat modeling to assess risk during design. The European Union's Cyber Resilience Act requires a cybersecurity risk assessment as part of a product's technical documentation, and the EU AI Act requires a risk management system for high-risk AI systems. The Threat Modeling Manifesto frames the analytical practice as four questions: "What are we working on? What can go wrong? What are we going to do about it? Did we do a good job?" The design models answer the first question, the assurance models answer the remaining three, and every answer is data.

## The Role of Design and Assurance in Security Transparency

Security analysis today rarely survives its tooling: architecture diagrams live in one vendor's format, threat model findings in spreadsheets, risk registers in GRC platforms, and control catalogs in compliance tools, with no standard way to exchange any of them. When a modeler leaves or a tool is retired, the reasoning is lost, and auditors receive screenshots. Consumers of software receive assertions they cannot verify, and AI systems ship with intended behavior described in marketing prose rather than in a form a runtime monitor can check.

CycloneDX addresses this the same way SBOMs addressed component inventory: by making the artifacts data. A threat model, a risk register, or a control inventory becomes a structured, signed, referenceable document that validates against a schema. Documents reference one another by BOM-Link, so an assessor's findings can point into a supplier's control inventory without either party copying the other's data. Claims ride on the CycloneDX Attestations (CDXA) evidence machinery, so "mitigated" names the mitigating control and "not affected" carries the analysis behind it. Analysis becomes portable across tools, teams, and time.

## High-Level Use Cases

The models cover sixteen use cases in four groups. The first group describes the system: identifying the parties who act, inventorying an application, documenting its architecture, and modeling its data stores and data sets. The second group analyzes it: declaring intended use and requirements, describing declared and observed behavior, threat modeling, modeling attacks, and analyzing privacy.

The third group demonstrates what is done: maintaining a risk register, setting risk appetite and tracing objectives, managing controls and demonstrating compliance, reusing characterizations through profiles, assessing and attesting, and reporting and responding to vulnerabilities, and the fourth composes the pieces, up to and including governing an AI system with the whole model family engaged at once.

| Use case | Primary models |
|---|---|
| Identify who and what acts | party |
| Inventory an application and what it does | component, dependency, assertions |
| Document system architecture | blueprint |
| Model data stores and data sets | data, blueprint |
| Declare intended use and requirements | useCase, requirement, businessObjective |
| Describe behavior, declared and observed | behavior, taxonomy |
| Threat model a system | threat, weakness |
| Model attacks | attack patterns, trees, paths, abuse cases |
| Analyze privacy | data profiles |
| Maintain a risk register | risk |
| Set risk appetite and trace objectives | risk appetite, businessObjective |
| Manage controls and demonstrate compliance | control, standard |
| Reuse characterizations | profile |
| Assess and attest | assessment, declarations |
| Report and respond to vulnerabilities | vulnerability, evidence, weakness, control |
| Govern AI systems | the whole model family |

## Capabilities

The capability set was built as one composable family, and nearly every member is useful alone. A control inventory serves a compliance team that never opens a threat model, and a behavior document serves a detection engineer who does not price risk. An architecture blueprint serves an incident responder who wants none of the analysis. The party model underpins nearly everything: one identity vocabulary covers suppliers, authors, assessors, autonomous agents, and adversaries alike.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
