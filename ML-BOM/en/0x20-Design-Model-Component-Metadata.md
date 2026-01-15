# ML-BOM Design and Best Practices

## Overview

A Machine Learning Bill-of-Materials (MLBOM or ML-BOM) is an object model to describe a machine learning model, its compositional assets and other descriptive information often used to assess risk and compliance. Support for MLBOM is included in CycloneDX v1.5 and higher.

An MLBOM makes use of many of the common, core elements of the CycloneDX schema as well as unique aspects specific to ML components, their architectures, metadata, training and other information used to gauge adherence to regulatory compliance.

This section will include specifics and best practices of how ML-related information should be conveyed using both using the CycloneDX schema.

The [Core Concepts](0x15-Core-Concepts.md#key-components-of-an-ml-bom) listed in the previous section will be used to provide details, best practices and examples of how to provide the corresponding information using CycloneDX schema objects.

For convenience, here are links to the specific sections for each of those informational areas:

- [Anatomy of an ML-BOM](#anatomy-of-an-ml-bom)
    - [Describing models as components](#describing-models-as-components)
    - [Model repositories as components](#model-repositories-as-components)
    - [Model identifiers](#model-identifiers)
    - [Model metadata](#model-metadata)

---

## Anatomy of an ML-BOM

In CycloneDX, a model is considered a `component` where general best practices for providing information such as component identification, metadata, provenance, pedigree, etc. should be followed as documented in the [CycloneDX Authoritative Guide to SBOM](https://cyclonedx.org/guides/OWASP_CycloneDX-Authoritative-Guide-to-SBOM-en.pdf).


![Diagram: Anatomy of an ML-BOM](images/anatomy.svg)

---

## Model Component

### Describing models as components

A model should always be declared as a CycloneDX `component`.  If the model itself is the subject of the BOM, then the BOM is considered an ML-BOM and the `component` representing it would be declared in the top-level BOM `metadata` object.

The object model's pseudo-schema would look something like this:
![](images/ml-bom-metadata-component.svg)

##### Example: JSON equivalent

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  "bomFormat": "CycloneDX",
  "specVersion": "1.7",
  "serialNumber": "urn:uuid:ec45525e-516c-4405-9de3-4fbdaef7f09a",
  "version": 1,
  "metadata":
  {
    "component":
    {
      "type": "machine-learning-model",
      "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9c57b252f3149c1408daf4d649ec8b6c85",
      ...
    }
    ...
  }
  ...
}
```

#### Model repositories as components

When referencing an ML model as a component, it typically means you are referencing a **model repository** comprised of metadata and a set of files (e.g., pre-trained tensor data in various formats, model configurations, tokenizers, tokenizer configurations, prompt templates, Python code, etc.) which would be selectively used with various, compatible AI or ML applications and frameworks.

If possible, these model repositories should be treated like a software "package" in a Software Bill-of-Materiels (SBOM) when declaring it as a `machine-learning-model` type of CycloneDX component.

###### Example: CycloneDX for the Qwen-7B model repository

The following example shows how the Qwen-7B model repository would be declared as a CycloneDX `component` of type `machine-learning-model` in a CycloneDX ML-BOM as its subject component.

Since the the model repository is hosted in Hugging Face Hub, the [Huggingface package type](https://github.com/package-url/purl-spec/blob/main/types/huggingface-definition.json) may be used [Package URL specification](https://github.com/package-url/purl-spec) to identify the model.

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  ...
  "metadata":
  {
    "component":
    {
      "type": "machine-learning-model",
      "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9c57b252f3149c1408daf4d649ec8b6c85",
      "purl": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9c57b252f3149c1408daf4d649ec8b6c85",
      "group": "Qwen"
      "manufacturer": "Alibaba Cloud",
      "supplier": "Hugging Face",
      "name": "Qwen/Qwen-7B",
      "version": "ef3c5c9c57b252f3149c1408daf4d649ec8b6c85",
      "description": "Qwen-7B is a Transformer-based large language model, which is pretrained on a large volume of data, including web texts, books, codes, etc.",
      "externalReferences": [
        {
          "type": "vcs",
          "url": "https://huggingface.co/"
        },
        {
          "type": "model-card",
          "url": "https://huggingface.co/Qwen/Qwen-7B"
        }
      ],
      "modelCard": {
        ...
      }
    }
  }
}

```

###### Discussion of model fields and metadata

This section provides best practice guidance on how the component fields were filled out for this example.

- **bom-ref** - Since a PURL is available, it can also be used as the `bom-ref`.
- **purl** - The Package URL (PURL) follows the [Huggingface package type](https://github.com/package-url/purl-spec/blob/main/types/huggingface-definition.json) using a commit hash.
- **manufacturer** - The name of the company which built the Qwen model.
- **group** - In this example, we chose to include the optional group field to acknowledge the specific model repository is part of the Qwen family of models.
- **name** - The model name reflects how the model is identified under Hugging Face using the `<owner_name>/<repository_name>` format.
- **version** - Models are not always versioned in the way software packages are (e.g., using `semver` format); however, within repositories such as Huggingface, the version is determined by its version control system's *commit hash*, *tag*, or *branch*. In the above example, the model's commit hash is used and matches the `purl` value.</br>
- **externalReferences** - Used to provide unambiguous links to component's model repository and originating model card.
  - **vcs** - Provides a link to the version control system (i.e., the model provider aka. `supplier`). In this example, this is Hugging Face and affirms the associated PURL identifier.
  - **model-card** - Provides a link to the model's Hugging Face model card which is comprised of mostly unstructured information in the form of a markdown file (i.e., README.md).</br>*The CycloneDX representation of model card information will be detailed in a subsequent section.*



#### Model identifier(s)

As you can see in the above example, the `component` has a `bom-ref` that is also a valid [Package URL (PURL)](https://github.com/package-url/purl-spec) for a ["Qwen-7B" model hosted in a Huggingface model repository](https://huggingface.co/Qwen/Qwen-7B) using the [Hugging Face PURL type](https://github.com/package-url/purl-spec/blob/main/types-doc/huggingface-definition.md). When a valid `purl` value is available for a model, it is recommended that it also be used as its component's `bom-ref`.

If the model being described by an ML-BOM is instead hosted in a GitHub repository, it can also be referenced using a [GitHub Package URL](https://github.com/package-url/purl-spec/blob/main/types-doc/github-definition.md). For example, the ONNX vision model: [tiny-yolov2](https://github.com/onnx/models/tree/main/validated/vision/object_detection_segmentation/tiny-yolov2/model) would have a `github` PURL type.

###### Example: JSON for model component with GitHub PURL

```json
"component":
{
  "type": "machine-learning-model",
  "bom-ref": "pkg:github/onnx/models/validated/vision/object_detection_segmentation/tiny-yolov2/model@4c46cd0",
  ...
}
```

##### Adding domain-specific identifiers

Organizations that produce BOMs for hardware or software components they produce may have a plurality of domain-specific identifiers for the same component.  In these cases, it is best practice to register (reserve) an official namespace for these domains with the [CycloneDX Property Taxonomy]() which is the authoritative source of official namespaces used in CycloneDX `properties`.

###### Example:

The following example shows how a registered names for a fictional company ACME which registered the namespace `acme` could provide a property to identify one of its internal ML models.

```json
"component": {
  "properties": [
    {
      "name": 'acme:research:model:llm:id',
      "value": "MODEL-ID-12345-INTERNAL"
    },
    ...
  ],
  ...
}
```

##### Identifying a specific model quantization

> [!TODO]
> Need to discuss with PURL community as this is not exampled for Huggingface package type.

---

#### Describing a model repository as a CycloneDX assembly

CycloneDX allows for declarations of software compositions (e.g., hardware products, software applications, packages, libraries, archives, etc.).

In the case of a model repository like those hosted in Hugging Face, one can describe the files that comprise it as a composition with an ML-BOM.  Specifically, it would be declared as an assembly type of composition.

Specifically, a `component` entry would be created for each file and declared in the ML-BOM's `components` array then the assembly relationship would appear within the BOM's `compositions` array under `assemblies` using `bom-ref` links to each of the file components.

###### Example: Qwen/Qwen-7B model

If we look inside the repository for the [Qwen/Qwen-7B model in Huggingface](https://huggingface.co/Qwen/Qwen-7B), we see the complete list of files that make up the "model" in its repository:

<img src="images/hf-model-repo-Qwen-7B-file-list.png" width="280" />

###### CycloneDX for the Qwen/Qwen-7B assembly

The simplified JSON below shows how to declare a few of the files from the model repository's complete file list.

Note that we use the Package URL syntax to provide the additional path (with the model repository or "package") to each individual file by appending it using the `#` hash symbol as a separator.  Also, notice that the commit hash (identifier) varies per-file.

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  ...
  "components": [
    {
        "type": "file",
        "name": "config.json",
        "description": "Model configuration file",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#config.json",
        "purl": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#config.json",
        ...
    },
    {
        "type": "file",
        "name": "configuration_qwen.py",
        "description": "Python 'QWenConfig' class implementation for the Qwen 7B model",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@a6ca629d063f56f34d184852301e8852a7afbd58#configuration_qwen.py",
        "purl": "pkg:huggingface/Qwen/Qwen-7B@a6ca629d063f56f34d184852301e8852a7afbd58#configuration_qwen.py",
        ...
    },
    {
        "type": "data",
        "name": "model-00001-of-00008.safetensors",
        "description": "Model tensor data (01 of 08)",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00001-of-00008.safetensors",
        "purl": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00001-of-00008.safetensors",
        ...
    },
    {
        "type": "data",
        "name": "model-00002-of-00008.safetensors",
        "description": "Model tensor data (02 of 08)",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00002-of-00008.safetensors",
        "purl": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00002-of-00008.safetensors",
        ...
    },
    ...
  ],
  ...
}
```

These component files would then be used to create the assembly relationship.

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  ...
  "composition": [
    {
      "aggregate": "complete",
      "components": [
        "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#config.json",
        "pkg:huggingface/Qwen/Qwen-7B@a6ca629d063f56f34d184852301e8852a7afbd58#configuration_qwen.py",
        "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00001-of-00008.safetensors",
        "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00002-of-00008.safetensors",
        ...
      ]
    }
  ],
  ...
}
```

---

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
