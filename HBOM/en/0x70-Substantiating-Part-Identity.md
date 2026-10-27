# Substantiating Part Identity

A part number on a label is an assertion, and counterfeiters print labels. Counterfeit avoidance programs built on SAE AS5553 respond by testing parts and recording what the tests found, and the CycloneDX evidence model carries that record: which identity was concluded, at what confidence, by which techniques, verified by whom, and on what date.

## Identity Evidence

Identity evidence sits on the component under `evidence.identity`. Each entry names the identifier scheme it substantiates, the concluded value, an overall confidence from 0 to 1, a timestamp, an assertion attributing the determination to the parties who made it, and the methods used. The technique vocabulary is shared with software analysis, and the following subset lists every technique applicable to physical parts, omitting the software analysis techniques that the Authoritative Guide to SBOM covers. The physical techniques align with the test methods SAE AS6171 defines for detecting suspect parts.

| Value | Description |
|---|---|
| `visual-inspection` | Visual examination of the item, including markings, labels, date and lot codes, and construction |
| `x-ray-inspection` | Radiographic examination of internal construction, such as the die, lead frame, and wire bonds |
| `electrical-testing` | Electrical measurement compared against expected characteristics |
| `material-analysis` | Analysis of package, lead, or die materials, such as X-ray fluorescence |
| `decapsulation` | Destructive removal of the package to expose the die |
| `manual-review` | Review or analysis performed by a human analyst |
| `attestation` | A determination asserted by a party rather than derived from direct analysis |
| `unknown` | The technique was not recorded, distinct from naming an unlisted technique through the custom form |

A technique outside the predefined set takes the custom form, an object with a required `name`, so a laboratory that runs scanning acoustic microscopy records `"technique": { "name": "acoustic-microscopy" }` rather than filing the result under a nearby predefined value.

Each method records its own confidence and its `result`, and the result is what makes a clean test count. A decapsulation that finds no die anomaly is evidence, and a method that was never run is not.

| Value | Description |
|---|---|
| `detected` | The method found what it tested for, such as the expected marking or die |
| `not-detected` | The method ran and did not find it, which is meaningful negative evidence |
| `inconclusive` | The method ran but could not determine an outcome |

## Supporting Material

An inspection produces photographs, radiographs, and reports, and `evidence.data` keeps them beside the determinations they support. Each entry names the material, states its `type`, and carries its `contents` either inline as a base64 `attachment` with a media type or by `url`, with `hashes` so a recipient can confirm a retrieved file is the one recorded. A `ref` points to the `bom-ref` of the identity determination the material corroborates. The supporting data vocabulary is shared with vulnerability evidence, and the following subset lists every type applicable to physical parts, omitting the request, response, prompt, completion, payload, exploit, data flow, and rule types used for software findings.

| Value | Description |
|---|---|
| `photograph` | A photograph of a physical item, such as the markings on a chip package |
| `screenshot` | A captured image that illustrates the evidence, such as a curve tracer display |
| `report` | A report or output produced by a tool or laboratory |
| `log` | A log or trace captured during analysis, such as automated test equipment output |
| `configuration` | A configuration or setting relevant to the determination, such as a test program revision |

A type outside the predefined set takes the custom form, an object with a required `name` and an optional description, so an x-ray image declares `"type": { "name": "radiograph" }` rather than passing as a photograph.

Inspection material is often sensitive: a radiograph reveals die construction a manufacturer treats as proprietary, and a lab report names customers and lots. Each entry therefore carries a `classification`, and `redacted` states whether the material was cut down before inclusion. A signed document cannot be recalled once redistributed, so material above `public` is better referenced by `url` behind access control than attached inline.

| Value | Description |
|---|---|
| `public` | Public information that can be freely shared |
| `internal` | Internal use only within the organization |
| `confidential` | Confidential information requiring protection |
| `restricted` | Highly restricted information with limited access and special protection measures |
| `classified` | Government or defense classified information subject to national security controls |

