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
* [Fairness assessments](#fairness-assessments)
* [Environmental considerations](#environmental-considerations)

---

### Users

Used to provide list describing the intended users of the model.

```json

```

---

### Use cases

---

### Technical limitations

---

### Performance Tradeoffs

---

### Ethical considerations

#### Name


#### Mitigation strategy


---

### Fairness assessments

---

### Environmental considerations

#### Energy consumptions

> [!Note] Although trained models are often published publicly for consumption most of the providers do not currently disclose the costs of training their models.  This section describes how providers could do so at different stages of the model's lifecycle in order to address potential governmental regulations and requirements.  This information may include disclosure CO2 emission costs and CO2 offsets (credits).

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
      "bom-ref": "pkg:huggingface/Fake-llama/Llama3-7B@abcd123",
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

---

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
