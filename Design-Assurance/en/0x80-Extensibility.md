# Extensibility

The design and assurance models are curated on purpose: closed vocabularies with a custom escape, purpose-built objects rather than open graphs. Extensibility is therefore deliberate too, with a clear order of preference.

## The Order of Preference

When the model does not say what an organization needs to express, prefer options in this order.

1. The custom branch of a predefined vocabulary: almost every taxonomy value in the stack is predefined-or-custom, so an extension supplies an object with a `name` and optional `description` instead of an enum value. Use this for an organization-specific control category, risk domain, threat methodology, data classification, asset type, or assessment type. The custom value is machine-readable and self-describing, and it sits in the same field as the predefined values, so consumers handle it uniformly. This is the first choice because it keeps the extension inside the model's own structure.

2. Properties: every substantial object carries `properties`, namespaced name and value pairs. Use them for data the schema does not model at all: an internal tracking identifier, a tool-specific attribute, a source string parked during conversion. Namespace property names so they do not collide with anyone else's, and treat properties as the sanctioned home for the long tail of organization-specific data.

3. External references: where the extension is a pointer to another artifact, use `externalReferences` with an appropriate type, so an analysis artifact held outside the document attaches to any element by typed link. The type vocabulary already includes the values this stack needs, among many others:

    | Value | Description |
    |---|---|
    | `threat-model` | An externally maintained threat model |
    | `adversary-model` | An externally maintained adversary model |
    | `risk-assessment` | An externally maintained risk assessment |
    | `pentest-report` | A penetration test report |
    | `evidence` | Supporting material for an assertion |

4. Propose a change to the standard: when an extension turns out to be general, not organization-specific, the right endpoint is a proposal to the standard through Ecma TC54 and the CycloneDX community. The custom branches and properties are where a new concept proves itself. A concept that many parties express the same way is a candidate for promotion to a first-class construct, and several of the stack's vocabularies grew exactly that way.

## What Not to Do

Do not overload an existing field to mean something it does not: a mislabeled control category or a repurposed risk domain is worse than a custom value, because it corrupts the data for every consumer who trusts the vocabulary. Do not encode structured data as a delimited string inside a single property when the custom-object branch or several properties would preserve the structure. And do not fork the schema. The custom branches exist so that forking is never necessary, and a forked schema loses the interoperability that is the entire reason to use a standard.

## Extensibility and Composition

Extensions travel with the document, so a custom control category or a namespaced property survives BOM-Link composition and reaches every consumer that resolves the reference. This is another reason to prefer the custom branch and properties over out-of-band side channels: an extension expressed in the model is portable in exactly the way the model promises, while an extension held in a separate system is not. When two organizations exchange design and assurance documents, their custom vocabularies are legible to each other as custom, which is the graceful degradation the predefined-or-custom pattern was designed to provide.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
