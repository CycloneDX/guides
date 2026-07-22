# Appendix C: Quick Reference

## Use Case to Model

| Use case | Root containers populated | Primary models |
|---|---|---|
| Identify parties | (used throughout) | party |
| Inventory an application | `components`, `dependencies` | component, dependency, assertions |
| Document architecture | `components`, `blueprints` | blueprint, party, data |
| Model data stores and data sets | `blueprints`, `profiles` | data, blueprint |
| Declare intent | `definitions`, `components` | useCase, requirement, businessObjective |
| Describe behavior | `blueprints` (behaviors) | behavior, taxonomy |
| Threat model | `threats`, `blueprints`, `profiles` | threat, weakness, control |
| Model attacks | `threats` | attack patterns, trees, paths, abuse cases |
| Analyze privacy | `blueprints`, `threats`, `profiles` | data, blueprint, threat |
| Manage risk | `risks` | risk, businessObjective, control |
| Risk appetite and objectives | `risks`, `definitions` | riskAppetite, businessObjective |
| Manage controls | `controls`, `definitions` | control, standard, requirement |
| Reuse profiles | `profiles` | profile |
| Assess and attest | `risks`, `declarations` | assessment, CDXA |
| Report and respond to vulnerabilities | `vulnerabilities`, `controls` | vulnerability, evidence, weakness, control |
| Govern AI | all of the above | the whole stack |

## Root Containers Added by the Design and Assurance Models

`blueprints`, `threats`, `risks`, `controls`, `profiles`, and additions to `definitions` (use cases, requirements, business objectives), all additive to the existing inventory containers.

## The Reference-direction Rule

The asserting document holds the edge: threats reference controls (`mitigations`), and controls do not list threats. Claims reference targets, and targets do not list claims, just as risk responses reference controls, and controls do not list responses. Trust boundaries reference blueprint boundaries, and boundaries do not list their trust annotations. When in doubt, the party making the assertion owns the reference.

## The Documentation-versus-realization Pairs

| Durable (documented once) | Circumstantial (per realization) |
|---|---|
| `threat` | `threatScenario` |
| `threatProfile` (capability) | scenario motivation, intent, access |
| Catalog requirement / standard | `control` instance with status |
| Data profile | flows that carry it |

## Key Vocabularies at a Glance

- Threat taxonomies (in `categories`): STRIDE, LINDDUN, MAESTRO, MITRE-ATTACK, each gating its own category values.
- Threat methodologies (approach): STRIDE, LINDDUN, PASTA, MAESTRO, OWASP, TRIKE, VAST, ATFAA, attack-tree, custom.
- Risk scoring methodologies: dread, fair, fmea, nist-sp-800-30, octave, owasp-risk-rating, qualitative-matrix, custom.
- Response strategies (ISO 31000): avoid, reduce, transfer, accept, exploit, enhance.
- Control categories: preventive, detective, corrective, compensating, deterrent, recovery, custom.
- Implementation status: recommended, proposed, approved, rejected, planned, in-progress, implemented, verified, decommissioned, custom.
- Assessment types (array): security, privacy, ai-impact, data-protection-impact, fundamental-rights-impact, business-impact, threat, vulnerability, model-risk, and more.
- Behavior acknowledgment: declared, observed (both together mean confirmed, observed alone flags an anomaly).
- Exploitability ladder (vulnerability evidence): component-present, code-present, code-reachable, runtime-reachable, attacker-reachable, preconditions-satisfiable, proven-exploitable, exploited. The top two require a demonstrative method.
- Exploit maturity (exploitation in the wild): not-defined, unreported, proof-of-concept, functional, active.
- Analysis techniques (evidence methods): source-code-analysis, binary-analysis, taint-analysis, reachability-analysis, penetration-testing, manual-review, attestation, and a dozen more, plus custom. Each method records a result: detected, not-detected, or inconclusive.

## Validating a Document

Validate against the bundled v2.0 schema (`cyclonedx-2.0-bundled.schema.json`) with a JSON Schema 2020-12 validator that has the external schemas (behavior taxonomy, SPDX, cryptography defs, signature) registered. Every example validates this way, and the same check belongs in CI for any document an organization produces.

## The Acme Example Documents

All validate against the v2.0 schema, and the linked set is the recommended starting template.

| Document | Focus |
|---|---|
| `acme-architecture.cdx.json` | Blueprint, zones, boundaries, flows, actors, data profile, validity period |
| `acme-intent.cdx.json` | Business objectives, use cases, requirement declarations, component assertions |
| `acme-behaviors.cdx.json` | Declared and observed behavior, a behavior graph |
| `acme-threat-model.cdx.json` | Threats, a scenario, an attack path, an attack tree, an abuse case, a trust boundary |
| `acme-risk-register.cdx.json` | Risks with three ratings each, responses, appetite, an assessment |
| `acme-controls.cdx.json` | A standalone control inventory and its standard catalog |
| `acme-composite.cdx.json` | The single-document form, with a VEX justification and a CDXA claim |
| `acme-parties.cdx.json` | Organization, person, system, and persona identities |
| `acme-data.cdx.json` | A data store, data sets, data objects, and a data profile |
| `acme-profiles.cdx.json` | The profiles registry |
| `acme-vulnerability-response.cdx.json` | VDR and VAR reporting, VEX statements, and the evidence behind both |
| `feature-tour.cdx.json` | Detail objects: interfaces, indicators, a full requirement, a state machine, a full risk rating |

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
