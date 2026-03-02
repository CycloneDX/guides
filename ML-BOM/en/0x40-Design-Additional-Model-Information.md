# Additional model-related information

This section describes the design and best practices when providing other model-related information an ML model's component and model card within a CycloneDX ML-BOM.

Currently, the v1.7 CycloneDX specification may not have specific objects or fields to document certain types of information directly.  However, these sections will show how CycloneDX extension mechanisms such as `properties` and `externalReferences` can be used to provide and classify such additional ML-related information.

For convenience, here are links to the specific sections for some of these acknowledged informational areas:

* [Using CycloneDX AI/ML properties](#using-cyclonedx-aiml-properties)
  * [Annotating a model's supported languages](#annotating-a-models-supported-languages)
  * [Providing free-form tags for search](#providing-free-form-tags-for-search)
* [Tokenizers and prompt templates](#tokenizers-and-prompt-templates)
* [Including manufacturing information for the ML model](#including-manufacturing-information-for-the-ml-model)
  * [Declaring hardware and software training components](#declaring-hardware-and-software-training-components)
  * [Providing training workflow details](#providing-training-workflow-details)
  * [Declaring the runtime topology](#declaring-the-runtime-topology)

---

## Using CycloneDX AI/ML properties

This section includes discussion and examples of supported AI/ML-related metadata properties that may be used to classify models as part of their model card information. This method utilizes reserved [AI/ML property names](https://github.com/CycloneDX/cyclonedx-property-taxonomy/cdx/ai-ml.md) registered under the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy).

---

## Annotating a model's supported languages

Models are can be trained in one or more languages (i.e., multilingual models).

* **Property name**: The CycloneDX reserved property taxonomy name to use to annotate a model with its supported languages is: `cdx:ai-ml:model:languages`

* **Property value**: The value for this property should be in the form of a comma-separated list of [ISO 639-1 language codes](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes) (e.g., `"en,fr,de,it,ja,zh"`, etc.).

###### Example: Tagging a model with its supported languages

```json
"component":
{
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/FakeAI/MultilingualLLama",
  // ...,
  "properties": [
    {
      "name": "cdx:ai-ml:model:languages",
      "value": "en,fr,de,it,ja,zh"
    }
  ]
}
```

###### Field discussion

* **properties** - The `value` reflects the set (list) of ISO ISO 639-1 language codes the model was trained to on and thus capable of understanding as input and generating as output.

---

## Providing free-form tags for search

This section describes how to "tag" model components with non-standard keywords and terms seen in various model catalogs or repositories for search or "lookup" purposes.

###### Example: Tagging a model with its supported languages

```json
"component":
{
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/FakeAI/TxtSpeak3",
  // ...,
  "tags": [
    "pytorch",
    "transformers",
    "text-to-speech",
    "speech-to-speech",
    // ...
  ]
}
```

###### Field discussion

* **properties** - The tag values shown above might be used to search for models in a catalog that are compatible with the `pytorch` framework and (the Hugging Face) `transformers` library.  The `text-to-speech` and `speech-to-speech` tags could identify the model with those input/output capabilities.

---

## Tokenizers and prompt templates

Tokenizers provide the preprocessing (encoding) and postprocessing (decoding) functions to convert input and output information to tokens that the associated ML model was trained on and used for inference.

##### Tokenizers and templates as components

It is best practice to treat tokenizers and prompt (or chat) templates as annotated components.

###### Example: Declaring and annotating the Qwen-7B model's tokenizer

Using the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model in Hugging Face, its tokenizer is published (as a Python file) within the model repository and can be represented as a component. We can then utilize the CycloneDX "assembly" composition to declare the tokenizer as a component part of the model. This extends the example from the previous section "[Describing a model repository as a CycloneDX assembly](0x20-Design-Model-Component-Metadata.md#example-qwenqwen-7b-model-repository-files)":

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
    // ...
    "metadata":
    {
      "component":
      {
        "type": "machine-learning-model",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
        // ...,
        "components": [
          {
              "type": "library",
              "name": "tokenization_qwen.py",
              "description": "Python tokenization classes for QWen (QWenTokenizer)",
              "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@e7a368b#tokenization_qwen.py",
              "purl": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#tokenization_qwen.py",
              // ...,
              "properties": [
                {
                  "name": "cdx:ai-ml:model:tokenizer",
                  "value": "QWenTokenizer"
                }
              ]
          },
          // ...
        ]
      }
    }
  // ...
}
```

###### Field discussion

* **properties** - Utilizes the reserved CycloneDX property name `cdx:ai-ml:model:tokenizer`, with a tokenizer class name, to annotate the component as being a "tokenizer".

###### Example: Annotating a model with its chat template

For the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model, the chat template uses the standard [`ChatML`](https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats) format (see [Hugging Face "Common Template Formats"](https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats))   which can be referenced on the model component as follows:

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  // ...,
  "metadata":
  {
    "component":
    {
      "type": "machine-learning-model",
      "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
      // ...,
      "properties": [
        {
          "name": "cdx:ai-ml:model:template:chat",
          "value": "ChatML"
        }
      ]
    }
  },
  // ...
}
```

* **properties** - Utilizes the reserved CycloneDX property name `cdx:ai-ml:model:template:chat`, with the name widely used `ChatML` template.

---

## Including manufacturing information for the ML model

This section shows how "manufacturing" (i.e., "training") information is provided relative to the model described by an ML-BOM.

In short, this is accomplished utilizing objects which are part of the [CycloneDX Manufacturing Bill-of-Materials (or MBOM)](https://cyclonedx.org/capabilities/mbom/) to describe the frameworks, systems, platforms and libraries used to train the model against a detailed workflow-task description.

> **Note**: The "manufacturing" information may be included within the ML-BOM itself or provided as a separate MBOM and cross-linked to each other using the CycloneDX `BOMLink` (see [BOM-Link](https://cyclonedx.org/capabilities/bomlink/) documentation).

#### Declaring hardware and software training components

###### Example: Sample methodology for declaring the "training stack"

First, create entries for all the "components" used in the training process as part of the `formulation` object:

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  // ...,
  "metadata": {
    "component": {
      "type": "machine-learning-model",
      "bom-ref": "pkg:huggingface/FakeAI/llama3@abcd",
    }
  },
  // ...,
  "formulation": {
    // ...,
    "components": [
      {
        "type": "container",
        "name": "h100-training-image",
        "version": "25.03-py3-igpu",
        "bom-ref": "pkg:oci/nvidia-pytorch@sha256:f398a0",
        "purl": "pkg:oci/nvidia-pytorch@sha256:f398a0955ec5fcf9e3bbf77610225ff4e953e137423ab248e2bf32cd4971a1dc?repository_url=nvcr.io/nvidia/pytorch&tag=25.03-py3-igpu"
      },
      {
        "type": "library",
        "name": "nvidia-cuda-runtime",
        "version": "12.2.0",
        "bom-ref": "pkg:generic/nvidia-cuda-runtime@12.2.0",
        "purl": "pkg:generic/nvidia-cuda-runtime@12.2.0"
        },
      {
        "type": "library",
        "name": "pytorch",
        "version": "2.10.0",
        "bom-ref": "pkg:pypi/pytorch@2.10.0",
        "purl": "pkg:pypi/pytorch@2.10.0"
      },
      {
        "type": "library",
        "name": "cuda-toolkit",
        "version": "13.1.1",
        "bom-ref": "pkg:pypi/cuda-toolkit@13.1.1",
        "purl": "pkg:pypi/cuda-toolkit@13.1.1"
      },
      {
        "type": "library",
        "name": "nccl",
        "version": "2.19.3",
        "bom-ref": "pkg:generic/nccl@2.29.2",
        "purl": "pkg:generic/nccl@2.29.2"
      },
      {
        "type": "device",
        "name": "NVIDIA H100 Tensor Core GPU",
        "model": "H100 PCIe"
        "description": "NVIDIA H100 Tensor Core GPU PCIe Device",
        "bom-ref": "nvidia-h100-pcie-gpu-1",
      },
      // ...
    ]
  },
  // ...
}
```

###### Field discussion

* **components** - The components listed to "train" the model shown above would also include "data" type components as described in the previous section "[Declaring datasets](0x22-Design-Model-Card-Parameters.md#declaring-datasets)".

### Providing training workflow details

After the hardware and software "stack" of training components have been declared under the `formulation` object, a CycloneDX `workflow` object, with the details of the training tasks as `task` objects (inclusive of all relevant inputs, outputs, steps, etc.), can then be declared:

###### Example: Declaring a training workflow & tasks

```json
"formulation": {
  // ...,
  "workflows": [
    {
      "name": "Model training workflow",
      "description": "Describes the tasks used for training the model described by the ML-BOM."
       "tasks": [
         {
           "name": "Train model in NVIDIA OCI container",
           "description": "Describes the steps used to train the model using commands and libraries in the container image.": [ ... ],
           "steps": [ ... ],
           "inputs": [ ... ],
           "outputs": [ ... ],
           // ...
         }
      ]
    }
  ]
}
```

### Declaring the runtime topology

Lastly, you would describe the component "stack" as a graph of `runtimeTopology` dependencies for the workflow above. In this case, the training was done using an OCI (Open Container Initiative) standard container image which "provide" a declared set of component libraries (pre-installed on the image):

###### Example: Declaring the runtime topology used for the training workflow tasks

```json
"formulation": {
  "workflows": [
    {
       "tasks": [ ... ],
       // ...,
       "runtimeTopology": [
       {
          "ref": "pkg:oci/nvidia-pytorch@sha256:f398a0",
          "dependsOn": "nvidia-h100-pcie-gpu-1",
          "provides": [
            "cuda-toolkit",
            "pkg:oci/nvidia-pytorch@sha256:f398a0",
            "pkg:pypi/pytorch@2.10.0",
            "pkg:generic/nccl@2.29.2"
          ]
        }
      ]
    }
  ]
}
```

###### Field discussion

* **workflows** - In this example, a "training" workflow was shown; however, additional workflows could detail other processes such as "testing" (i.e., model "evaluation"), fine-tuning, and more.
</br>If there are multiple workflows within the `formulation` object, the subset of components specific to a workflow can optionally be declared using the `resourceReferences` object within the respective `workflow` object.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
