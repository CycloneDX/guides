# Appendix A: Methodology Mappings

The threat model is methodology-neutral, but practitioners work in specific methodologies, so the mappings below tie the common ones to concrete constructs. The mappings are informative, and a methodology's own literature is authoritative for the methodology.

## STRIDE

STRIDE classifies threats by violated property: spoofing, tampering, repudiation, information disclosure, denial of service, elevation of privilege.

| STRIDE element | CycloneDX construct |
|---|---|
| Per-element analysis | Blueprint assets, flows, and boundaries as the decomposition, and `threat.affectedAssets` attaches threats to elements |
| The six categories | `threat.categories` with `taxonomy: "STRIDE"`, each category naming the violated property in its meta |
| Compromised property as data | `threatScenario.riskAttributes`, referencing the risk attribute vocabulary |
| Mitigations | `threat.mitigations` to controls |

STRIDE-per-element treats external entities, processes, data stores, and data flows differently: model external entities as `actor` assets bound to parties, and the rest as their asset types. The applicability matrix (which categories apply to which element class) is a completeness aid a tool can layer on, and the schema permits any threat to point at any element.

## STRIDE-LM

STRIDE-LM is STRIDE plus lateral movement, and everything in STRIDE applies. Lateral movement is the one construct STRIDE alone cannot express, and it is the `attackPath`: an ordered sequence of steps, each naming a technique, a kill-chain phase, source and destination elements, and the boundary crossed. Acme's attack path is a STRIDE-LM lateral-movement chain: edge, to application, to data, through the agent.

## LINDDUN

LINDDUN classifies privacy threats: linkability, identifiability, non-repudiation, detectability, disclosure of information, unawareness, non-compliance.

| LINDDUN element | CycloneDX construct |
|---|---|
| The seven categories | `threat.categories` with `taxonomy: "LINDDUN"` |
| Data under analysis | Data profiles on blueprint flows and data sets: classification, information types, subjects, purposes, jurisdictions |
| Privacy data flow | Blueprint flows carrying `dataProfiles` across boundaries |
| Consequence | Risk impact categories including `privacy`, `human-rights`, `discrimination` |

For the LINDDUN workflow in full, from data profiles through privacy threats to impact categories, refer to the Analyzing Privacy chapter.

## PASTA

PASTA runs seven stages, risk-centric and business-aligned, from business objectives through risk and impact.

| PASTA stage | CycloneDX construct |
|---|---|
| 1. Business objectives | `businessObjective` in definitions, `relatedBusinessObjectives` on threats and risks, and risk appetite |
| 2. Technical scope | Components, dependencies, blueprint, formulation |
| 3. Application decomposition | Blueprint assets, flows, zones, and boundaries, plus actors and use cases |
| 4. Threat analysis | `threatScenario` actor, profile, motivation, and intent, and attack patterns with CAPEC and ATT&CK |
| 5. Vulnerability analysis | `threat.relatedVulnerabilities`, the shared weakness model, and risk `relatedVulnerabilities` |
| 6. Attack modeling | Attack trees (AND/OR), attack paths, kill-chain phases |
| 7. Risk and impact | The full risk model: three ratings, factor decomposition, scoring methodologies, responses, controls |

PASTA's business-alignment first stage is served by business objectives and explicit risk appetite. Its vulnerability-to-threat mapping is served by the shared weakness model and the direct `relatedVulnerabilities` links.

## MAESTRO and Agentic AI

MAESTRO models agentic AI across seven layers: foundation models, data operations, agent frameworks, deployment and infrastructure, evaluation and observability, security and compliance, and the agent ecosystem.

| MAESTRO element | CycloneDX construct |
|---|---|
| The seven layers | `threat.categories` with `taxonomy: "MAESTRO"` |
| Agent, model, tool structure | Blueprint asset types `agent`, `model`, `tool` |
| Delegated authority | Party `system` kinds (`agent`, `bot`, `automation`) and `delegatedBy` relation |
| Agent behavior | Behavior instances and graphs against the `ai:` taxonomy family |
| Agentic threats | The prompt-injection threat in the example, dual-classified MAESTRO and STRIDE |
| ML and AI risk | Risk impact categories `bias`, `discrimination`, and `fairness`, plus assessment types `ai-impact`, `model-risk`, and `fundamental-rights-impact` |

For the MAESTRO-aware workflow operating as a composite across all six documents, refer to the Governing AI Systems chapter.

## Classification Systems

MITRE ATT&CK, CAPEC, and kill chains are classification systems the model references rather than methodologies it enacts. ATT&CK tactics are a `categories` taxonomy, and ATT&CK techniques appear on attack patterns and path steps. CAPEC identifiers appear on attack patterns. The seven kill-chain phases are a shared enumeration on threats and path steps. A threat can carry a STRIDE category and an ATT&CK category at once, which is the multi-taxonomy design.

## Custom Methodologies

A methodology not listed here is expressed through the custom branches: a custom entry in the `methodologies` list, and custom-object categories where the taxonomy-gated enums do not fit. The model does not privilege the methodologies above. It gives them first-class vocabulary because they are common, and it gives everything else the same custom escape the rest of the stack uses.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
