# Hardware Certifications

A certification is a third party's statement that a subject meets a named standard, and physical products collect them: radio equipment marks, safety approvals, automotive qualifications, quality system registrations. The `certification` object records the statement, and it attaches to components of any type, so an FCC grant on a radio module and a FIPS 140-3 validation on a crypto library use the same structure.

A certification requires the `standard` and optionally carries the certificate `identifier`, the `issuer` as a reference to a party, issue and expiration dates, the `scope` of what was assessed, the `jurisdiction` where the mark applies, the `level` where the scheme defines grades, and a URL to the certificate record. The following example records an automotive qualification issued by a test laboratory:

```json
"certifications": [
  {
    "bom-ref": "cert-aecq100",
    "standard": "AEC-Q100",
    "identifier": "RCL-2026-04471",
    "issuer": "party-ridgecrest",
    "issuedDate": "2026-03-02",
    "level": "Grade 1",
    "scope": "Automotive qualification of the AVR8-328 in the 28-pin PDIP package.",
    "jurisdiction": "US",
    "relatedClaims": [ "claim-aecq100-stress" ],
    "url": "https://certs.ridgecrest.example.com/RCL-2026-04471"
  }
]
```

The issuer is a party like any other, so the certification body carries its own jurisdiction and identifiers, and an assessor can judge the certifier as well as the certificate.

## The Tie to Attestations

A certification names a conclusion. CycloneDX Attestations (CDXA) carries the reasoning: claims about a target, the evidence and counter evidence behind each claim, and the signatures of the parties standing behind them. The optional `relatedClaims` array ties the two together by referencing the CDXA claims that substantiate the certification:

```json
"declarations": {
  "claims": [
    {
      "bom-ref": "claim-aecq100-stress",
      "target": "comp-mcu",
      "predicate": "The AVR8-328 Rev. E passed AEC-Q100 Grade 1 accelerated stress testing across all test groups."
    }
  ]
}
```

Without the tie, a certification is a reference to a document a human reads. With it, "Grade 1" resolves to the specific claims the laboratory made, and a consumer follows the chain from mark to claim to evidence without leaving machine-readable data. Certificates expire and get suspended, so consumers should treat `expirationDate` as load-bearing and re-verify rather than cache the conclusion.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
