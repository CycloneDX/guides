## Composition Completeness, "Known Unknowns", and Redactions
The inventory of components, services, and their relationships to one another can be described through the use of
compositions. Compositions describe constituent parts (including components, services, and dependency relationships) and
their completeness. The completeness of vulnerabilities expressed in a BOM may also be described. This allows BOM authors
to describe how complete the BOM is or if there are components in the BOM where completeness is unknown or has been 
redacted.

| Aggregate                               | Description                                                                                                                                                                             |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| complete                                | The information is complete. No further relationships including constituent components, services, or dependencies are known to exist.                                                   |
| incomplete                              | The information is incomplete.                                                                                                                                                          |
| incomplete_first_party_only             | The information is incomplete. Only relationships for first-party components, services, or their dependencies are represented.                                                          |
| incomplete_first_party_proprietary_only | The information is incomplete. Only relationships for third-party components, services, or their dependencies are represented, limited specifically to those that are proprietary.      |
| incomplete_first_party_opensource_only  | The information is incomplete. Only relationships for third-party components, services, or their dependencies are represented, limited specifically to those that are opensource.       |
| incomplete_third_party_only             | The information is incomplete. Only relationships for third-party components, services, or their dependencies are represented.                                                          |
| incomplete_third_party_proprietary_only | The information is incomplete. Only relationships for third-party components, services, or their dependencies are represented, limited specifically to those that are proprietary.      |
| incomplete_third_party_opensource_only  | The information is incomplete. Only relationships for third-party components, services, or their dependencies are represented, limited specifically to those that are opensource.       |
| redacted                                | The information has been redacted.                                                                                                                                                      |
| unknown                                 | The information may be complete or incomplete. This usually signifies a 'best-effort' to obtain constituent components, services, or dependencies but the completeness is inconclusive. |

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

The following illustrates how compositions can be used. In this example, there are three compositions.
1. In the first object, the component assembly and the dependencies of the application are both complete.
2. In the second object, the completeness of the component assembly is unknown.
3. In the third object, the component is listed in the BOM, but its information and completeness have been redacted.

```json
"compositions": [
  {
    "aggregate": "complete",
    "assemblies": [
      "pkg:maven/partner/shaded-library@1.0"
    ],
    "dependencies": [
      "acme-application-1.0"
    ]
  },
  {
    "aggregate": "unknown",
    "assemblies": [
      "pkg:maven/acme/library@3.0"
    ]
  },
  {
    "aggregate": "redacted",
    "assemblies": [
      "my-redacted-component"
    ]
  }
]
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
