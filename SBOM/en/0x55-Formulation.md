## Formulation
CycloneDX can describe declared and observed formulations for reproducibility throughout the product lifecycle of components and services. Formulation establishes relationships with components and services, each of which can be referenced in a given formula through a series of workflows, tasks, and steps.

This advanced capability provides transparency into how components were made, how a model was trained, or how a service was created or deployed. 

## Composability

Generally, a component or service's formulation information is externalized from the SBOM into a dedicated Manufacturing Bill of Materials (MBOM). The SBOM references the MBOM that describes the environment, configuration, tools, and all other considerations necessary to replicate a build with utmost precision. This capability allows other parties to independently verify inputs and outputs from a build which can increase the software's assurance. 

The following example illustrates an SBOM where a component referenced the corresponding MBOM describing how the 
component was made. Independent access controls can be established by separating the SBOM inventory from potentially 
highly-sensitive MBOM data. For example, this allows organizations to provide SBOMs to a broader audience while keeping 
stricter control over who has access to the MBOM.

```json
"externalReferences": [
  {
    "type": "formulation",
    "url": "https://example.com/mboms/acme-library-1.0.cdx.json",
    "hashes": [
      {
        "alg": "SHA-256",
        "content": "c7be1ed902fb8dd4d48997c6452f5d7e509fbcdbe2808b16bcf4edce4c07d14e"
      }
    ]
  }
]
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
