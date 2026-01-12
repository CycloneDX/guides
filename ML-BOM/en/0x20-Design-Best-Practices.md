# ML-BOM Design and Best Practices

## Overview

A Machine Learning Bill-of-Materials (MLBOM or ML-BOM) is an object model to describe a machine learning model, its compositional assets and other descriptive information often used to assess risk and compliance. Support for MLBOM is included in CycloneDX v1.5 and higher.

An MLBOM makes use of many of the common, core elements of the CycloneDX schema as well as unique aspects specific to ML components, their architectures, metadata, training and other information used to gauge adherence to regulatory compliance.

This section will include specifics and best practices of how ML-related information should be conveyed using both using the CycloneDX schema.

The [Core Concepts](0x15-Core-Concepts.md#key-components-of-an-ml-bom) listed in the previous section will be used to provide details, best practices and examples of how to provide the corresponding information using CycloneDX schema objects.

For convenience, here are links to the specific sections for each of those informational areas:

- [Model representation](#model-representation)
- [Model identifiers](#model-identifiers)
- [Model metadata](#model-metadata)
- [Model architecture]()
- [Datasets]()
- [Tokenizers and prompt templates]()
- [Hardware, software & frameworks]()
- [Training & testing details]()
- [Intended use & ethics]()
- [Environmental impacts]()

---

## Anatomy of an ML-BOM

In CycloneDX, a model is considered a `component` where general best practices for providing information such as component identification, metadata, provenance, pedigree, etc. should be followed as documented in the [CycloneDX Authoritative Guide to SBOM](https://cyclonedx.org/guides/OWASP_CycloneDX-Authoritative-Guide-to-SBOM-en.pdf).


![Diagram: Anatomy of an ML-BOM](images/anatomy.svg)

#### Describing models as components



##### Stand-alone model files


##### Model repositories


---

## Model card

CycloneDX

### Model identifiers

####


---

### Model metadata

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
