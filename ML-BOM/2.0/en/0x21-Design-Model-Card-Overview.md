# Model cards

A model card describes the intended uses of a machine learning model and potential limitations, including biases and ethical considerations. Model cards typically include the training parameters, the datasets used to train the model, performance metrics, and other relevant data useful for ML transparency.

Throughout the model card sections of this guide, we will show how to use the CycloneDX 2.0 schema to encode information from model cards in a more current and robust way.

## Overview

In CycloneDX 2.0, model card information is no longer held in a single, fixed `modelCard` object.  Instead, it is provided as structured, machine-readable, and referenceable data across the AI/ML-BOM:

| Model card information | CycloneDX 2.0 location |
|---|---|
| Model details, identity, and licensing | The model `component` (`name`, `version`, `description`, `identifiers`, `licenses`, `externalReferences`) |
| Developers, suppliers, and intended users | The model component's `parties` (and shared `definitions.parties`) |
| Learning types, tasks, architecture, parameters, inputs & outputs, training data, and limitations | The model component's `modelProperties` |
| Quantitative analysis (performance metrics) and environmental impact (energy consumption) | The model component's `measurements` |
| Intended use cases | `definitions.useCases`, asserted by the model component's `useCaseAssertions` |
| Ethical considerations and fairness assessments | The BOM's top-level `risks` |
| The "model card" view itself | A model card `perspective` (see [Model card perspectives](#model-card-perspectives)) |

`modelProperties` *SHOULD* be specified for any component of type `machine-learning-model` and must not be specified for other component types.

This section describes the design and best practices when providing this information for a model in an AI/ML-BOM as part of the model's CycloneDX `component` definition and its related objects.

For convenience, here are links to the specific sections for each of those informational areas:

* [Model properties](0x22-Design-Model-Card-Parameters.md#model-properties)
  * [Model metadata](0x22-Design-Model-Card-Parameters.md#model-metadata)
    * [Learning types](0x22-Design-Model-Card-Parameters.md#learning-types)
    * [Tasks](0x22-Design-Model-Card-Parameters.md#tasks)
    * [Architecture](0x22-Design-Model-Card-Parameters.md#architecture)
    * [Parameter count & quantization](0x22-Design-Model-Card-Parameters.md#parameter-count--quantization)
  * [Datasets](0x22-Design-Model-Card-Parameters.md#datasets)
  * [Inputs & Outputs](0x22-Design-Model-Card-Parameters.md#inputs--outputs)
  * [Declaring other properties](0x22-Design-Model-Card-Parameters.md#declaring-other-properties)
    * [Configuration parameters & hyperparameters](0x22-Design-Model-Card-Parameters.md#configuration-parameters--hyperparameters)

* [Quantitative analysis](0x23-Design-Model-Card-Quantitative-Analysis.md#model-quantitative-analysis)
  * [Benchmarks](0x23-Design-Model-Card-Quantitative-Analysis.md#benchmarks)
  * [Metrics](0x23-Design-Model-Card-Quantitative-Analysis.md#metrics)
    * [Performance metrics](0x23-Design-Model-Card-Quantitative-Analysis.md#performance-metrics)
  * [Graphics](0x23-Design-Model-Card-Quantitative-Analysis.md#graphics)

* [Considerations](0x24-Design-Model-Card-Considerations.md#model-design-considerations)
  * [Users & use cases](0x24-Design-Model-Card-Considerations.md#users--use-cases)
  * [Technical limitations](0x24-Design-Model-Card-Considerations.md#technical-limitations)
  * [Performance tradeoffs](0x24-Design-Model-Card-Considerations.md#performance-tradeoffs)
  * [Ethical considerations](0x24-Design-Model-Card-Considerations.md#ethical-considerations)
  * [Fairness assessments](0x24-Design-Model-Card-Considerations.md#fairness-assessments)
  * [Environmental impact consideration](0x24-Design-Model-Card-Considerations.md#environmental-considerations)
    * [Energy consumptions](0x24-Design-Model-Card-Considerations.md#energy-consumptions)

* [Additional model-related information](0x40-Design-Additional-Model-Information.md#additional-model-related-information)
  * [Using CycloneDX AI/ML properties](0x40-Design-Additional-Model-Information.md#using-cyclonedx-aiml-properties)
  * [Tokenizers and prompt templates](0x40-Design-Additional-Model-Information.md#tokenizers-and-prompt-templates)
  * [Including manufacturing information for the ML model](0x40-Design-Additional-Model-Information.md#including-manufacturing-information-for-the-ml-model)

## Model card perspectives

Because model card information is spread across the AI/ML-BOM, CycloneDX 2.0 introduces *perspectives*: a perspective is a "lens" that maps AI/ML-BOM data into the terms of a particular audience.  A model card perspective maps each model card section (its `nativeName`, such as "Intended Use" or "Ethical Considerations") to the AI/ML-BOM data that supplies it using an [RFC 9535](https://www.rfc-editor.org/rfc/rfc9535) JSONPath `expression`, along with the section's `relevance` (`required`, `recommended`, or `optional`) and an optional `weight` that can drive completeness scoring.

This means the same AI/ML-BOM can be presented as different model cards (e.g., a canonical model card informed by EU AI Act requirements, a model hub's model card, or a corporate model card) without duplicating data, and new model card formats can be supported without changing the schema.

###### Example: A model card perspective (abridged)

```json
{
  "perspectives": [
    {
      "refId": "perspective-model-card",
      "name": "Model Card",
      "domains": [ "machine-learning", "transparency" ],
      "mappings": [
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.modelProperties.tasks",
          "nativeName": "Supported Tasks",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.modelProperties.limitations",
          "nativeName": "Technical Limitations",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.risks.risks[?(@.domains[?(@.type=='ethical')])]",
          "nativeName": "Ethical Considerations",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.measurements[?(@.activity)]",
          "nativeName": "Environmental Impact",
          "relevance": "recommended"
        }
        // ...
      ]
    }
  ]
}
```

> **Note**: Perspectives are under active development in CycloneDX 2.0.  A canonical model card perspective, informed by EU AI Act requirements, is planned for a future revision of this guide.

<!-- TODO(2.0): add the canonical (EU AI Act informed) model card perspective once finalized -->

### Design notes

Please note that at the time of initial development (CycloneDX v1.5), the CycloneDX model card schema was heavily influenced by [Tensorflow ModelCard Toolkit](https://github.com/tensorflow/model-card-toolkit) and specifically its [ModelCard fields](https://www.tensorflow.org/responsible_ai/model_card_toolkit/api_docs/python/model_card_toolkit/ModelCard) since it was one of the few frameworks available for reference.

Since that time, the AI/ML landscape has progressed rapidly, both in the design of model architectures and in the increased emphasis on providing model disclosure to comply with governmental regulations.  In order to account for these changes, CycloneDX 2.0 replaces the 1.x `modelCard` object with the structured `modelProperties`, `measurements`, `parties`, use cases, risks, and perspectives described in this guide.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
