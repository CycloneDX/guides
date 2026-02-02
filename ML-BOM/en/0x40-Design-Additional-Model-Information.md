# ML-BOM Design and Best Practices

## Additional model-related information

This section describes the design and best practices when providing other model-related information an ML model's component and model card within a CycloneDX ML-BOM.

Currently, the v1.7 CycloneDX specification does not have specific objects or fields to document these types of information directly.  However, these sections will show how CycloneDX extension mechanisms such as `properties` and `externalReferences` can be used to provide and classify such additional ML-related information.

For convenience, here are links to the specific sections for some of these acknowledged informational areas:

- [Tokenizers and prompt templates](#tokenizers-and-prompt-templates)
- [Hardware, software & frameworks](#hardware-software--frameworks)
- [Training & testing details](#training--testing-details)

### Tokenizers and prompt templates

Tokenizers provide the preprocessing (encoding) and postprocessing (decoding) functions to convert input and output information to tokens that the associated ML model was trained on and used for inference.

##### Tokenizers and templates as components

It is best practice to treat tokenizers and prompt (or chat) templates as annotated components.

###### Example: Declaring and annotating the Qwen-7B model's tokenizer

Using the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model as published to Hugging Face, the tokenizer is published within the model repository and can be represented as components.  This method extends the use of a CycloneDX "assembly" to declare the tokenizer as shown in the previous section "[Describing a model repository as a CycloneDX assembly](0x20-Design-Model-Component-Metadata.md#example-qwenqwen-7b-model-repository-files)".

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
    ...
    "metadata":
    {
      "component":
      {
        "type": "machine-learning-model",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
        ...
        "components": [
          {
              "type": "library",
              "name": "tokenization_qwen.py",
              "description": "Python tokenization classes for QWen (QWenTokenizer)",
              "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@e7a368b#tokenization_qwen.py",
              "purl": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#tokenization_qwen.py",
              ...,
              "properties": [
                {
                  "name": "cdx:ai-ml:model:tokenizer",
                  "value": "QWenTokenizer"
                }
              ]
          },
          ...
        ]
      }
    }
  ...
}
```

###### Field notes

* **properties** - Utilizes the reserved CycloneDX property name `cdx:ai-ml:model:tokenizer`, with a tokenizer class name, to annotate the component as being a "tokenizer".

###### Example: Annotating a model with its chat template

For the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model, the chat template uses the standard [`ChatML`](https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats) format (see [Hugging Face "Common Template Formats"](https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats))   which can be referenced on the model component as follows:

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
    ...
    "metadata":
    {
      "component":
      {
        "type": "machine-learning-model",
        "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
        ...,
        "properties": [
          {
            "name": "cdx:ai-ml:model:template:chat",
            "value": "ChatML"
          }
        ]
      }
    }
  ...
}
```

---

### Including Manufacturing information for the ML model

The following additional information, relative to the model, utilizes the CycloneDX objects for a Manufacturing Bill-of-Materials (or MBOM) to describe the frameworks, systems and platforms used to train or test the model.

**Note**: This "manufacturing" information may be included within the ML-BOM itself or provided as a separate MBOM and cross-linked to each other using the CycloneDX `BOMLink` (see [BOM-Link](https://cyclonedx.org/capabilities/bomlink/) documentation).

#### Hardware, software & frameworks

TODO

#### Training & testing details

TODO

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