A classification outside the predefined set takes the custom form, so a program bound by export controls records `"classification": { "name": "export-controlled" }`.

## Incoming Inspection Record

The following example records an incoming inspection of a microcontroller lot by an independent test laboratory. Four methods agree on the marked part number, the photograph of the top marking is attached inline, and the radiograph and the full report are referenced by URL because both are confidential. The attachment content is truncated:

```json
"evidence": {
  "identity": [
    {
      "bom-ref": "id-mcu-lot-2409",
      "scheme": "mpn",
      "concludedValue": "AVR8-328-PU",
      "confidence": 0.95,
      "timestamp": "2026-07-18T14:30:00Z",
      "assertion": {
        "parties": [ { "party": "party-veriparts", "role": { "role": "inspector" } } ]
      },
      "methods": [
        {
          "technique": "visual-inspection",
          "confidence": 0.9,
          "result": "detected",
          "value": "Laser-etched marking AVR8-328-PU, date code 2409, manufacturer logo present and correctly aligned.",
          "description": "No evidence of blacktopping, sanding, or remarking under 40x magnification."
        },
        {
          "technique": "x-ray-inspection",
          "confidence": 0.85,
          "result": "detected",
          "description": "Die dimensions, lead frame geometry, and wire bonding consistent with the manufacturer reference sample."
        },
        {
          "technique": "electrical-testing",
          "confidence": 0.8,
          "result": "detected",
          "description": "Supply current and oscillator startup within datasheet limits at 25 degrees Celsius."
        },
        {
          "technique": "material-analysis",
          "confidence": 0.75,
          "result": "detected",
          "description": "X-ray fluorescence of the leads shows matte tin over copper, matching the datasheet lead finish."
        }
      ]
    }
  ],
  "data": [
    {
      "name": "Package top marking",
      "ref": "id-mcu-lot-2409",
      "type": "photograph",
      "contents": {
        "attachment": {
          "mediaType": "image/jpeg",
          "encoding": "base64",
          "content": "/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQ"
        },
        "hashes": [
          {
            "alg": "SHA-256",
            "content": "28720365c5e7476a011e4f43ac003ee5f16247a263b9d623aa85ed311d73bf39"
          }
        ]
      },
      "classification": "public",
      "redacted": false
    },
    {
      "name": "Radiograph of die and bond wires",
      "ref": "id-mcu-lot-2409",
      "type": { "name": "radiograph", "description": "X-ray image of internal package construction." },
      "contents": {
        "url": "https://lab.veriparts.example.com/reports/SN-2409-118842/xray-top.png",
        "hashes": [
          {
            "alg": "SHA-256",
            "content": "1a46e6a68c37e8f969bab5d6fe6ce7b4deda2a17d80e1a7142e9c005b108f608"
          }
        ]
      },
      "classification": "confidential"
    },
    {
      "name": "Inspection report SN-2409-118842",
      "ref": "id-mcu-lot-2409",
      "type": "report",
      "contents": {
        "url": "https://lab.veriparts.example.com/reports/SN-2409-118842/report.pdf",
        "hashes": [
          {
            "alg": "SHA-256",
            "content": "845e91831319e89c4d656bdb80c278ac09a7230d61e5dfd2e1b1fbb436ac8917"
          }
        ]
      },
      "classification": "confidential",
      "redacted": true
    }
  ]
}
```

Each method carries its own confidence because techniques fail independently: a counterfeit can pass visual inspection and fail x-ray. The assertion names the laboratory rather than a tool, so the determination has an accountable party, and the timestamp dates it, which matters when a later lot from the same broker fails. The hashes bind each file to the signed document, so a photograph swapped on the laboratory server no longer matches the record.

Evidence also closes the loop with substitution: when a design carries an `XOR` choice, the inspection record on a specific unit states which branch was installed, concluded from the markings photographed on the physical part. Refer to Alternates and Substitution for the choice construct itself.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
