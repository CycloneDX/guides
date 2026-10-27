# Appendix A: Glossary

**Assembly.** A product built from parts, possibly containing subassemblies. Modeled as components nested inside a parent component, which states containment rather than connection.

**AVL, AML.** Approved vendor list and approved manufacturer list: procurement's record of who may supply or make a part. Modeled as ranked supplier and manufacturer parties.

**Blueprint.** A model of how parts and products connect, independent of what contains them. A blueprint with the `physical` model type references components as assets, records the power, data, and signal flows between them, and states which asset depends on which, such as an optional board that draws power from the system it plugs into.

**Country of origin.** The country where a part was manufactured, read from the manufacturer party's address. Distinct from the country where the manufacturer is registered.

**Conflict minerals.** Tin, tantalum, tungsten, and gold, whose sourcing is subject to due diligence on the mines and smelters in their supply chains. Declared origins with stages `mined` and `smelted` carry the answering data.

**Counterfeit part.** A part misrepresenting its identity or source, including remarked, refurbished, or cloned parts. Detection evidence is recorded under identity evidence.

**EBOM, MBOM.** Engineering and manufacturing bills of materials: the design view and the build view of the same product. Choices carry the design intent, and resolved choices describe a built unit.

**FOCI.** Foreign ownership, control, or influence: the assessment of whether foreign interests control a company in a supply chain. Computed from party jurisdictions and parent relations.

**Form, fit, function.** The criteria under which one part substitutes for another: same interface, same footprint, same behavior. The rationale recorded on a component-choice.

**HBOM.** Hardware Bill of Materials: a structured inventory of the physical components in a product, their sources, placements, and attributes.

**Kit.** A set of parts installed only as a group, modeled as a component-choice with the AND operator.

**Lead time.** The time from ordering a part to receiving it, recorded with an optional observed range and observation date.

**Material.** A physical substance in raw or processed form used to make, maintain, or repair an item, modeled as a component of type `material` with a supplied form.

**Melt and pour.** The procurement rule that a metal counts as originating where it was melted, recorded as an origin with stage `melted` or `smelted` and the performing party.

**MPN, SPN.** Manufacturer part number and supplier part number: identifiers asserted by the manufacturer and a supplier for the same part, each attributed to its asserting party.

**Order number.** The ordering code a buyer places on a purchase order, which can differ from both the MPN and the SPN, for example by a packaging suffix. Recorded under the custom identifier scheme `order-number`.

**Smelter.** The organization that extracts metal from ore or concentrate, the pinch point most mineral due diligence regimes audit. Named per distribution share through `performedBy`.

**Reference designator.** The label locating a part on a board, such as U5 for an integrated circuit or C3 for a capacitor. One part record lists every designator it occupies.

**Second source.** Also secondary supplier or alternative supplier. An approved alternate for a part or supplier, modeled as a supplier role with order 2 or as a branch of a component-choice.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
