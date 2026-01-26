# ML-BOM Design and Best Practices

## Considerations

![](images/ml-anatomy-model-card-considerations.svg)

This section will feature guidance on filling out information in the Cyclone model card's `considerations` object and its subcomponents including:

This section will feature guidance on filling out information in the Cyclone model card's `modelParameters` object and its subcomponents including:

* [Users](#users) - Who are the intended users of the model?
* [Use cases](#use-cases) - What are the intended use cases of the model?
* [Technical limitations](#technical-limitations) - What are the known technical limitations of the model? For example, "What kind(s) of data should the model be expected not to perform well on?", "What are the factors that might degrade model performance?".
* [Performance tradeoffs](#performance-tradeoffs) - What are the known tradeoffs in accuracy/performance of the model?
* [Ethical considerations]() - What are the ethical risks involved in the application of this model?
* [Fairness assessments](#fairness-assessments) - How does the model affect groups at risk of being systematically disadvantaged? What are the harms and benefits to the various affected groups?
* [Environmental considerations](#environmental-considerations) - What are the various environmental impacts the corresponding machine learning model has exhibited across its lifecycle?

---

### Users & use cases

Used to provide list describing the intended users of the model along with a list of envisioned use cases for the model.


###### Example: Qwen3/Qwen-7B

This example shows a list for what kind of user and use case information would be expected for a typical `7B` parameter size Large Language Model (LLM) that is multi-lingual and supports code/instruct capabilities.

```json
"component": {
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
  ...,
  "modelCard": {
    ...,
    "considerations": {
      "users": [
        "Software developer",
        "Multilingual Content Creator",
        "Customer Support Systems Architect",
        "Academic Researcher / Student",
        "Edge Device Engineer",
        "Enterprise Security Analyst",
        "Local AI Enthusiast / Privacy-First User"
      ],
      "useCases": [
        "Utilizing the Qwen3-Coder variant within an IDE for real-time code completion, bug fixing, and unit test generation, benefiting from its \"Agentic\" capabilities for repository-scale understanding.",
        "Translating business, education or other content or informational materials to other languages and dialects while maintaining the original tone and cultural nuances.",
        "Deploying low-latency chatbots for high-volume inquiries where the 7B model acts as a \"triage\" agent, answering common questions and only escalating complex logic to other support mechanisms.",
        "Summarizing long-form research papers and generating initial drafts for school projects, utilizing the model's 128K context window to ingest entire PDFs at once.",
        "Implementing the model on specialized hardware for real-time visual perception and \"Thinking Mode\" reasoning to help an intelligent device navigate and interact with its environment based on natural language commands",
        "Running a self-hosted instance to analyze internal security logs for anomalies, ensuring that sensitive infrastructure data never leaves the organization's firewall.",                                  "Running a personal assistant locally on a laptop to answer questions or process private information such as emails or calendars without sending data to an external server."
      ],
    }
  }
}
```

###### Field notes

* There is no expectation that there is a 1:1 correlation between `users` and `useCases` entries.  However, there should be at least one listed use cases that can correspond to a named "user" (role).

---

### Technical limitations

This example shows a list for what kind of technical limitations might be associated with a typical Large Language Model (LLM) that is multi-lingual and supports code/instruct capabilities with similar (i.e., ~`8B`) parameter size.

```json
"component": {
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
  ...,
  "modelCard": {
    ...,
    "considerations": {
      "technicalLimitations": [
        "Greedy Decoding Degradation. The model is optimized for sampling-based generation. Using greedy decoding (temperature=0) can lead to performance degradation, repetitive loops, and "stuck" reasoning steps, particularly in the new Thinking Mode",
        "Native Context Window Boundaries. While the model supports up to 131,072 tokens using YaRN scaling, its native pre-training context is limited to 32,768 tokens. Performance may degrade on very long sequences if proper scaling factors (like RoPE or YaRN) are not manually configured for local deployments.",
        "Synthetic Data \"Sanding\" Effects. Research indicates that Qwen3, like many models trained on massive synthetic datasets, can suffer from \"model collapse\" where rare edge cases or minority user behaviors are underrepresented, potentially leading to errors in complex, real-world production environments.",
        "Thinking Mode History Overhead. In multi-turn conversations, including the model's internal \"thinking\" steps in the chat history can confuse the model and consume unnecessary tokens. Best practices require developers to filter out \"thinking\" content from the history to maintain coherence."
      ]
    }
  }
}
```

---

### Performance Tradeoffs

```json
"component": {
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
  ...,
  "modelCard": {
    ...,
    "considerations": {
      "performanceTradeoffs": [
        "",
        "",
        "",
        "",
        "",
        "",
        ""
      ]
    }
  }
}
```

---

### Ethical considerations

#### Name


#### Mitigation strategy

```json
"component": {
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
  ...,
  "modelCard": {
    ...,
    "considerations": {
      "ethicalConsiderations": [
        {
          "name": "",
          "mitigationStrategy": ""
        },
        {
          "name": "",
          "mitigationStrategy": ""
        },
        ...
      ]
    }
  }
}
```

---

### Fairness assessments

```json
"component": {
  "type": "machine-learning-model",
  "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
  ...,
  "modelCard": {
    ...,
    "considerations": {
      "fairnessAssessments": [
        {
          "groupAtRisk": "",
          "benefits": "",
          "harms": "",
          "mitigationStrategy": ""
        },
        {
          "groupAtRisk": "",
          "benefits": "",
          "harms": "",
          "mitigationStrategy": ""
        },
        ...
      ]
    }
  }
}
```

---

### Environmental considerations

#### Energy consumptions

This section describes how model providers can publish the energy costs incurred during different stages of the model's lifecycle in order to address potential governmental regulations and requirements.  This information includes the energy sources (i.e., for the datacenters) as well as disclosure of CO2 emission cost equivalents and CO2 offsets (credits).

The intent is for CycloneDX to be able to support the general requirements referenced by the [EU’s AI Act](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng) which refers to ‘environmental protection’ in its subject matter.

Summary of EU AI Act Environmental Disclosure Rules for GPAI Models:

* **Requirement**: Providers of General-Purpose AI (GPAI) models must disclose the known or estimated energy consumption used during their model's development.
  * *This information is provided only upon request to the EU's AI Office and national competent authorities.*
* **Reference**: These requirements are outlined in [Article 53](https://artificialintelligenceact.eu/article/53/) and [Annex XI](https://artificialintelligenceact.eu/annex/11/) of the [EU AI Act](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng).
* **Exemption**: Models released under a free and open-source license are exempt from this disclosure obligation.

> [!Note] Since most trained models are published under some form of open license, most providers do not currently disclose the costs of training their models.

##### Activity

The type of activity that is part of a machine learning model development or operational lifecycle that has an associated energy consumption.

| Value | Description |
|---|---|
| **design** | A model design including problem framing, goal definition and algorithm selection.|
| **data-collection** |Model data acquisition including search, selection and transfer.|
| **data-preparation** | Model data preparation including data cleaning, labeling and conversion. |
| **training** | Model building, training and generalized tuning. |
| **fine-tuning** | Refining a trained model to produce desired outputs for a given problem space. |
| **validation** | Model validation including model output evaluation and testing. |
| **deployment** | Explicit model deployment to a target hosting infrastructure. |
| **inference** | Generating an output response from a hosted model from a set of inputs. |
| **other** | A lifecycle activity type whose description does not match currently defined values. |

##### Energy providers

##### Activity energy cost

##### CO2 cost equivalent

##### CO2 cost offset


###### Example:



```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  "bomFormat": "CycloneDX",
  "specVersion": "1.7",
  "serialNumber": "urn:uuid:ed5c5ba0-2be6-4b58-ac29-01a7fd375123",
  "version": 1,
  "components": [
    {
      "type": "machine-learning-model",
      "bom-ref": "pkg:huggingface/FakeAI/Llama3@abcd123",
      ...,
      "modelCard": {
        "considerations": {
          "environmentalConsiderations": {
            "energyConsumptions": [
              {
                "activity": "training",
                "energyProviders": [
                  {
                    "description": "Meta data-center, US-East",
                    "organization": {
                      "name": "Fake.ai",
                      "address": {
                        "country": "United States",
                        "region": "New Jersey",
                        "locality": "Newark"
                      }
                    },
                    "energySource": "natural-gas",
                    "energyProvided": {
                      "value": 0.4,
                      "unit": "kWh"
                    }
                  }
                ],
                "activityEnergyCost": {
                  "value": 0.4,
                  "unit": "kWh"
                },
                "co2CostEquivalent": {
                  "value": 31.22,
                  "unit": "tCO2eq"
                },
                "co2CostOffset": {
                  "value": 31.22,
                  "unit": "tCO2eq"
                }
              }
            ]
          }
        }
      }
    }
  ]
}
```

###### Field notes

* **unit** - the unit `tCO2eq` is defined by the European Commission and stands for metric tonnes of carbon dioxide equivalent, a standardized unit used to measure the total greenhouse gas emissions (including methane and nitrous oxide) generated during the development, training, and operation of AI systems.

---

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
