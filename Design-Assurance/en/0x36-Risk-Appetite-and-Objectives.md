# Risk Appetite and Objectives

A risk rating on its own does not say whether the number is acceptable, and "Medium" means something only against a declared tolerance. Risk appetite and business objectives give risk owners, executives, and auditors two things. First, a written statement of appetite: how much risk the organization will carry, overall and by domain. Second, a line from each risk and threat back to the business objective it endangers, so a reader can answer "so what" without guessing. Together they turn a pile of ratings into decisions someone signed off on.

Risk appetite lives in the `risks` container, in a `riskAppetites` array beside the risks and the assessments themselves, and business objectives live in the declarative library, under `definitions.businessObjectives`. In Acme's documents the appetite sits in `acme-risk-register.cdx.json` (`urn:uuid:5555...`) and the objectives in `acme-intent.cdx.json` (`urn:uuid:2222...`). Use cases, threats, and risks name the objectives they affect by BOM-Link, so an objective is declared once and referenced everywhere.

## Stating an Appetite

A `riskAppetite` records one party's tolerance for risk. `party` is the party whose appetite it is, and `owner` is the party accountable for setting and maintaining it, both given as references to a party. `level` is the overall stance drawn from the appetite scale, and `statement` puts that stance in plain language. `categories` refines it per domain: each entry carries a `domain` and its own `level`, and may add a local `statement`. Acme is `cautious` overall but splits its appetite by domain.

```json
{
  "bom-ref": "rap-acme",
  "party": "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-acme",
  "level": "cautious",
  "statement": "Acme accepts measured risk in pursuit of growth but has minimal appetite for risks to customer data and payment integrity.",
  "owner": "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-acme",
  "categories": [
    { "domain": { "type": "security" }, "level": "minimal", "statement": "Customer data and payment integrity risks are reduced as far as practicable." },
    { "domain": { "type": "strategic" }, "level": "open", "statement": "Acme is open to risk when experimenting with new customer experiences, including AI assistance." }
  ],
  "nextReview": "2027-01-15T00:00:00Z"
}
```

Two more fields round out the object without appearing above: `rationale` explains why the appetite is set where it is, useful when an auditor asks who decided and on what basis. `horizon` names the time window the appetite is meant to cover, for example a fiscal year or a product launch, after which it is expected to change. `nextReview` records when the appetite is revisited, and Acme sets its own for early 2027.

`riskAppetites` is an array because one document can carry appetite for several parties at once: a platform operator and each tenant, or a supplier and its customer, each with a different tolerance. An assessment does not copy an appetite: it references it by `bom-ref`, so the measurement and the yardstick stay in one place. The Acme assessment points back with `"riskAppetites": [ "rap-acme" ]`.

## The Appetite Scale

`appetiteLevel` is a five-value scale, ordered from least to most willing to carry risk.

| Value | Description |
|---|---|
| `averse` | Avoid the risk wherever possible. |
| `minimal` | Accept only a small, well-controlled amount. |
| `cautious` | Accept measured risk within deliberate limits. |
| `open` | Accept risk in exchange for expected return. |
| `hungry` | Actively seek risk for the upside it offers. |

The top value, `hungry`, expresses deliberate risk-seeking rather than mere tolerance, consistent with the model's support for positive risk, where an outcome can be an opportunity and not only a harm. Most organizations sit in the middle of the scale and vary the level by domain.

## Business Objectives

A `businessObjective` names something the organization is trying to achieve or protect: the anchor that gives a risk its "so what". The object is small on purpose: a `name`, an optional `description`, a `criticality`, and an `owner`, and Acme declares its objectives once in the definitions library.

```json
{
  "bom-ref": "obj-protect-data",
  "name": "Protect customer data",
  "description": "Customer order and payment data is protected against theft and misuse.",
  "criticality": "critical",
  "owner": "urn:cdx:11111111-1111-4111-8111-111111111111/1#party-acme"
}
```

## Tracing Risks and Threats to Objectives

Three vertices reference the same objective, forming a traceability triangle. A `useCase` lists the objectives it advances in `businessObjectives`, a `threat` names the objectives it endangers in `relatedBusinessObjectives`, and a `risk` does the same in its own `relatedBusinessObjectives`. Because all three point at one declared objective, a reader can pivot from a goal to the use cases that serve it, the threats against it, and the risks that quantify those threats.

Trimmed to its objective link, the support-chat use case advances protection of customer data:

```json
{
  "bom-ref": "uc-support-chat",
  "name": "Ask the support agent about an order",
  "requirements": [ "req-tool-allowlist" ],
  "businessObjectives": [ "obj-protect-data" ]
}
```

The account-takeover risk endangers the same objective, naming it across documents by BOM-Link:

```json
{
  "bom-ref": "risk-ato",
  "name": "Customer account takeover",
  "relatedThreats": [ "urn:cdx:44444444-4444-4444-8444-444444444444/1#ts-ato-campaign" ],
  "relatedBusinessObjectives": [ "urn:cdx:22222222-2222-4222-8222-222222222222/1#obj-protect-data" ]
}
```

A threat carries the same `relatedBusinessObjectives` field, wired the same way, so the threat model and the risk register agree on which goals are in play.

## Appetite Is the Yardstick for Target Risk

Appetite is what `targetRisk` is measured against: a residual rating that lands within the domain's appetite is acceptable. One above it needs more treatment or an explicit exception. Acme's split appetite explains its design: it is `minimal` on security, so customer data and payment risks are driven down as far as practicable and tightly controlled. It is `open` on strategic experimentation, so it is willing to ship a new AI support agent to improve the customer experience. That split is why Acme runs the agent at all while wrapping it in a tool allowlist, human escalation, and behavior monitoring: the strategic appetite justifies the bet, and the security appetite bounds how far the bet is allowed to reach.

## Consuming Appetite and Objectives

A recipient reads appetite before ratings: resolve each assessment's `riskAppetites` reference to find the tolerance in force, then compare each risk's residual and target ratings against the appetite for its domain. Follow `relatedBusinessObjectives` from any risk or threat to see which goals are exposed, and rank remediation by the `criticality` of the objectives at stake, not by raw score alone. A residual above appetite with no recorded exception is the finding.

Appetite and objectives supply the yardstick a rating is measured against, not the measurement itself. Refer to Managing Risk for how a risk is scored, how inherent, residual, and target ratings are built, and how responses reduce a rating. Refer to Assessing and Attesting for how an assessment records a judgment against appetite at a point in time and how that judgment is attested and signed. Business objectives are declared once in the declarative library and consumed widely: refer to Declaring Intended Use and Requirements for the use cases and requirements that also reference them.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
