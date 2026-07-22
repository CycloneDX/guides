# Governing AI Systems

AI systems, and agentic AI in particular, are why many organizations are adopting these capabilities right now. An autonomous agent is hard to govern precisely because it spans every layer of the design and assurance stack: it is a component with a model behind it, it sits in an architecture with tools and data, it is supposed to behave within an envelope, it attracts novel threats, it carries novel risks, and it must be controlled and assessed under emerging regulation. This use case is the composite, and it introduces no new machinery: the models already defined work together on the hardest current problem.

## The Document Set

AI governance draws on every model, and the support agent appears across all six of Acme's linked documents: as inventory and architecture (`acme-architecture`), as declared intent (`acme-intent`), as behavior (`acme-behaviors`), as threat target (`acme-threat-model`), as risk subject (`acme-risk-register`), and as control target (`acme-controls`). No single document governs the agent: the composition does.

## The Agent in the Architecture

The blueprint types the agent, its model, and its tool as distinct assets:

```json
{ "bom-ref": "asset-agent", "componentRef": "comp-agent", "type": "agent", "zone": "zone-internal" }
```

alongside an `asset-llm` of type `model` and an `asset-order-tool` of type `tool`. The agent's actor binding carries `delegatedBy`, recording that it acts on Acme's authority, not its own, which is the accountability fact regulators and incident responders both want first. The `agent`, `model`, and `tool` asset types and the `delegatedBy` relation exist because agentic systems needed structural vocabulary that pre-agent architecture models lacked.

## Declared Intent

The support-chat use case (Declaring Intent chapter) declares the legitimate flow, and its success criterion, "the agent answers using only the customer's own order data," is the scope the agent must stay within. The tool-allowlist requirement states the constraint, and declaring the envelope first is what makes every later deviation measurable.

## Monitored Behavior

The behavior document declares what the agent may do (`ai:agent:invokesTool`, `ai:agent:delegatesTask`) and, crucially, records the observed-only `file:directory:listsDirectory` that nothing declared. The behavior graph encodes the intended conversation, including the guarded transition that routes refunds to a human. This is agent governance as data: a declared operating envelope, a runtime comparison against it, and a graph that says the refund path is human-gated by design.

## Agent-specific Threats

The threat model carries the prompt-injection threat, classified under both MAESTRO (foundation-models layer) and STRIDE (elevation-of-privilege), exploiting the same `bi-invoke-tool` behavior the agent depends on. The attack path shows agent-assisted collection as a step in a larger campaign, and the abuse case pairs with the support-chat use case: the legitimate flow said "own orders only," the abuse case describes inducing the agent past that boundary. MAESTRO's agent-oriented taxonomy and the multi-taxonomy `categories` design are what let one threat be both an AI threat and a classic privilege-escalation threat.

## AI Risk

The register's second risk, agent overreach, prices the consequence of the agent acting beyond its mandate, whether through injection or model error. Its impact categories include `privacy` and a custom `customer-trust`, and the assessment that evaluates it carries `type: ["security", "threat"]`, just as the earlier AI-bias assessment carries `["ai-impact", "model-risk"]`: both draw on the assessment vocabulary built for AI governance. The risk appetite makes the organizational stance explicit: Acme is `minimal` on security risk but `open` on strategic experimentation, which is exactly why it ships an AI agent at all while controlling it tightly.

## Constraining the Agent

The controls answer each layer: the tool allowlist (preventive, verified) constrains authority, the behavior monitor (detective, in-progress) watches the declared-versus-observed gap, and human escalation for refunds keeps the consequential action in human hands. Each control's `appliesTo` points at the agent asset, and each is referenced by the risk response that treats agent overreach.

## End-to-end Agent Governance

Read the six documents together and the agent is governed end to end: named and structured, its intent declared, its behavior monitored, its threats analyzed, its risk priced and within a stated appetite, its controls in place and assessed. No new model was needed for AI governance: the agent, tool, and model asset types, the agentic behavior taxonomy, the MAESTRO threat classification, and the AI-aware risk and assessment vocabularies were the only agent-specific additions, and they slot into the same stack that governs the storefront's login. That is the payoff of one composable model family.

AI governance here is the composition of the other nine use cases, not a tenth mechanism. It asserts structure, intent, behavior, adversity, consequence, and safeguard for an AI system. Compliance logic for any single AI regulation is not encoded here but layered on through requirements, standards, and CDXA claims. The stack gives AI governance a portable spine, and the regulatory specifics ride on top of it.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
