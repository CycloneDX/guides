# ML-BOM Design and Best Practices

## Model card

This section describes the design and best practices when providing information for a CycloneDX `modelCard` in an ML-BOM as part of the model's CycloneDX `component` definition.

For convenience, here are links to the specific sections for each of those informational areas:

- [Model metadata](#model-metadata)
- [Model architecture]()
- [Datasets]()
- [Tokenizers and prompt templates]()
- [Hardware, software & frameworks]()
- [Training & testing details]()
- [Intended use & ethics]()
- [Environmental impacts]()

###### Example: CycloneDX Model Card for the Qwen-7B model

Again, we  continue to showcase the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model from Hugging Face.  You may follow the link to its home page in Hugging Face which should show you its [README.md]() file which contains some structured, but mostly unstructured model card information to see how it is translated to CycloneDX objects and schema.

```json
"modelCard": {
  "modelParameters": {
    "approach": {
    "type": "supervised"
    },
    "task": "task goes here",
    "architectureFamily": "the architecture family goes here",
    "modelArchitecture": "The architecture of the model.",
    "datasets": [
    {
        "type": "dataset",
        "name": "Training Data",
        "contents": {
        "url": "https://example.com/path/to/dataset"
        },
        "classification": "public"
    }
    ],
    "inputs": [
    {
        "format": "string"
    }
    ],
    "outputs": [
    {
        "format": "byte[]"
    }
    ]
},
"quantitativeAnalysis": {
    "performanceMetrics": [
    {
        "type": "The type of performance metric",
        "value": "The value of the performance metric",
        "slice": "The name of the slice this metric was computed on. By default, assume this metric is not sliced",
        "confidenceInterval": {
        "lowerBound": "The lower bound of the confidence interval",
        "upperBound": "The upper bound of the confidence interval"
        }
    }
    ]
},
"considerations": {
    "users": [
    "Who are the intended users of the model?"
    ],
    "useCases": [
    "Who are the intended users of the model?"
    ],
    "technicalLimitations": [
    "What are the known technical limitations of the model? E.g. What kind(s) of data should the model be expected not to perform well on? What are the factors that might degrade model performance?"
    ],
    "performanceTradeoffs": [
    "What are the known tradeoffs in accuracy/performance of the model?"
    ],
    "ethicalConsiderations": [
    {
        "name": "The name of the risk",
        "mitigationStrategy": "Strategy used to address this risk"
    }
    ],
    "fairnessAssessments": [
    {
        "groupAtRisk": "The groups or individuals at risk of being systematically disadvantaged by the model",
        "benefits": "Expected benefits to the identified groups",
        "harms": "Expected harms to the identified groups",
        "mitigationStrategy": "With respect to the benefits and harms outlined, please describe any mitigation strategy implemented."
    }
    ]
  }
}
```


### Model metadata


---

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

### Model metadata

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
