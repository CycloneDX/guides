# Alternates and Substitution

Physical products are built from parts that change. A transistor goes end-of-life, a second source is qualified, an integrated part is replaced by discretes when supply tightens, and every one of those decisions is invisible in a flat parts list. The component-choice construct records substitution as data: a wrapper in the `components` array with a logical `operator` and two or more entries, where each entry is a component or another choice.

| Value | Description |
|---|---|
| `OR` | Any non-empty subset of the contained components may be installed |
| `XOR` | Exactly one of the contained components is installed in any single unit |
| `AND` | All of the contained components are installed together as a group |

## One-for-One Substitution

Two approved transistors satisfy the Q3 switching function, and any single board carries exactly one of them. The choice is `XOR`, and the rationale lives on the wrapper:

```json
{
  "type": "component-choice",
  "bom-ref": "choice-q3",
  "name": "Q3 NPN switching transistor",
  "description": "Either transistor satisfies the Q3 switching function. Both are approved for production.",
  "operator": "XOR",
  "components": [
    { "bom-ref": "comp-2n2222", "type": "device", "name": "2N2222" },
    { "bom-ref": "comp-pn2222a", "type": "device", "name": "PN2222A" }
  ]
}
```

Each alternate remains a complete component, with its own manufacturer, identifiers, and placement, so a consumer evaluates the alternates with the same data it has for any other part. The population of shipped units may contain both transistors across production lots, while any individual unit contains exactly one.

## One Part or a Group of Parts

Substitution is not always one for one: an integrated level shifter and a discrete MOSFET pair produce the same electrical function in the end product, and the discrete route is only valid as a set. Nesting expresses it: the outer choice is `XOR`, and the discrete branch is an inner choice with `AND`:

```json
{
  "type": "component-choice",
  "bom-ref": "choice-level-shift",
  "name": "U9 3.3 V to 5 V level shifting",
  "operator": "XOR",
  "components": [
    { "bom-ref": "comp-txb0104", "type": "device", "name": "TXB0104 Level Shifter" },
    {
      "type": "component-choice",
      "bom-ref": "choice-discrete-shift",
      "name": "Discrete level shifting pair",
      "operator": "AND",
      "components": [
        { "bom-ref": "comp-bss138", "type": "device", "name": "BSS138 N-Channel MOSFET" },
        { "bom-ref": "comp-rnet", "type": "device", "name": "10 kOhm Resistor Network" }
      ]
    }
  ]
}
```

A unit built with the TXB0104 and a unit built with the MOSFET and resistor network are both conformant builds of the same design, and the document says so without a footnote.

## Consuming Choices

A design-intent document carries choices unresolved: it describes what may be built. A document describing one physical unit resolves each `XOR` to the installed component, which is where identity evidence earns its place. Refer to Substantiating Part Identity for how an inspection ties the installed part to one branch of a choice. Availability tooling reads choices the other way around: every `XOR` with two or more viable branches is sourcing resilience, and an `XOR` whose branches share one upstream manufacturer is resilience on paper only.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
