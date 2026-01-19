# ML-BOM Design and Best Practices

## Model card

A model card describes the intended uses of a machine learning model and potential limitations, including biases and ethical considerations. Model cards typically contain the training parameters, which datasets were used to train the model, performance metrics, and other relevant data useful for ML transparency. This object **SHOULD** be specified for any component of type machine-learning-model and must not be specified for other component types.

Throughout the model card sections of this guide, we will show how to use the existing schema to encode information seen in model cards from a more current and robust perspective.

### Overview

This section describes the design and best practices when providing information for a CycloneDX `modelCard` in an ML-BOM as part of the model's CycloneDX `component` definition.

For convenience, here are links to the specific sections for each of those informational areas:

>[!TODO] add hyperlinks when done with all subsections

- [Model parameters](0x22-Design-Model-Card-Parameters.md#model-parameters)
    - [Model architecture]()
    - [Approach & tasks]()
    - [Datasets]()
    - [Inputs & Outputs]()
        - [Tokenizers and prompt templates]()

- [Quantitative analysis]()
    - [Performance metrics & graphics]()

- [Considerations]()
    - [Users & use cases]()
    - [Technical limitations]()
    - [Performance tradeoffs]()
    - [Fairness assessments]()
    - [Intended use & ethics]()
    - [Environmental impacts]()

- [Other]()
    - [Hardware, software & frameworks]()
    - [Training & testing details]()

#### Design notes

Please note that at the time of initial development, the CycloneDX model card schema was heavily influenced by [Tensorflow ModelCard Toolkit](https://github.com/tensorflow/model-card-toolkit) and specifically its [ModelCard fields](https://www.tensorflow.org/responsible_ai/model_card_toolkit/api_docs/python/model_card_toolkit/ModelCard) since it was one of few frameworks available for reference.

Since that time, the AI/ML landscape has progressed at a rapid pace with both in terms of the design of model architectures and increased emphasis on providing model disclosure to conform with governmental regulations.  *In order to account for these changes, the CycloneDX community plans to provide significant improvements and normative guidance in future versions of the specification.*

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
