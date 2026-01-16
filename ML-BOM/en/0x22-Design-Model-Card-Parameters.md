# ML-BOM Design and Best Practices

### Model parameters

>![Note] add diagram of model parameters

In general, model parameters describe values that are directly used to configure model processing applications and frameworks and their implementations of model architectures.  For example, most models that appear in Hugging Face typically include configuration files for both the models and the tokenizers they are designed for use with the [Hugging Face Transformers](https://huggingface.co/docs/transformers/) library and its underlying use of the PyTorch framework.

###### Example: CycloneDX for the Qwen-7B model repository

The following example shows how the [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) model's parameters would be declared as a CycloneDX `modelCard`.

As shown in the [Qwen/Qwen-7B model repository files](0x20-Design-Model-Component-Metadata.md#example-qwenqwen-7b-model-repository-files) example in the previous section, we see the model includes several configuration files including:

- [config.json](https://huggingface.co/Qwen/Qwen-7B/blob/main/config.json) - which contains configuration parameters (as key-value pairs) used for initializing the model's implementation.
- [generation_config.json](https://huggingface.co/Qwen/Qwen-7B/blob/main/generation_config.json) - which contains model hyperparameters (as key-value pairs) and their suggested (default) values used for configuring the model for token generation (inference).


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
      ...,
      "modelCard": {
        "modelParameters": {
          "task": "text-generation",
          "architectureFamily": "transformer",
          "modelArchitecture": "QWenLMHeadModel",
          "approach": {
            "type": "generative",
            "motivations": ["text-generation", "conversational-ai"]
          },
          "parameters": [
            {
              "name": "total_parameters",
              "value": "7 billion",
              "description": "Total number of parameters in the model."
            },
            {
              "name": "context_length",
              "value": "8192",
              "description": "The maximum sequence length the model supports during pre-training and inference."
            },
            {
              "name": "vocab_size",
              "value": "151936",
              "description": "The size of the model's vocabulary."
            },
            {
              "name": "quantization_support",
              "value": "4-bit, 8-bit",
              "description": "Supported quantization levels for reduced memory usage, as seen in community variations like TheBloke/Qwen-7B-Chat-GPTQ."
            }
          ],
          "inputs": [
            {"format": "string"}
          ],
          "outputs": [
            {"format": "string"}
          ],
        },
        "quantitativeAnalysis": {
          "performanceMetrics": [
            {
              "type": "benchmark_score",
              "value": "specific benchmark score here",
              "slice": "Specific benchmark name (e.g., MMLU, GSM8K)"
            }
          ]
        },
        ...
      }
    }
  }
}
```

###### Discussion of model card fields

- **parameters** -

>![TODO] determine if we MUST also add "dependencies" to the composition to est. the relationship to the actual model repository. e.g., "dependencies": ["model-bom-ref"]


#### Model architecture

---

### Quantitative Analysis


---


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
