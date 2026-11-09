# Additional model-related information

This section describes the design and best practices when providing other model-related information for an ML model's component within a CycloneDX AI/ML-BOM.

Currently, the v2.0 CycloneDX specification may not have specific objects or fields to document certain types of information directly.  However, these sections will show how CycloneDX extension mechanisms, such as `properties`, `tags`, and `externalReferences`, can be used to provide and classify such additional ML-related information.

For convenience, here are links to the specific sections for some of these acknowledged informational areas:

* [Using CycloneDX AI/ML properties](#using-cyclonedx-aiml-properties)
  * [Declaring a model's modalities](#declaring-a-models-modalities)
  * [Annotating a model's supported languages](#annotating-a-models-supported-languages)
  * [Providing free-form tags for search](#providing-free-form-tags-for-search)
  * [Providing a model's usage policy](#providing-a-models-usage-policy)
* [Tokenizers and prompt templates](#tokenizers-and-prompt-templates)
* [Including manufacturing information for the ML model](#including-manufacturing-information-for-the-ml-model)
  * [Declaring hardware and software training components](#declaring-hardware-and-software-training-components)
  * [Providing training workflow details](#providing-training-workflow-details)
  * [Declaring the runtime topology](#declaring-the-runtime-topology)

## Using CycloneDX AI/ML properties

This section includes discussion and examples of supported AI/ML-related metadata properties that can be used to classify models in their AI/ML-BOM. This method utilizes reserved [AI/ML property names](https://github.com/CycloneDX/cyclonedx-property-taxonomy/blob/main/cdx/ai-ml.md) registered under the [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy).

> **Note**: The CycloneDX schema is standardized through Ecma International (and ISO) and changes on its ratification cycle, whereas new names and values can be registered in the property taxonomy at any time.  Properties therefore allow AI/ML-BOMs to keep pace with new AI/ML concepts without waiting for a schema revision.  Names that are not (yet) registered may be declared using the `_undefined:<NAME>` placeholder convention (e.g., `cdx:ai-ml:model:hyperparameter:_undefined:rope_theta`).

### Declaring a model's modalities

Models are trained to support processing and analysis of one or more types of input data for specific tasks or data modalities.

* **Property name**: The CycloneDX reserved property taxonomy name to use to annotate a model with its supported modalities is: `cdx:ai-ml:model:modality`

* **Property value**: The values for this property includes:

  * `text` - Natural Language Processing (NLP) and specializations such as Natural Language Understanding (NLU) for tasks like translation, summarization, conversation, classification and sentiment analysis.
  * `code` - Specialized text-based modality used for software engineering and logic.
  * `instruct` - Specialized text-based fine-tuned for understanding and executing natural language directives (i.e., instruction following).
  * `image` (vision) - Computer vision for object detection, generation, and classification as well as document processing.
  * `video` - Video processing tasks to extract structured information, including object detection, action recognition, scene detection, and temporal understanding.
  * `audio` - Audio processing tasks such as Automatic Speech Recognition (ASR), Speech-to-Text, music generation, and sound pattern recognition.
  * `sensor` (telemetry) - Processes data from specialized sensors or hardware, such as LiDAR for autonomous vehicles or IoT sensor feeds.
  * `biometric` - Specialized sensor-based modality used for analyzing biological traits for tasks such as facial recognition, fingerprint scanning, or voice authentication.
  * `genomic` (telemetry) - Processes high-dimensional data used in drug discovery and medical research.
  * `_undefined:<NAME>` - `<NAME>` placeholder, used to provide an arbitrary model modality name.

> **Note**: In CycloneDX 2.0, each of the model's `inputs` and `outputs` in `modelProperties` also has a native `modality` field (`text`, `image`, `audio`, `video`, `multimodal`, `embedding`, or `logits`) describing the data format of that parameter (see [Inputs & outputs](0x22-Design-Model-Card-Parameters.md#inputs--outputs)).  The `cdx:ai-ml:model:modality` property complements these by describing the model's overall capabilities (e.g., `code` or `instruct`).

###### Example: Tagging a model with its modalities

```json
{
  "type": "machine-learning-model",
  "refId": "pkg:huggingface/FakeAI/CoderModel",
  "name": "FakeAI/CoderModel",
  // ...,
  "properties": [
    {
      "name": "cdx:ai-ml:model:modality",
      "value": "code"
    },
    {
      "name": "cdx:ai-ml:model:modality",
      "value": "instruct"
    }
  ]
}
```

### Annotating a model's supported languages

Models can be trained in one or more languages (i.e., multilingual models).

* **Property name**: The CycloneDX reserved property taxonomy name to use to annotate a model with its supported languages is: `cdx:ai-ml:model:language`

* **Property value**: The value for this property should be a single [ISO 639-1 language code](https://en.wikipedia.org/wiki/List_of_ISO_639_language_codes) (e.g., `"nl"`) or a comma-separated list of ISO 639-1 language codes (e.g., `"en,fr,de,it,ja,zh"`, etc.).  The property may also appear multiple times.

###### Example: Tagging a model with its supported languages

```json
{
  "type": "machine-learning-model",
  "refId": "pkg:huggingface/FakeAI/MultilingualLLama",
  "name": "FakeAI/MultilingualLLama",
  // ...,
  "properties": [
    {
      "name": "cdx:ai-ml:model:language",
      "value": "en,fr,de,it,ja,zh"
    }
  ]
}
```

###### Field discussion

* **properties** - The `value` reflects the set (list) of ISO 639-1 language codes the model was trained on and thus capable of understanding as input and generating as output.

### Providing free-form tags for search

This section describes how to "tag" model components with non-standard keywords and terms seen in various model catalogs or repositories for search or "lookup" purposes.

###### Example: Tagging a model with free-form tags

```json
{
  "type": "machine-learning-model",
  "refId": "pkg:huggingface/FakeAI/TxtSpeak3",
  "name": "FakeAI/TxtSpeak3",
  // ...,
  "tags": [
    "pytorch",
    "transformers",
    "text-to-speech",
    "speech-to-speech"
    // ...
  ]
}
```

###### Field discussion

* **tags** - The tag values shown above might be used to search for models in a catalog that are compatible with the `pytorch` framework and (the Hugging Face) `transformers` library.  The `text-to-speech` and `speech-to-speech` tags could identify the model with those input/output capabilities.  Note that tasks with predefined values (e.g., `text-to-speech`) should also be declared in the model's `modelProperties.tasks`.

### Providing a model's usage policy

Model usage policies can be provided using `externalReferences` associated with the model's component definition.

###### Example: Providing a link to a model's usage policy

```json
{
  "type": "machine-learning-model",
  "refId": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
  "name": "Qwen/Qwen-7B",
  // ...,
  "externalReferences": [
    {
      "url": "https://qwen.ai/usagepolicy",
      "type": "documentation",
      "comment": "Usage policy"
    }
  ]
  // ...
}
```

## Tokenizers and prompt templates

Tokenizers provide the preprocessing (encoding) and postprocessing (decoding) functions to convert input and output information to tokens that the associated ML model was trained on and used for inference.

##### Tokenizers and templates as components

It is best practice to treat tokenizers and prompt (or chat) templates as annotated components.

###### Example: Declaring and annotating the Qwen-7B model's tokenizer

Using the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model in Hugging Face, its tokenizer is published (as a Python file) within the model repository and can be represented as a component. We can then declare the tokenizer as a component part of the model's inventory (assembly). This extends the example from the previous section "[Describing a model repository as a CycloneDX assembly](0x20-Design-Model-Component-Metadata.md#example-qwenqwen-7b-model-repository-files)":

```json
{
  "$schema": "https://cyclonedx.org/schema/2.0/cyclonedx-2.0.schema.json",
  // ...
  "inventories": [
    {
      "subject": {
        "type": "machine-learning-model",
        "refId": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
        "name": "Qwen/Qwen-7B"
        // ...
      },
      "components": [
        {
          "type": "library",
          "name": "tokenization_qwen.py",
          "description": "Python tokenization classes for QWen (QWenTokenizer)",
          "refId": "pkg:huggingface/Qwen/Qwen-7B@e7a368b#tokenization_qwen.py",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#tokenization_qwen.py"
                }
              ]
            }
          ],
          // ...,
          "properties": [
            {
              "name": "cdx:ai-ml:model:tokenizer",
              "value": "true"
            },
            {
              "name": "cdx:ai-ml:tokenizer:hyperparameter:tokenizer_class",
              "value": "QWenTokenizer"
            }
          ]
        }
        // ...
      ]
    }
  ]
  // ...
}
```

###### Field discussion

* **properties**
  * Utilizes the reserved CycloneDX (boolean) property name `cdx:ai-ml:model:tokenizer` to annotate the component as being a "tokenizer".
  * Utilizes the reserved CycloneDX property name `cdx:ai-ml:tokenizer:hyperparameter:tokenizer_class` to provide the tokenizer's class name.

###### Example: Annotating a model with its chat template

For the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model, the chat template uses the standard [`ChatML`](https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats) format (see [Hugging Face "Common Template Formats"](https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats)), which can be declared as a component of the model and annotated as a chat template as follows:

```json
{
  "$schema": "https://cyclonedx.org/schema/2.0/cyclonedx-2.0.schema.json",
  // ...,
  "inventories": [
    {
      "subject": {
        "type": "machine-learning-model",
        "refId": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
        "name": "Qwen/Qwen-7B"
        // ...
      },
      "components": [
        {
          "type": "file",
          "refId": "qwen-7b-chat-template",
          "name": "ChatML",
          "description": "The ChatML chat template used to format conversational input for the model.",
          "externalReferences": [
            {
              "type": "documentation",
              "url": "https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats"
            }
          ],
          "properties": [
            {
              "name": "cdx:ai-ml:model:template:chat",
              "value": "true"
            }
          ]
        }
        // ...
      ]
    }
  ]
  // ...
}
```

* **properties** - Utilizes the reserved CycloneDX (boolean) property name `cdx:ai-ml:model:template:chat` to annotate the component as the model's chat template.  Similarly, `cdx:ai-ml:model:template:prompt` annotates a component as a prompt template.
* **name** - The widely used `ChatML` template name.  Where the template's actual (e.g., Jinja) content is configured on the tokenizer, it may also be provided using the `cdx:ai-ml:tokenizer:hyperparameter:chat_template` property on the tokenizer component.

## Including manufacturing information for the ML model

This section shows how "manufacturing" (i.e., "training") information is provided relative to the model described by an AI/ML-BOM.

In short, this is accomplished by using objects from the [CycloneDX Manufacturing Bill-of-Materials (or MBOM)](https://cyclonedx.org/capabilities/mbom/) to describe the frameworks, systems, platforms, and libraries used to train the model against a detailed workflow-task description in the BOM's `formulation`.  The model's `modelProperties.training.formula` then references the formula that describes how the model was trained.

> **Note**: The "manufacturing" information may be included within the AI/ML-BOM itself or provided as a separate MBOM and cross-linked to each other using the CycloneDX `BOMLink` (see [BOM-Link](https://cyclonedx.org/capabilities/bomlink/) documentation).

### Declaring hardware and software training components

###### Example: Sample methodology for declaring the "training stack"

First, declare all the "components" used in the training process, so that they can be referenced from the training workflow.  In CycloneDX 2.0, these components are declared in the BOM's `definitions.components` (since they are used to produce the model rather than being part of the model's inventory):

```json
{
  "$schema": "https://cyclonedx.org/schema/2.0/cyclonedx-2.0.schema.json",
  // ...,
  "inventories": [
    {
      "subject": {
        "type": "machine-learning-model",
        "refId": "pkg:huggingface/FakeAI/llama3@abcd",
        "name": "FakeAI/llama3",
        "modelProperties": {
          "training": {
            "formula": "formula-model-training"
          }
          // ...
        }
      },
      "components": [
        // ...
      ]
    }
  ],
  // ...,
  "definitions": {
    "components": [
      {
        "type": "container",
        "name": "h100-training-image",
        "version": "25.03-py3-igpu",
        "refId": "pkg:oci/nvidia-pytorch@sha256:f398a0",
        "identifiers": [
          {
            "party": "party-nvidia",
            "identities": [
              {
                "scheme": "purl",
                "value": "pkg:oci/nvidia-pytorch@sha256:f398a0955ec5fcf9e3bbf77610225ff4e953e137423ab248e2bf32cd4971a1dc?repository_url=nvcr.io/nvidia/pytorch&tag=25.03-py3-igpu"
              }
            ]
          }
        ]
      },
      {
        "type": "library",
        "name": "nvidia-cuda-runtime",
        "version": "12.2.0",
        "refId": "pkg:generic/nvidia-cuda-runtime@12.2.0"
      },
      {
        "type": "library",
        "name": "pytorch",
        "version": "2.10.0",
        "refId": "pkg:pypi/pytorch@2.10.0"
      },
      {
        "type": "library",
        "name": "cuda-toolkit",
        "version": "13.1.1",
        "refId": "pkg:pypi/cuda-toolkit@13.1.1"
      },
      {
        "type": "library",
        "name": "nccl",
        "version": "2.29.2",
        "refId": "pkg:generic/nccl@2.29.2"
      },
      {
        "type": "device",
        "name": "NVIDIA H100 Tensor Core GPU",
        "description": "NVIDIA H100 Tensor Core GPU PCIe Device",
        "refId": "nvidia-h100-pcie-gpu-1"
      }
      // ...
    ],
    "parties": [
      {
        "refId": "party-nvidia",
        "roles": [ { "role": "publisher" } ],
        "organization": { "name": "NVIDIA" }
      }
    ]
  }
  // ...
}
```

###### Field discussion

* **definitions.components** - The components listed to "train" the model shown above would also include "data" type components as described in the previous section "[Declaring datasets](0x22-Design-Model-Card-Parameters.md#declaring-datasets)".  For brevity, only the container image shows its `identifiers`; each of the other components would similarly assert its `purl` identity.
* **modelProperties.training.formula** - References the `refId` of the formula (declared in `formulation`) which describes how the model was trained.

> **CycloneDX 1.7 → 2.0**: In 1.7, `formulation` was an array of formulas, each of which could contain its own `components` array.  In 2.0, a formula contains only `workflows` (and `properties`); the components used by those workflows are declared elsewhere (e.g., `definitions.components`) and referenced via `resourceReferences`.

### Providing training workflow details

After the hardware and software "stack" of training components has been declared, a CycloneDX `workflow` object, with the details of the training tasks as `task` objects (inclusive of all relevant inputs, outputs, steps, etc.), can then be declared within a formula in the BOM's `formulation` array:

###### Example: Declaring a training workflow & tasks

```json
{
  "formulation": [
    {
      "refId": "formula-model-training",
      "workflows": [
        {
          "refId": "workflow-model-training",
          "uid": "workflow-model-training",
          "name": "Model training workflow",
          "description": "Describes the tasks used for training the model described by the AI/ML-BOM.",
          "taskTypes": [ "build" ],
          "resourceReferences": [
            { "ref": "pkg:oci/nvidia-pytorch@sha256:f398a0" },
            { "ref": "nvidia-h100-pcie-gpu-1" }
          ],
          "tasks": [
            {
              "refId": "task-train-in-container",
              "uid": "task-train-in-container",
              "name": "Train model in NVIDIA OCI container",
              "description": "Describes the steps used to train the model using commands and libraries in the container image.",
              "taskTypes": [ "build" ],
              "steps": [ ... ],
              "inputs": [ ... ],
              "outputs": [ ... ]
              // ...
            }
          ]
        }
      ]
    }
  ]
}
```

###### Field discussion

* **refId** / **uid** / **taskTypes** - Each workflow and task requires a `refId`, a `uid`, and at least one task type.  CycloneDX does not (yet) define a "train" task type, so `build` is used to describe the production of the model.
* **resourceReferences** - References the components (by `refId`) used by the workflow.

<!-- TODO(2.0): confirm whether a dedicated ML task type (e.g., "train", "fine-tune", "evaluate") is planned for formulation taskTypes -->

### Declaring the runtime topology

Lastly, you would describe the component "stack" as a graph of `runtimeTopology` dependencies for the workflow above. In this case, the training was done using an OCI (Open Container Initiative) standard container image, which "provides" a declared set of component libraries (pre-installed on the image):

###### Example: Declaring the runtime topology used for the training workflow tasks

```json
{
  "formulation": [
    {
      "refId": "formula-model-training",
      "workflows": [
        {
          "refId": "workflow-model-training",
          "uid": "workflow-model-training",
          "taskTypes": [ "build" ],
          "tasks": [ ... ],
          // ...,
          "runtimeTopology": [
            {
              "ref": "pkg:oci/nvidia-pytorch@sha256:f398a0",
              "dependsOn": [ "nvidia-h100-pcie-gpu-1" ],
              "provides": [
                "pkg:pypi/cuda-toolkit@13.1.1",
                "pkg:generic/nvidia-cuda-runtime@12.2.0",
                "pkg:pypi/pytorch@2.10.0",
                "pkg:generic/nccl@2.29.2"
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

###### Field discussion

* **dependsOn** / **provides** - Both are arrays of references (`refId` values) to the components declared in the previous example.
* **workflows** - In this example, a "training" workflow was shown; however, additional workflows could detail other processes such as "testing" (i.e., model "evaluation"), fine-tuning, and more.
</br>If there are multiple workflows within the `formulation` object, the subset of components specific to a workflow can optionally be declared using the `resourceReferences` object within the respective `workflow` object.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
