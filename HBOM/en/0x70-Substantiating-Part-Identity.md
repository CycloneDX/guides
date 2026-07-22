# Substantiating Part Identity

A part number on a label is an assertion, and counterfeiters print labels. Counterfeit avoidance programs built on SAE AS5553 respond by testing parts and recording what the tests found, and the CycloneDX evidence model carries that record: which identity was concluded, at what confidence, by which techniques, verified by whom, and on what date.

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

The following example records an incoming inspection of a microcontroller lot by an independent test laboratory. The visual inspection carries the marking text it read and a photograph of the markings as an external reference of type `evidence`:

```json
"evidence": {
  "identity": [
    {
      "scheme": "mpn",
      "concludedValue": "AVR8-328-PU",
      "confidence": 0.95,
      "timestamp": "2026-07-18T14:30:00Z",
      "assertion": { "parties": [ { "party": "party-veriparts" } ] },
      "methods": [
        {
          "technique": "visual-inspection",
          "confidence": 0.9,
          "value": "Laser-etched marking AVR8-328-PU, date code 2409, manufacturer logo present and correctly aligned.",
          "externalReferences": [
            {
              "type": "evidence",
              "url": "https://lab.veriparts.example.com/reports/SN-2409-118842/top-marking.jpg",
              "comment": "Photograph of the package top marking."
            }
          ]
        },
        {
          "technique": "x-ray-inspection",
          "confidence": 0.85,
          "description": "Die dimensions, lead frame geometry, and wire bonding consistent with the manufacturer reference sample."
        },
        {
          "technique": "electrical-testing",
          "confidence": 0.8,
          "description": "Supply current and oscillator startup within datasheet limits at 25 degrees Celsius."
        }
      ]
    }
  ]
}
```

Each method carries its own confidence because techniques fail independently: a counterfeit can pass visual inspection and fail x-ray. The assertion names the laboratory rather than a tool, so the determination has an accountable party, and the timestamp dates it, which matters when a later lot from the same broker fails.

Evidence also closes the loop with substitution: when a design carries an `XOR` choice, the inspection record on a specific unit states which branch was installed, concluded from the markings photographed on the physical part. Refer to Alternates and Substitution for the choice construct itself.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
