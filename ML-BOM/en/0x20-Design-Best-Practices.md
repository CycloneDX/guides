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

### Describing models as components

A model should always be declared as a CycloneDX `component`.  If the model itself is the subject of the BOM, then the BOM is considered an ML-BOM and the `component` representing it would be declared in the top-level BOM `metadata` object.

The object model's pseudo-schema would look something like this:
![](images/ml-bom-metadata-component.svg)

As you can see in the above example, the `component` has a `bom-ref` that is also a valid [Package URL (PURL)](https://github.com/package-url/purl-spec) for a ["Qwen-7B" model hosted in a Huggingface model repository](https://huggingface.co/Qwen/Qwen-7B). When a valid `purl` value is available for a model, it is recommended that it also be used as its component's `bom-ref`.

#### Model repositories as components

When referencing an ML model as a component, it typically means you are typically referencing a model repository since the models themselves often require multiple files in order to be used for actual training or inference with their pre-trained tensor data.  Model repositories also include metadata, often referred to as model card data,  that describe the model's use cases, design, architecture along with descriptive information on functional techniques that may be unique to the model functional processing.

For example, a Natural Language Processing (NLP) model which uses a common Transformer architecture in Huggingface may include not only tensor data files (e.g., `.safetensors` or `.gguf`) files, but also files that describe the token mappings, tokenizer configurations, prompt templates as well as default (functional) model configurations used to initialize model implementations and more.

###### Example: Qwen/Qwen-7B

Using the Qwen/Qwen-7B model in Huggingface as an discrete example (https://huggingface.co/Qwen/Qwen-7B), we see complete list of files that make up the "model" in its repository:

<img src="images/hf-model-repo-Qwen-7B-file-list.png" width="280" />

##### Stand-alone model files


### Declaring datasets

Using CycloneDX there are two methods to provide information on the datasets used to train, test, and evaluate machine learning models.

Specifically, the component `modelCard` object includes `modelParameters` which includes an array of `datasets` objects which can be of the following types:

1. **In-line information**: provides in-line objects that provide for direct description of datasets and some of their typically cited attributes and characteristics.  Typically, this method mirrors dataset information found in various model catalogs and provides a means for direct, simplified mapping to CycloneDX.
    * *This method may be helpful if the datasets themselves are not public (i.e., directly referenceable), but informational details are.*
2. **Data component reference**: provides for the complete description of each dataset as its own CycloneDX component and referenced via its `bom-ref`.
    * *This method is preferable for use in most security and compliance contexts as it allows for full expression of provenance, pedigree, attestations and other contextual information.*

#### In-line information object model


##### Example


#### Data component references


##### Example


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
