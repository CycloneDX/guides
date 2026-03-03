# Model cards

A model card describes the intended uses of a machine learning model and potential limitations, including biases and ethical considerations. Model cards typically include the training parameters, the datasets used to train the model, performance metrics, and other relevant data useful for ML transparency. This object *SHOULD* be specified for any component of type machine-learning-model and must not be specified for other component types.

Throughout the model card sections of this guide, we will show how to use the existing schema to encode information from model cards in a more current and robust way.

## Overview

This section describes the design and best practices when providing information for a CycloneDX `modelCard` in an ML-BOM as part of the model's CycloneDX `component` definition.

For convenience, here are links to the specific sections for each of those informational areas:

* [Model parameters](0x22-Design-Model-Card-Parameters.md#model-parameters)
  * [Model metadata](0x22-Design-Model-Card-Parameters.md#model-metadata)
    * [Approach](0x22-Design-Model-Card-Parameters.md#approach)
    * [Task](0x22-Design-Model-Card-Parameters.md#task)
    * [Architecture family](0x22-Design-Model-Card-Parameters.md#architecture-family)
    * [Model architecture](0x22-Design-Model-Card-Parameters.md#model-architecture)
  * [Datasets](0x22-Design-Model-Card-Parameters.md#datasets)
  * [Inputs & Outputs](0x22-Design-Model-Card-Parameters.md#inputs--outputs)
  * [Declaring other properties](0x22-Design-Model-Card-Parameters.md#declaring-other-properties)
    * [Configuration parameters & hyperparameters](0x22-Design-Model-Card-Parameters.md#configuration-parameters--hyperparameters)

* [Quantitative analysis](0x23-Design-Model-Card-Quantitative-Analysis.md#quantitative-analysis)
  * [Benchmarks](0x23-Design-Model-Card-Quantitative-Analysis.md#benchmarks)
  * [Metrics](0x23-Design-Model-Card-Quantitative-Analysis.md#metrics)
    * [Performance metrics](0x23-Design-Model-Card-Quantitative-Analysis.md#performance-metrics)
  * [Graphics](0x23-Design-Model-Card-Quantitative-Analysis.md#graphics)

* [Considerations](0x24-Design-Model-Card-Considerations.md#considerations)
  * [Users & use cases](0x24-Design-Model-Card-Considerations.md#users--use-cases)
  * [Technical limitations](0x24-Design-Model-Card-Considerations.md#technical-limitations)
  * [Performance tradeoffs](0x24-Design-Model-Card-Considerations.md#performance-tradeoffs)
  * [Fairness assessments](0x24-Design-Model-Card-Considerations.md#fairness-assessments)
  * [Ethical considerations](0x24-Design-Model-Card-Considerations.md#ethical-considerations)
  * [Environmental impact consideration](0x24-Design-Model-Card-Considerations.md#environmental-considerations)
    * [Energy consumptions](0x24-Design-Model-Card-Considerations.md#energy-consumptions)

* [Additional model-related information](0x40-Design-Additional-Model-Information.md#additional-model-related-information)
  * [Using CycloneDX AI/ML properties](0x40-Design-Additional-Model-Information.md#using-cyclonedx-aiml-properties)
  * [Tokenizers and prompt templates](0x40-Design-Additional-Model-Information.md#tokenizers-and-prompt-templates)
  * [Including manufacturing information for the ML model](0x40-Design-Additional-Model-Information.md#including-manufacturing-information-for-the-ml-model)

### Design notes

Please note that at the time of initial development, the CycloneDX model card schema was heavily influenced by [Tensorflow ModelCard Toolkit](https://github.com/tensorflow/model-card-toolkit) and specifically its [ModelCard fields](https://www.tensorflow.org/responsible_ai/model_card_toolkit/api_docs/python/model_card_toolkit/ModelCard) since it was one of the few frameworks available for reference.

Since that time, the AI/ML landscape has progressed rapidly, both in the design of model architectures and in the increased emphasis on providing model disclosure to comply with governmental regulations.  *In order to account for these changes, the CycloneDX community plans to provide significant improvements and normative guidance in future versions of the specification.*

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
