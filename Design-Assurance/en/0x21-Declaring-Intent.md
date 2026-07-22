# Declaring Intended Use and Requirements

Every consequential judgment about a system leans on intent. A regulator assessing an AI system starts from its intended purpose, a safety reviewer starts from intended use, an auditor starts from the requirements the system claims to meet, and a threat modeler starts from what the business is trying to protect. Yet intent usually lives in requirement management tools, product documents, and regulatory filings that never travel with the system. CycloneDX makes intent portable: business objectives, use cases, and requirements as declared objects in the document's declarative library, with assertions that bind inventory to them.

Intent lives in `definitions`, the declarative library: it holds reusable declared objects, and everything else references them.

```json
"definitions": {
  "businessObjectives": [ ... ],
  "useCases": [ ... ],
  "requirements": [ ... ]
}
```

Acme's `acme-intent.cdx.json` carries the objectives, use cases, and requirements, and the other documents point at it. The same container also holds `standards` and `patents`, covered elsewhere.

## Business Objectives

A `businessObjective` is deliberately small: a `name`, a `description`, a `criticality`, and an `owner`. The `criticality` field grades how much the objective matters:

| Value | Description |
|---|---|
| `minimal` | Minimal importance |
| `low` | Low importance |
| `moderate` | Moderate importance |
| `high` | High importance |
| `critical` | Critical importance |

```json
{
  "bom-ref": "obj-protect-data",
  "name": "Protect customer data",
  "description": "Customer order and payment data is protected against theft and misuse.",
  "criticality": "critical",
  "owner": "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-acme"
}
```

Its power is in what references it: use cases declare which objectives they serve, threats declare which objectives they endanger through `relatedBusinessObjectives`, and risks declare which objectives they threaten. That triangle is the traceability that risk-centric methodologies demand at their first stage: analysis grounded in what the business is trying to achieve, rather than in whatever the scanner found. Objectives are also what risk appetite is about: refer to the Managing Risk chapter. The `owner` is a BOM-Link to a declared party, not a copied name.

## Use Cases

A `useCase` object declares intended use with the classic fields of requirements engineering. It carries `actors`, `preconditions`, and a `mainFlow` of numbered steps, with `alternativeFlows` and `exceptions` for the paths off the expected one. `postconditions`, `successCriteria`, and `notes` complete the flow, and the object references the `requirements` it depends on and the `businessObjectives` it serves.

```json
{
  "bom-ref": "uc-support-chat",
  "name": "Ask the support agent about an order",
  "description": "A customer asks the AI support agent about order status; the agent uses the order lookup tool and answers.",
  "actors": [
    "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-customer",
    "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-agent-sys"
  ],
  "mainFlow": [
    { "number": 1, "description": "The customer asks about a recent order." },
    { "number": 2, "description": "The agent invokes the order lookup tool for that customer's orders only." },
    { "number": 3, "description": "The agent summarizes status and offers escalation to a human." }
  ],
  "successCriteria": [ "The agent answers using only the customer's own order data." ],
  "requirements": [ "req-tool-allowlist" ],
  "businessObjectives": [ "obj-protect-data" ]
}
```

Step 2 and the success criterion quietly establish the intended scope of the agent's authority, and intended use is the baseline that abuse deviates from, which is why the threat model's abuse cases (Modeling Attacks chapter) pair with use cases. An `abuseCase` shares the step structure and adds the abuser, preconditions, detection opportunities, and mitigations, and declaring the legitimate flow first is what makes the abusive flow precise.

For regulated contexts this object is the anchor point: intended purpose declarations for AI systems, intended use in medical and safety domains, and the manufacturer communication of intended architecture and behavior. The `useCase` object does not encode any single regulation's semantics: it gives the declaration a stable, referenceable home, and external references or CDXA claims carry the regulatory binding.

### Steps, Alternative Flows, and Exceptions

A `step` is the unit of a flow: a `number`, a `description`, and an optional `actor` that pins responsibility to that step, as Acme's checkout flow does.

```json
{
  "number": 1,
  "description": "The customer submits the order.",
  "actor": "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-customer"
}
```

The main flow is the expected path, and an entry in `alternativeFlows` is a `flow` (a `name`, the `condition` that selects it, and its own `steps`) for a sanctioned variation. An entry in `exceptions` is an `exception` (a `name`, a `condition`, and its `handling`) for an error path. `postconditions` state what holds once the flow ends, and `notes` capture what the flow leaves implicit. Acme's reporting use case in `feature-tour.cdx.json` exercises all of these fields at once.

```json
"postconditions": [ "A report is produced and access is logged." ],
"alternativeFlows": [
  {
    "name": "Cached report",
    "condition": "A recent report exists",
    "steps": [ { "number": 1, "description": "The service returns the cached report." } ]
  }
],
"exceptions": [
  { "name": "Unauthorized", "condition": "The analyst lacks reporting rights", "handling": "The request is denied and logged." }
],
"notes": [ "Row-level order data is never exposed through reporting." ]
```

Alternative flows are the sanctioned variations, exceptions are the error paths, and keeping both separate from the main flow lets a reviewer see at a glance what counts as normal operation and what counts as recovery.

## Requirements

A `requirement` in the declarative library is a generic, standard-independent statement of something that has to hold. Only `bom-ref` is required, but a working one adds an `id`, a `name`, and a `description`. The `type` array classifies the statement, with values that include the following:

