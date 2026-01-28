# Appendix 1: Complete ML-BOM example

## Qwen/Qwen-7B ML-BOM

Throughout this guide provided incremental examples were shown of how to fill out various parts of an ML-BOM using the [Qwen3-7B](https://huggingface.co/Qwen/Qwen-7B) model.  This section brings those together to show what a complete ML-BOM would look like for that model.

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  "bomFormat": "CycloneDX",
  "specVersion": "1.7",
  "serialNumber": "urn:uuid:ec45525e-516c-4405-9de3-4fbdaef7f09a",
  "version": 1,
  "components": [
    {
      "bom-ref": "component-a",
      "type": "machine-learning-model",
      "publisher": "Acme Inc",
      "group": "CompVis",
      "name": "stable-diffusion",
      "version": "1.4",
      "description": "Stable Diffusion is a latent text-to-image diffusion model capable of generating photo-realistic images given any text input. For more information about how Stable Diffusion functions, please have a look at \uD83E\uDD17's Stable Diffusion with \uD83E\uDDE8Diffusers blog.",
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
    }
  ]
}

```