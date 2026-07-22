# Origin and Foreign Influence Analysis

Origin questions come in two forms: where each part and material came from, which drives customs treatment, sanctions exposure, and sourcing policy, and who controls the companies behind them, which drives foreign ownership, control, or influence (FOCI) determinations in regulated procurement. Both questions decompose by stage, because a magnet whose rare earths were separated in one country, alloyed in a second, and magnetized in a third has three different origin answers depending on which stage a rule cares about. The inventory carries declared origin distributions, the party data to derive origin independently, and the ownership chains behind both.

## Declared Origin

An `origins` array on a component or an organization states origin as data. Each `origin` carries an optional `stage`, a required `basis` naming the methodology or unit behind the numbers, and a required `distribution` of regions whose percentages total 100. Each region names an ISO 3166 country or subdivision `isoCode`, its `percentage`, and optionally the party that performed the stage there through `performedBy`, so "melted in Malaysia" becomes "melted in Malaysia by this smelter." A region may repeat within a distribution to attribute shares to different parties.

The `basis` is what makes a declared percentage trustworthy: 60 percent by net weight and 60 percent by part count are different claims, and an origin states which one it makes. Procurement rules that restrict where specialty metals may be melted, such as DFARS 252.225-7009, and due diligence regimes that identify the smelters of tin, tantalum, tungsten, and gold, such as Section 1502 of the Dodd-Frank Act and the OECD Due Diligence Guidance, all ask stage-specific questions that a single country-of-origin field cannot answer. The stage vocabulary is shared across all of CycloneDX, and the following subset lists every stage applicable to devices and materials, omitting the stages that describe software builds, data collection, model training, and service hosting.

| Value | Description |
|---|---|
| `designed` | Creation of the design, specifications, or intellectual property |
| `mined` | Extraction of raw material from the earth |
| `harvested` | Collection of biologically derived raw material |
| `recycled` | Recovery of material from scrap, waste, or previously used items |
| `refined` | Purification of material, including chemical refining |
| `separated` | Separation of elements from a mixed feedstock, such as rare earth separation |
| `smelted` | Extraction of metal from ore or concentrate by smelting |
| `melted` | Melting of material into a homogeneous mass, such as an alloying melt |
| `processed` | Intermediate transformation such as milling, atomization, or heat treatment |
| `manufactured` | Fabrication of the item from its input materials or parts |
| `assembled` | Integration of constituent parts into the finished item |
| `tested` | Verification of the subject against its requirements |
| `operated` | Operation and administration of the subject |
| `maintained` | Ongoing maintenance after release, including updates and patches |

A stage outside the predefined set takes the custom form, an object with a required `name` and an optional description, so a magnet producer that tracks sintering as its own transformation declares `"stage": { "name": "sintered" }` rather than stretching `processed`. The following example declares the tin provenance of a solder paste: mined in two countries, smelted by a named Malaysian smelter, and manufactured into paste in Germany:

```json
"origins": [
  {
    "stage": "mined",
    "basis": "net weight of contained tin",
    "distribution": [
      { "isoCode": "ID", "percentage": 60 },
      { "isoCode": "PE", "percentage": 40 }
    ]
  },
  {
    "stage": "smelted",
    "basis": "net weight of contained tin",
    "distribution": [
      { "isoCode": "MY", "percentage": 100, "performedBy": "party-straits-tin" }
    ]
  },
  {
    "stage": "manufactured",
    "basis": "net weight",
    "distribution": [
      { "isoCode": "DE", "percentage": 100, "performedBy": "party-lotfast" }
    ]
  }
]
```

A compliance reviewer reads the smelter identity straight from the `smelted` stage, which is the fact conflict-mineral due diligence turns on, and a defense program reads the melt location the same way. Refer to Inventorying a Hardware Assembly for the `material` component type these declarations usually attach to.

## Derived Origin

Declared origin is an assertion, and the party data supports checking it. Three party facts feed the derivation, starting with the manufacturer party's `addresses`, which locate the plants. For origin purposes the address on the manufacturing party is read as where that party performs its work. The organization's `jurisdiction` records where the company is registered, which is a different fact: a German-registered manufacturer with a Penang plant contributes Malaysia to origin and Germany to ownership. And `relations.parent` chains ownership upward, so control surfaces even when the direct manufacturer looks domestic:

```json
"parties": [
  {
    "bom-ref": "party-northwave",
    "roles": [ { "role": "manufacturer" } ],
    "organization": {
      "name": "Northwave Wireless",
      "jurisdiction": "NL",
      "addresses": [ { "locality": "Eindhoven", "isoCode": "NL-NB" } ]
    },
    "relations": { "parent": "party-hq-holdings" }
  },
  {
    "bom-ref": "party-hq-holdings",
    "roles": [ { "role": "owner" } ],
    "organization": { "name": "HQ Semiconductor Holdings", "jurisdiction": "CN" }
  }
]
```

A FOCI review reads this in one pass: the radio module is made in the Netherlands by a Dutch-registered company whose owner is registered in China. Whether that matters is a policy question, but that it is true is data.

## Reconciling Declared and Derived Origin

A consumer with both paths cross-checks them, the same way declared behavior is checked against observed behavior. The Devkit One board declares its manufacturing origin as a distribution on a stated basis:

```json
"origins": [
  {
    "stage": "manufactured",
    "basis": "number of parts",
    "distribution": [
      { "isoCode": "MY", "percentage": 75 },
      { "isoCode": "US", "percentage": 12.5 },
      { "isoCode": "CN", "percentage": 12.5 }
    ]
  }
]
```

The derivation reproduces it from placements. Each part contributes its designator count under its manufacturer's plant country, and the board has eight placements across three parts:

| Part | Placements | Plant country |
|---|---|---|
| AVR8-328 microcontroller | U5 | US |
| 100 nF capacitor | C3, C4, C9, C11, C14, C15 | MY |
| USB Type-B receptacle | J1 | CN |

Six of eight placements originate in Malaysia, one in the United States, and one in China, which matches the declaration. A declared distribution that the party data cannot reproduce is a finding, and the `basis` states the rule to reproduce it under. Weighting by unit cost or net weight yields different but equally valid distributions, which is why an origin without a basis would be an argument rather than a fact, and why each origin of a subject pairs one stage with one basis. Replacing plant countries with the top of each manufacturer's parent chain converts either path into percentage under foreign control, which is the number a FOCI assessment starts from.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
