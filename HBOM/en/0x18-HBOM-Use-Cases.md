# HBOM Use Cases

Every HBOM use case is a question someone asks about a physical product, and each question is answered by a specific slice of the inventory data. The Hardware Feature Working Group captured these questions from manufacturers, buyers, policy owners, security teams, and compliance programs, and all of the answers come from the same document a producer already publishes. The questions start with what is in the product, and every later question consumes that answer.

## Maintaining the Product Inventory

What is in the product, where does each part sit, and in what quantity. Every other use case consumes the answer, which is why the inventory is the first HBOM a producer publishes and the first document a consumer requests. The answer is a component per part and per substance, placements by reference designator, classification codes that make records machine-comparable, and nested assemblies from the finished product down to the last passive. The same inventory serves operations long after the sale, since field service identifies spares from it and receiving reconciles delivered goods against it. Refer to Inventorying a Hardware Assembly for the component model.

## Supporting Procurement

A buyer asks what exactly to order, from whom, at what customs cost, and how to verify the delivery. Attributed identifiers answer the first and last question, because the manufacturer's MPN and each supplier's SPN sit on one record, so a purchase order cites the right number and receiving reconciles cartons against the same data. Ranked suppliers name the approved sources in preference order, lead times with observed dates say when to place the order, and HS classification codes price duty exposure before a quote is signed. Refer to Inventorying a Hardware Assembly for identifiers and lead time and to Identifying Manufacturers and Suppliers for ranked sources.

## Qualifying Second Sources

Procurement asks whether every part on the approved vendor list has an alternate, and which alternates are approved when the primary fails to deliver. Ranked supplier roles answer the sourcing half: a primary carries preference order 1 and each alternate a higher number, so an approved vendor list is data rather than a spreadsheet. Approved alternate parts answer the engineering half through choices with defined logic, including the case where one integrated part and a group of discretes build the same product. A sourcing review reads both in one pass and flags the false resilience of alternates that share a single upstream manufacturer. Refer to Identifying Manufacturers and Suppliers for ranking and to Alternates and Substitution for choices.

## Managing Obsolescence and Supply Disruption

An availability planner asks which parts put the production schedule at risk and how soon. Lead times with observed ranges answer the exposure half: a part quoted at 16 weeks with a 12-to-24-week range and a stale observation date is a different risk than a part quoted last month. Ranked suppliers and approved alternates answer the response half, because the plan for a disrupted part is its next supplier or its substitute. The same data flags end-of-life exposure early, since a part whose only source is a single plant in a single country is visible as such long before the last-time-buy notice arrives. Refer to Inventorying a Hardware Assembly for lead time and to Alternates and Substitution for substitutes.

## Managing Vendor Risk

A third-party risk program asks which of hundreds of vendors concentrate risk: who depends on a single plant, whose certifications expire this quarter, and who sources from restricted jurisdictions. HBOMs collected from each vendor answer with data the program can query instead of prose it must interpret, since ranked suppliers expose single-source parts, origin declarations and party jurisdictions locate geographic exposure, and certifications carry their own validity dates. Vendor onboarding becomes requesting a document rather than mailing a questionnaire, and continuous monitoring becomes rerunning last quarter's queries against this quarter's documents. Refer to Identifying Manufacturers and Suppliers for the party model and to Origin and Foreign Influence Analysis for exposure calculations.

## Assessing Foreign Ownership, Control, and Influence

Who made every part, where, and who owns those companies. Defense and government procurement programs ask this before award, compliance teams re-ask it annually, and policy owners ask it in aggregate across a portfolio. The inventory answers with three party facts per manufacturer: the plant location from its addresses, the country of registration from its jurisdiction, and the ownership chain from its parent relations. A producer declares origin distributions on a stated basis, a reviewer derives its own from placements and plants, and parent chains carry control exposure either way. Refer to Origin and Foreign Influence Analysis for the worked calculation.

## Tracing Critical Materials to Their Source

Defense and critical-infrastructure programs ask where the substances inside a product came from, stage by stage: where an alloy's metal was mined, where it was smelted or melted and by whom, and how much of a supply chain depends on a single country for mining or separation. Procurement rules answer differently at different stages, restricting where specialty metals may be melted while conflict-mineral due diligence turns on identifying the smelter. Material components answer the what, and stage-scoped origin declarations answer the where and the who, down to the named smelter behind a given share of a distribution. Aggregated across a portfolio, the same declarations show single-country concentration in any stage before a disruption or an embargo makes it visible the hard way. Refer to Origin and Foreign Influence Analysis for declared origin and to Inventorying a Hardware Assembly for materials.

## Demonstrating Regulatory Compliance

A market surveillance authority asks for the CE basis, a customs broker asks for HS headings, a federal buyer asks for the Section 889 determination, and an automotive customer asks for the AEC-Q100 grade. Certifications on each component answer with the standard, the certificate identifier, the issuer, validity dates, and the level, and classification codes carry the customs and industry taxonomies beside them. Where a program requires proof rather than a mark, the certification cites the attestation claims behind it, so an auditor follows the chain from certificate to claim to evidence. Refer to Hardware Certifications and to Inventorying a Hardware Assembly for classification codes.

## Detecting Counterfeit Parts

Incoming inspection asks whether the parts in the tray are what the label says, and a security team asks the same question after a field failure. Identity evidence answers with the concluded identity, the confidence behind it, the physical techniques that produced it, the laboratory that stands behind the determination, and the date it was made, with photographs of package markings attached as supporting material. A quality program built on SAE AS5553 records its test results once and every downstream consumer reads them. Refer to Substantiating Part Identity for the techniques and the evidence they produce.

## Scoping Recalls and Field Failures

A quality engineer learns that a supplier shipped a defective capacitor lot and asks which products, revisions, and units carry it. Identifiers name the affected part across every document that lists it, reference designators locate each placement on each board, and nested assemblies bound the affected products. Dependency entries widen the search past the enclosure, because an optional module that depends on a recalled system is affected inventory even though no assembly contains both. A scoping exercise that once meant a week of cross-referencing ERP exports becomes a query over published documents. Refer to Inventorying a Hardware Assembly for placements and dependencies and to Substantiating Part Identity for confirming suspect units.

## Conducting Merger and Acquisition Due Diligence

An acquirer asks what a target builds, what its products depend on, and which liabilities transfer at closing. The target's HBOMs answer from data rather than data-room interviews: single-source parts and their lead times price the supply risk being bought, origin declarations and ownership chains surface foreign influence a defense customer will raise after the deal, and certifications inventory the approvals that must survive the change of ownership. Restricted-country content appears before signing rather than in the first post-closing audit. A seller who publishes the same documents shortens its own diligence and answers once instead of per bidder. Refer to Origin and Foreign Influence Analysis for exposure and ownership chains and to Hardware Certifications for transferable approvals.

## Publishing Portfolio Transparency

Policy owners and large buyers ask questions across products rather than within one: how much of a product line depends on a single country, which certifications expire this year, and which manufacturers appear in every product. Because every HBOM validates against one schema, portfolio answers are queries over a document set rather than a reconciliation project, and a regulator or customer receiving the documents runs the same queries the producer ran. Every aggregate answer decomposes back to a per-product document that a supplier can be asked to defend.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
