# Identifying Manufacturers and Suppliers

Every sourcing question is a party question. Who manufactures this part, who supplies it, who assembled the board, who imported it, and who owns those companies are all answered by the same `party` object, attached to the component it concerns.

## Parties on a Component

A component carries a `parties` array, where each party has a `bom-ref` so other data can point at it, one or more required roles, and exactly one identity, which for organizations carries the registered name, the jurisdiction of registration, identifiers such as a DUNS number, and physical addresses. The role vocabulary is shared across all of CycloneDX, and the following subset lists the roles hardware sourcing records use most. The full vocabulary also carries logistics and trade roles such as `carrier`, `customs-broker`, and `freight-forwarder`, alongside roles for software authorship, data protection, and threat modeling that the CycloneDX 2.0 documentation defines.

| Value | Description |
|---|---|
| `manufacturer` | Makes the part or product |
| `supplier` | Provides the part to consumers |
| `distributor` | Resells parts from manufacturers or other distributors |
| `assembler` | Assembles parts into a product |
| `integrator` | Combines products into a larger system |
| `importer` | Brings the part across a customs border |
| `exporter` | Ships the part across a customs border |
| `broker` | Sources parts outside franchised distribution |
| `inspector` | Examines parts or products |
| `quality-control` | Verifies conformance during production |

A role outside the predefined set takes the custom form, an object with a required `name` and the same optional `order`, so a program that distinguishes electronic manufacturing services from in-house assembly records `{ "name": "ems-provider" }` rather than overloading `assembler`.

## Primary and Secondary Suppliers

Roles carry an optional `order` that ranks parties sharing the same role, with lower values preferred. A primary supplier takes `order: 1` and each alternate takes a higher value, which turns an approved vendor list into data. The following example records a manufacturer and two ranked suppliers for the microcontroller:

```json
"parties": [
  {
    "bom-ref": "party-acme-semi",
    "roles": [ { "role": "manufacturer" } ],
    "organization": { "name": "Acme Semiconductor", "jurisdiction": "US-AZ" }
  },
  {
    "bom-ref": "party-veltron",
    "roles": [ { "role": "supplier", "order": 1 } ],
    "organization": { "name": "Veltron Distribution", "jurisdiction": "US-TX" }
  },
  {
    "bom-ref": "party-pancomp",
    "roles": [ { "role": "supplier", "order": 2 } ],
    "organization": {
      "name": "PanComponent Trading",
      "jurisdiction": "SG",
      "identifiers": [ { "scheme": "duns", "value": "48-234-9012" } ]
    }
  }
]
```

A procurement system reads the ranking directly, so when Veltron quotes a 40-week lead time, the buyer already knows PanComponent is approved, and the risk team already knows the alternate is a Singapore-registered broker rather than franchised distribution.

## Registration, Plants, and Parents

An organization carries two kinds of location, and origin analysis needs both: `jurisdiction` records the country of registration as an ISO 3166 code, while `addresses` records physical sites, and for a manufacturer the address is read as the plant where the part is made. A company registered in Germany can manufacture in Malaysia, and the model states both facts without forcing a choice.

Ownership is a relation, not a field. A party's `relations.parent` references the party that owns or controls it, and parents chain, so a Dutch manufacturer held by a Chinese holding company is two party records and one reference. Refer to Origin and Foreign Influence Analysis for what consumers compute from registration, plants, and parents.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
