# Profiles and Reuse

Some facts about a system repeat. The same class of regulated customer data lands in a data store, moves along a data flow, and appears again as a field in a schema. The same class of adversary shows up across several attack scenarios. Whoever writes these documents faces a choice: restate the characterization each time, or state it once and point at it. Restating invites drift, where two copies that were meant to match quietly disagree after an edit. Data governance leads, architects, and threat modelers reach for the profiles registry to state each characterization once and reuse it by reference.

The registry lives in its own root container, `profiles`, and composes two models. The data profiling layer contributes `dataProfile`, and the threat model contributes `threatProfile`. A profile is referenced by its `bom-ref` within the same document, or by a BOM-Link of the form `urn:cdx:<serialNumber>/<version>#<bom-ref>` from another document. Acme's registry is `acme-profiles.cdx.json`, serial number `urn:uuid:aaaaaaaa-...`, and the data and threat documents point back at it.

## Characterization versus Identity

A profile records how something behaves or is governed, not who or what it is: `dp-customer-pii` is not a particular database table but the governance definition that any customer-order data carries. `tp-organized-crime` is not a named group, which would be a party organization, but a durable capability level that many concrete campaigns share. Keeping characterization separate from identity is what makes a profile reusable: the same profile attaches to every element that fits it.

## The Registry Container

`profiles` is a top-level container that holds one array per profile kind, and two kinds exist today, `dataProfiles` and `threatProfiles`.

```json
{
  "specFormat": "CycloneDX",
  "specVersion": "2.0",
  "serialNumber": "urn:uuid:aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa",
  "profiles": {
    "dataProfiles": [ { "bom-ref": "dp-customer-pii", "name": "Customer order data" } ],
    "threatProfiles": [ { "bom-ref": "tp-organized-crime", "name": "Organized criminal group" } ]
  }
}
```

## The Data Profile

A `dataProfile` is a reusable governance characterization of a body of data: its classification, the kinds of information it holds, and the regulations that apply. Acme defines its customer-order profile once, in the registry.

```json
{
  "bom-ref": "dp-customer-pii",
  "name": "Customer order data",
  "classification": "confidential",
  "informationTypes": [ "pii", "financial" ],
  "regulations": [ "GDPR", "CCPA" ]
}
```

## Threat Profiles

A `threatProfile` is a reusable, durable statement of an adversary's capability: `sophistication`, `resources`, and `skillSet`. It is deliberately narrow: it does not carry motivation, intent, or access level, because those are circumstances of a specific scenario rather than durable traits of the actor class.

```json
{
  "bom-ref": "tp-organized-crime",
  "name": "Organized criminal group",
  "description": "Financially motivated groups running commodity account-takeover operations.",
  "sophistication": "intermediate",
  "resources": "moderate",
  "skillSet": [ "credential-stuffing", "phishing" ]
}
```

## Referencing a Profile

The slot that accepts a data profile is a `dataProfileChoice`: either a `bom-ref` pointing at a registered profile, or an inline `dataProfile` object for a one-off characterization not worth registering. A `dataObject` uses the reference form to inherit the shared profile.

```json
{
  "name": "Order",
  "profile": "dp-customer-pii",
  "attributes": [ { "name": "orderId", "key": "primary" } ]
}
```

The same reference form applies wherever data is characterized: a `dataSet` lists its `dataProfiles`, and a blueprint `flow` lists its `dataProfiles`, each by `bom-ref`, so one edit to `dp-customer-pii` reaches all of them at once.

## Consuming Reusable Profiles

A threat scenario points at the durable profile and adds only what is specific to the campaign. Here `tp-organized-crime` supplies the capability, and the scenario supplies motivation, intent, and access level.

```json
{
  "bom-ref": "ts-ato",
  "name": "Account takeover campaign",
  "threats": [ "th-ato" ],
  "threatProfile": "tp-organized-crime",
  "motivation": [ "financial" ],
  "intent": "opportunistic",
  "accessLevel": "external"
}
```

A recipient resolves each reference back to the registry entry, reads the full characterization there, and knows that every element carrying the same reference shares one governed characterization. The scenario names the profile, and the profile never lists the scenarios that use it, so a new campaign reuses the capability without touching the registry. Change the profile, and every consumer sees the change.

## Extensible by Design

The registry grows by adding arrays, not by changing structure: a future capability or behavior profile kind sits beside `dataProfiles` and `threatProfiles`, and a consumer that does not recognize the new kind ignores it. Defining a profile once and referencing it avoids the duplication that the annotation rule warns against: state the profile in one place, and let every element that fits it carry a reference rather than a copy.

Profiles supply shared vocabulary, and they do not stand in for the models that use it. A profile does not name an actor, which is the party model's job. It does not describe a specific data store or field, which belongs to the data model and the blueprint. It does not assert a scenario's circumstances or a risk rating, which the threat and risk models own. The registry is the fixed point those models reference, so that one characterization serves them all.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
