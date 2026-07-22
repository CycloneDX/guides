# Hardware Concepts and Terminology

A physical product maps onto CycloneDX through four ideas: every finished part is a component of type `device` and every substance a component of type `material`, assemblies nest, one part record covers many placements, and every "who" is a party. The rest of the model, from sourcing through substitution to certification, builds on those four ideas.

## From Manufacturing Terms to CycloneDX

Hardware and software teams use different words for the same structures, and manufacturing itself uses several words for one thing, so the following table anchors the vocabulary.

| Manufacturing term | Meaning | CycloneDX representation |
|---|---|---|
| Line item | One row of a bill of materials: a part and its placements | A component of type `device` |
| Assembly, subassembly | A product built from parts, possibly containing other assemblies | Nested `components` |
| Reference designator | The label locating a part on a board, such as U5 or C3 | `boardLocation.designators` |
| EBOM, MBOM | The engineering and manufacturing views of a bill of materials | One inventory, with choices resolving design intent to built configuration |
| MPN, SPN | Manufacturer and supplier part numbers | `identifiers` entries attributed to the asserting party |
| AVL, AML | Approved vendor and manufacturer lists | Ranked `supplier` and `manufacturer` parties on the component |
| Second source | An approved alternate supplier or alternate part | A `supplier` role with `order: 2`, or a component-choice |
| Form, fit, function | The test for whether one part can substitute for another | The rationale recorded on a component-choice |
| Kit | Parts that are only installed together | A component-choice with the `AND` operator |
| Country of origin | Where a part or material came from | A declared origin distribution, or the manufacturer party's address |
| Raw material, feedstock | A substance used to make items rather than a finished item | A component of type `material` with a `materialForm` |
| Melt and pour, country of melt | Where a metal was melted and by whom | An origin with stage `melted` or `smelted` and `performedBy` |
| Lead time | How long procurement of a part takes | `leadTime` on the component |
| Package | The physical case and mounting style of a part | `deviceType` |

Most of the predefined vocabularies behind these representations extend through one pattern: where the schema allows values outside a predefined set, the custom form is an object with a required `name` and an optional `description`. The pattern covers device packages, material forms, identifier schemes, origin stages, party roles, and analysis techniques, so a private vocabulary travels as data without posing as a standard value.

Two habits from software BOMs need adjustment on the hardware side. In a software BOM the dependency graph carries most of the structure, while a hardware inventory splits structure and function across two constructs: nested `components` state what an assembly contains, and a `dependencies` entry states what a component requires to operate. The two often disagree, because an optional board designed for a specific system ships outside every assembly of that system yet depends on it for power and signaling. And a hardware part rarely appears once: a single capacitor record legitimately covers six placements, all listed in its reference designators, which is why placement counts rather than component counts drive most hardware calculations.

## One Part, Many Placements

A component record describes a part, not an instance. The 100 nF bypass capacitor on the Devkit One board appears at C3, C4, C9, C11, C14, and C15, and all six designators sit on one record. Quantity is the length of the designator list, and splitting the record per placement multiplies maintenance work while breaking the link between the part and its sourcing data.

## The Acme Devkit One

One product anchors the worked examples: the Acme Devkit One, an open hardware microcontroller development board. Its inventory carries an Acme Semiconductor AVR8-328 microcontroller at U5, a bank of Globex ceramic capacitors, and a USB Type-B receptacle at J1, manufactured by parties registered in the United States, Germany, and Switzerland with plants in three further countries. The board is deliberately small, and every JSON fragment in the chapters that follow validates against the CycloneDX v2.0 schema.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