| Value | Description |
|---|---|
| `security` | A security requirement |
| `functional` | A functional requirement |
| `non-functional` | A non-functional quality requirement |
| `performance` | A performance requirement |
| `compliance` | A compliance requirement |
| `business` | A business requirement |

A `priority` ranks the statement, and a lifecycle `status` tracks it, with five values on the forward path and four that end it:

| Value | Description |
|---|---|
| `draft` | Being drafted |
| `proposed` | Proposed for approval |
| `approved` | Approved for implementation |
| `implemented` | Implemented in the system |
| `verified` | Verified as met |
| `deferred` | Deferred to later |
| `rejected` | Rejected |
| `replaced` | Replaced by another requirement |
| `obsolete` | No longer applicable |

```json
{
  "bom-ref": "req-tool-allowlist",
  "id": "AS-REQ-014",
  "name": "Agent tool allowlist",
  "description": "The support agent may invoke only the tools on its approved allowlist, scoped to the requesting customer's data.",
  "type": [ "security" ],
  "priority": "high",
  "status": "implemented",
  "rationale": "Limits the blast radius of prompt injection and agent error."
}
```

The full object adds hierarchy and planning metadata. `req-tour` in `feature-tour.cdx.json` carries a `version`, a `parent`, a `rationale`, and a `fitCriterion`. It adds coarse `effort` and `risk` sizing, named `stakeholders`, typed `dependencies`, `acceptanceCriteria`, and `attachments`.

```json
{
  "bom-ref": "req-tour",
  "id": "SEC-12",
  "name": "Bind workload tokens to their network context",
  "description": "Service-account tokens are bound to an expected workload identity and network.",
  "type": [ "security", "compliance" ],
  "priority": "high",
  "status": "proposed",
  "version": "2",
  "parent": "req-tour-parent",
  "rationale": "Limits the value of a stolen token.",
  "fitCriterion": "A token replayed from an unexpected network is rejected in staging tests.",
  "effort": "medium",
  "risk": "low",
  "stakeholders": [ "Product Security", "Platform Engineering" ],
  "dependencies": [ { "ref": "req-tour-parent", "type": "implements", "description": "Implements part of the parent objective." } ],
  "acceptanceCriteria": [
    { "id": "SEC-12-AC1", "description": "Replayed tokens from unexpected networks are rejected.", "status": "pending" }
  ],
  "attachments": [
    { "mediaType": "text/plain", "content": "Design note: bind tokens via SPIFFE workload identity." }
  ]
}
```

An `acceptanceCriterion` makes a requirement testable: an `id`, a `description`, and a `status`.

| Value | Description |
|---|---|
| `pending` | Not yet tested |
| `passed` | The criterion is met |
| `failed` | The criterion is not met |

Acme records its step-up rule as already passing.

```json
{
  "id": "AS-REQ-001-AC1",
  "description": "Orders above the configured threshold prompt for a second factor before authorization.",
  "status": "passed"
}
```

Requirements relate to each other two ways: `parent` nests a requirement under a broader one, so `req-tour` rolls up to `req-tour-parent`. A `dependency` is a typed edge with a `ref` and a `type` of `requires`, `implements`, or `conflicts-with`.

```json
{ "ref": "req-tour-parent", "type": "implements", "description": "Implements part of the parent objective." }
```

Two kinds of requirement coexist in CycloneDX, on purpose: the generic requirement is the organization's own, internal engineering and product requirements on their own lifecycle. The `standard` object, also in `definitions`, carries the requirements of published standards, identified and versioned as the standard publishes them. Refer to the Managing Controls chapter. Controls `satisfy` either kind, and the distinction preserves the difference between the two without forcing one structure onto both.

## Assertions

Declarations are inert until something claims to meet them, so components carry two assertion arrays that make the binding explicit.

```json
{
  "bom-ref": "comp-agent",
  "type": "application",
  "name": "support-agent",
  "version": "2.4.0",
  "requirementAssertions": [
    {
      "bom-ref": "ra-agent-allowlist",
      "assertionType": "satisfies",
      "requirementRefs": [ "req-tool-allowlist" ]
    }
  ],
  "useCaseAssertions": [
    {
      "bom-ref": "ua-agent",
      "assertionType": "implements",
      "useCaseRefs": [ "uc-support-chat" ]
    }
  ]
}
```

Requirement assertions speak satisfaction: a component `satisfies`, `partially-satisfies`, or `violates` a requirement. Use case assertions speak participation: a component `implements`, `supports`, or `participates-in` a declared use case. The edge lives in the asserting document, per the rule from the Concepts chapter: the component asserts against the catalog, and the catalog stays clean. A `violates` assertion is as valuable as a `satisfies` one, since it records a known gap in the same machine-readable place.

An assertion is a self-claim, and when a self-claim needs to become a substantiated claim, CDXA takes over: a claim targets the assertion or the requirement, and evidence does the convincing. Refer to the Assessing and Attesting chapter.

## Consuming Intent

Traceability consumers walk the triangle: which components assert which requirements, which use cases those requirements serve, which objectives those use cases advance, and, from the other direction, which threats and risks endanger those same objectives. Reviewers diff requirement status across document versions to watch commitments harden or slip. Threat modelers consume use cases as the seed list for abuse cases. And the blueprint binds its elements to use cases directly, so a consumer can ask which parts of the architecture exist in service of which declared intent.

Intent declarations state what the producer means the system to do and satisfy. They do not demonstrate satisfaction (controls and CDXA do), do not enumerate what can go wrong with the intent (threats do), and do not price failure (risks do). Declared intent is the stake in the ground the rest of the stack measures against.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
