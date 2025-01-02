# Composability

Formulation information describes the environment, configuration, tools, components, services, tools and their relationships along with the workflows, tasks and steps necessary to replicate a manufacturing process with utmost precision. In its most extreme, it can include enough information to assure repeatabiliy of the manufacturing process in an independent manner. 

This level of information capture can result in a large set of information which can and should be externalized from its primary compositional BOM (xBOM) into a dedicated Manufacturing Bill of Materials (MBOM) which can then be referenced using CycloneDX BOM-link mechanism. 

## Example: SBOM referencing and MBOM

The following example illustrates an SBOM where a component referenced the corresponding MBOM describing how the 
component was made. Independent access controls can be established by separating the SBOM inventory from potentially 
highly-sensitive MBOM data. 

This separation enables organizations to provide SBOMs to a broader audience while keeping stricter control over who has access to the MBOM.

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
