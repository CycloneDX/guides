# ML-BOM Design and Best Practices

## Quantitative analysis

![](images/ml-anatomy-model-card-quant-analysis.svg)

This section will feature guidance on filling out information in the Cyclone model card's `quantitativeAnalysis` object and its subcomponents including:

* [Performance metrics](#performance-metrics)
* [Graphics](#graphics)

---

### What is quantitative analysis

A quantitative analysis of an AI model involves using mathematical and statistical methods to objectively measure and evaluate its performance, behavior, and outputs using numerical data, focusing on how much or how often, unlike qualitative analysis which looks at why. It assesses metrics like accuracy, precision, recall, efficiency, and consistency, transforming raw data into verifiable insights to understand patterns, test hypotheses, and ensure reliability for decision-making, moving beyond subjective human interpretation.

#### The value of quantitative analysis

* **Numerical Metrics**: Provides measurable data (e.g., error rates, latency, performance scores) rather than subjective feedback.
* **Objective Evaluation**: Provides reproducible, scalable results that can be compared across different models or versions.
* **Pattern & Trend Detection**: Identifies numerical patterns, correlations, and trends within large or complex datasets that might be missed manually.
* **Testing Hypotheses**: Enables the statistical testing of assumptions about model behavior allowing for comparisons against similar models for given tasks.

---

### Performance metrics

Describes any standardized metrics and evaluations used to measure and compare the effectiveness, efficiency and output correctness of a model providing a crucial, objective way to determine which model is best suited for a particular task or deployment environment.

> [!Note] Currently, CycloneDx supports declaring metrics in the area of *performance benchmarks* which is the most consistently seen set of named metrics described within model cards today.

#### Types of machine learning benchmarks

ML model performance benchmarks use standardized datasets (like ImageNet, GLUE) and metrics (Accuracy, F1 Score, MMLU) to objectively compare model quality, efficiency, fairness, and speed, providing a shared ruler for progress, reproducibility, and identifying areas for improvement in fields like Computer Vision and NLP. [1, 2, 3, 4]
Key Types of Benchmarks

• Task-Specific Benchmarks: Standardized datasets for common tasks (e.g., MNIST for digits, CIFAR-10 for images, IMDb for sentiment).
• System Benchmarks (MLPerf): Evaluate hardware (GPUs, TPUs) and software infrastructure for training and inference speed.
• Model-Specific Benchmarks: Assess different aspects of model quality, from basic metrics to advanced reasoning. [1, 3, 5, 6]

Common Performance Metrics

• Classification:

	• Accuracy: Overall correctness.
	• Precision: Of predicted positives, how many are correct.
	• Recall (Sensitivity): Of actual positives, how many are found.
	• F1 Score: Harmonic mean of Precision and Recall.
	• ROC AUC: Area under the Receiver Operating Characteristic curve.

• Large Language Models (LLMs):

	• MMLU: Measures knowledge across many subjects.
	• HellaSwag: Tests commonsense reasoning.
	• TruthfulQA: Assesses truthfulness in responses.

• Efficiency:

	• Latency/Throughput: Speed of prediction (inference).
	• Resource Utilization: Memory, CPU/GPU usage. [2, 3, 4, 5]

Why Benchmarking Matters

• Fair Comparison: Enables objective comparison between different algorithms and models.
• Drives Progress: Identifies state-of-the-art (SOTA) performance and pushes innovation.
• Reproducibility: Ensures results can be verified and replicated.
• Transparency: Helps communicate AI value to stakeholders. [1, 3, 7, 8, 9, 10]

Examples of Benchmarks & Datasets

• Computer Vision: ImageNet, CIFAR.
• NLP: GLUE, SuperGLUE, SQuAD, MMLU.
• Repositories: Kaggle, UCI Machine Learning Repository, OpenML, {Milvus](https://milvus.io/ai-quick-reference/what-are-benchmark-datasets-in-machine-learning-and-where-can-i-find-them) https://milvus.io/ai-quick-reference/what-are-benchmark-datasets-in-machine-learning-and-where-can-i-find-them), TensorFlow Datasets, TorchVision. [1, 4, 6, 11]

AI responses may include mistakes.

[1] https://labelstud.io/learningcenter/what-are-benchmarks/
[2] https://www.ibm.com/think/topics/model-performance
[3] https://mlcommons.org/benchmarks/
[4] https://www.teqfocus.com/blog/benchmarking-large-language-models-a-comprehensive-guide/
[5] https://coe-379l-sp24.readthedocs.io/en/latest/unit04/ml_benchmarks.html
[6] https://milvus.io/ai-quick-reference/what-are-benchmark-datasets-in-machine-learning-and-where-can-i-find-them
[7] https://www.tutorialspoint.com/what-are-the-machine-learning-benchmarks
[8] https://www.youtube.com/watch?v=_lmT4Nqtm-A
[9] https://help.pecan.ai/en/articles/7338218-understanding-pecan-s-benchmarks
[10] https://www.emergentmind.com/topics/benchmarking-machine-learning-algorithms
[11] https://www.meegle.com/en_us/topics/ai-model-evaluation/ai-model-benchmarking





```json
  "component":
  {
    "type": "machine-learning-model",
    "bom-ref": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
    ...,
    "modelCard": {
      ...
      "quantitativeAnalysis": {
      "performanceMetrics": [
        {
            "type": "benchmark_score",
            "value": "The value of the performance metric",
            // "slice": "The name of the slice this metric was computed on. By default, assume this metric is not sliced",
            "slice": "Specific benchmark name (e.g., MMLU, GSM8K)"
            "confidenceInterval": {
            "lowerBound": "The lower bound of the confidence interval",
            "upperBound": "The upper bound of the confidence interval"
            }
          }
        ]
      }
    }
  }
```
---

#### Graphics

TODO

### Example: Graphis

```json
{
  "$schema": "http://cyclonedx.org/schema/bom-1.7.schema.json",
  ...
  "metadata":
  {
    "component":
    {
      "type": "machine-learning-model",
      ...
      "modelCard": {
        ...
        "quantitativeAnalysis": {
          "graphics": [
            {
              "description": "benchmark_score",
              "collection": [
                {
                  "name": "string",
                  "image": {
                    "contentType": "",
                    "encoding": "base64",
                    "content": "string"
                  }
                }
              ]

            }
          ]
        }
      }
    }
  }
}
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
