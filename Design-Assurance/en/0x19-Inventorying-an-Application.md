# Inventorying an Application

Someone needs to know what an application is made of. That is the classic SBOM job: enumerate the components, record their versions, and capture how they depend on one another. A build engineer produces it, a security team consumes it, a regulator may ask for it.

In CycloneDX the parts list is the starting point: the same component entry can name the parties that made it, assert which requirements it satisfies, and declare which use cases it implements. From there the document reaches the blueprint that shows how the parts are arranged and the behavior model that shows what they do.

The bridge from inventory to design and assurance is built from the component and dependency objects, the fields that attach intent to a component, and the BOM-Link references that tie an inventory to its sibling documents.

An inventory lives under two familiar top-level containers: `components` and `dependencies`. A component describes one part, a dependency edge records that one part relies on another, and parties, assertions, and cross-document links all hang off those two arrays. In Acme's documents they sit in `acme-architecture.cdx.json`, alongside a blueprint, while the component assertions sit in `acme-intent.cdx.json`.

## Components

Start with the smallest useful inventory: a list of components, each with an identity, a type, a version, and a description. The following example reduces `comp-web` to those essentials:

```json
{
  "bom-ref": "comp-web",
  "type": "application",
  "name": "storefront-web",
  "version": "14.2.0",
  "description": "Customer-facing storefront web application."
}
```

`bom-ref` is the identity of this component within the document, and every other object, in this document or another, refers to the component by that ref. `type` classifies the part: the Acme storefront mixes `application` components with a `machine-learning-model` component, `comp-llm`, for the model behind the support agent. This much is a conventional SBOM, and the next additions are what 2.0 brings, attaching to the same entry.

## Dependencies

The `dependencies` array records edges between components: each entry has a `ref`, the component the edge is about, and a `dependsOn` array, the components it directly relies on.

```json
"dependencies": [
  { "ref": "comp-web", "dependsOn": [ "comp-checkout" ] },
  { "ref": "comp-agent", "dependsOn": [ "comp-llm", "comp-checkout" ] }
]
```

The web app depends on the checkout API, and the support agent depends on both the model and the checkout API. The example uses only `ref` and `dependsOn`, but a dependency entry may also carry `provides`, which names the components whose capability or interface the referenced component supplies an implementation of. `dependsOn` says "needs," and `provides` says "fulfills." Together they give both directions of the graph.

## Component Parties

Everything from here on is the same document growing: a component can carry the parties responsible for it in a `parties` array. On `comp-web`, Acme is named inline with two roles.

```json
"parties": [
  {
    "bom-ref": "party-acme",
    "roles": [
      { "role": "supplier" },
      { "role": "owner" }
    ],
    "organization": {
      "name": "Acme",
      "legalName": "Acme Corporation"
    }
  }
]
```

Declare the party once, then reference it thereafter to avoid repeating the block: the checkout and agent components reuse it by ref.

```json
"parties": [ "party-acme" ]
```

Supplier, owner, and other roles attach directly to the part, so provenance travels with the inventory: for the full party model, refer to Identifying Parties.

## Requirement Assertions

A requirement assertion records a component's claimed relationship to a requirement, carrying an `assertionType`, one or more `requirementRefs`, and an optional description. On the checkout API:

```json
"requirementAssertions": [
  {
    "bom-ref": "ra-checkout-mfa",
    "assertionType": "satisfies",
    "requirementRefs": [ "req-mfa" ],
    "description": "Step-up authentication is enforced for high-value orders."
  }
]
```

`assertionType` states the component's stance toward the referenced requirement:

| Value | Description |
|---|---|
| `satisfies` | The component claims to meet the requirement |
| `partially-satisfies` | The component claims to meet part of the requirement |
| `violates` | The component conflicts with the requirement |
| `not-applicable` | The requirement does not apply to the component |

Here the component claims it satisfies `req-mfa`, and the description is Acme's claim about its own component, not a CycloneDX statement. `requirementRefs` is a reference field: when the requirement is defined in the same document, it is a local `bom-ref`, as shown. When the requirement lives in a separate intent document, the same field holds a BOM-Link. The assertion lives where the claim is made: the component asserts that it satisfies the requirement, and the requirement does not list which components satisfy it.

## Use Case Assertions

A use case assertion does the same for use cases, recording which use case a component realizes and how.

```json
"useCaseAssertions": [
  {
    "bom-ref": "ua-checkout",
    "assertionType": "implements",
    "useCaseRefs": [ "uc-checkout" ]
  }
]
```

For use cases, `assertionType` is `implements`, `supports`, or `participates-in`, and the checkout API implements the "Place an order" use case. In the same document the support agent asserts that it implements the "Ask the support agent about an order" use case and satisfies the agent tool allowlist requirement. The component has become the anchor where the parts list meets the design.

## Composing with Intent, Architecture, and Behavior

In Acme's model the parts list, the dependency graph, and the blueprint all live in one file, `acme-architecture.cdx.json`. That is the point: an inventory document grows to hold design, it does not fork into a separate silo. The blueprint annotates the inventory rather than copying it: each blueprint asset carries a `componentRef` back to a component, so the structure references the part by its `bom-ref` and never restates it.

The blueprint links outward to intent by BOM-Link:

```json
"requirements": [
  "urn:cdx:22222222-2222-4222-8222-222222222222/1#req-mfa"
]
```

A BOM-Link has the form `urn:cdx:<serialNumber>/<version>#<bom-ref>`. This one names the intent document by serial number and version, then the requirement `req-mfa` inside it, and the behavior document is reached the same way.

The intent document, `acme-intent.cdx.json`, describes the same components under the same `bom-ref` identifiers, `comp-checkout` and `comp-agent`, and hangs the assertions on them. Nothing is duplicated: the component `bom-ref` is the shared thread, and BOM-Link is the needle that stitches inventory, intent, architecture, and behavior into one model.

## Consuming an Inventory

A recipient reads the components and dependencies as any SBOM tool would. A consumer that understands 2.0 then follows the additions: it reads `parties` to learn provenance, resolves `requirementAssertions` and `useCaseAssertions` to see what each part claims to do, and dereferences the BOM-Links to load the blueprint, the intent library, and the behavior model on demand. A consumer that cares only about the parts list ignores the rest and still has a valid inventory.

An assertion attaches intent to a component without defining that intent, since the full requirement and use case objects, with acceptance criteria, actors, flows, and business objectives, are declared in the intent model: refer to Declaring Intended Use and Requirements. Refer to Documenting Architecture for the blueprint with its zones, boundaries, flows, and assets, and to Describing Behavior for declared and observed behavior. An assertion is a claim, not evidence, and binding a claim to signed evidence is attestation work: refer to Assessing and Attesting. The inventory names the parts and points at the rest.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
