# ML-BOM Design and Best Practices

## Quantitative analysis

![](images/ml-anatomy-model-card-quant-analysis.svg)

This section will feature guidance on filling out information in the Cyclone model card's `quantitativeAnalysis` object and its subcomponents including:

* [Performance metrics](#performance-metrics)
* [Graphics](#graphics)

---

### What is quantitative analysis

Quantitative analysis is the process of using metrics on benchmarks to determine if a model is reliable, safe, or better than another. It involves comparing the metric results against the benchmark standard to assess performance, identify limitations, and track progress over time.

<!-- A quantitative analysis of an AI model involves using mathematical and statistical methods to objectively measure and evaluate its performance, behavior, and outputs using numerical data, focusing on how much or how often, unlike qualitative analysis which looks at why. It assesses metrics like accuracy, precision, recall, efficiency, and consistency, transforming raw data into verifiable insights to understand patterns, test hypotheses, and ensure reliability for decision-making, moving beyond subjective human interpretation. -->

#### The value of quantitative analysis

* **Numerical Metrics**: Provides measurable data (e.g., error rates, latency, performance scores) rather than subjective feedback.
* **Objective Evaluation**: Provides reproducible, scalable results that can be compared across different models or versions.
* **Pattern & Trend Detection**: Identifies numerical patterns, correlations, and trends within large or complex datasets that might be missed manually.
* **Testing Hypotheses**: Enables the statistical testing of assumptions about model behavior allowing for comparisons against similar models for given tasks.

#### Benchmarks

Benchmarks are standardized test datasets, scenarios, or tasks  that define the "playing field". They provide a consistent environment for evaluating different models and enable the comparison of their metrics across similar models.

##### Types of machine learning benchmarks

Benchmarks use standardized datasets to objectively compare model quality, efficiency, fairness, and speed, providing a shared baseline for identifying areas for improvement in various categories.

* **[Large Language Models (LLM)](0x90-Appendix-A_Glossary.md#large-language-model-llm)** and **[Natural Language Processing (NLP)](0x90-Appendix-A_Glossary.md#natural-language-processing-nlp)** (e.g., speech recognition or text classification) - These benchmarks evaluate reasoning, knowledge, and generation capabilities.
</br>A few examples of datasets used to benchmark these models include:

  * [HellaSwag](https://huggingface.co/datasets/Rowan/hellaswag) / [WinoGrande](https://huggingface.co/datasets/allenai/winogrande): Common sense reasoning and pronoun resolution tasks.
  * [MMLU](https://huggingface.co/datasets/cais/mmlu), [MMLU-Pro](https://huggingface.co/datasets/TIGER-Lab/MMLU-Pro) (Massive Multitask Language Understanding): Tests knowledge across STEM, humanities, and social sciences.
  * [GLUE](https://gluebenchmark.com/): benchmarking resources for training, evaluating, and analyzing natural language understanding systems

  as well as some examples that target  specific informational areas:
  * [GSM8K](https://huggingface.co/datasets/openai/gsm8k) (OpenAI), [MATH-500](https://huggingface.co/datasets/HuggingFaceH4/MATH-500) (Hugging Face): Benchmarks specifically designed to evaluate mathematical reasoning.
  * [HumanEval](https://huggingface.co/datasets/openai/openai_humaneval) (OpenAI), [MBPP](https://huggingface.co/datasets/Muennighoff/mbpp) (Mostly Basic Python Problems ): Benchmarks for evaluating code generation and programming capabilities.
   [IMDB](https://www.kaggle.com/datasets/lakshmi25npathi/imdb-dataset-of-50k-movie-reviews): a large dataset of 50K, highly polarized, movie reviews for NLP sentiment analysis and classification.
</br>
* **[Computer Vision](0x90-Appendix-A_Glossary.md#computer-vision)** (e.g., digital image or video recognition)
These benchmarks measure the performance, accuracy, and efficiency of models in tasks like image classification, object detection, segmentation, and tracking.</br></br>Some example datasets:

  * [ImageNet](image-net.org): large-scale dataset for computer vision, featuring over 14 million annotated, high-resolution images across thousands of object categories organized by the [WordNet](https://en.wikipedia.org/wiki/WordNet) hierarchy.
  * [MathVista](https://huggingface.co/datasets/AI4Math/MathVista): Used to evaluating math reasoning in Visual Contexts.  It consists of three datasets, *IQTest*, *FunctionQA*, and *PaperQA*, which are tailored to evaluate visual reasoning on puzzle test figures, algebraic reasoning over functional plots, and scientific reasoning with academic paper figures, respectively.
  * [MNIST](https://www.tensorflow.org/datasets/catalog/mnist) (Modified National Institute of Standards and Technology database) (link to the Tensorflow/Keras catalog): a large database of handwritten digits (glyphs) that is commonly used for training various image processing systems.


#### Metrics

> [!Note] Currently, CycloneDx supports declaring metrics in the area of *performance benchmarks* which is the most consistently seen set of named metrics described within model cards today.

##### Common Performance Metrics

* **Classification:
  * **Accuracy: Overall correctness.
  * **Precision: Of predicted positives, how many are correct.
  * **Recall (Sensitivity): Of actual positives, how many are found.
  * **F1 Score: Harmonic mean of Precision and Recall.
  * **ROC AUC: Area under the Receiver Operating Characteristic curve.

* Large Language Models (LLMs):

  * **MMLU: Measures knowledge across many subjects.
  * **HellaSwag: Tests commonsense reasoning.
  * **TruthfulQA: Assesses truthfulness in responses.

*•* Efficiency:

  * **Latency/Throughput: Speed of prediction (inference).
  * **Resource Utilization: Memory, CPU/GPU usage. [2, 3, 4, 5]

---

Examples of Benchmarks & Datasets

* **Computer Vision: ImageNet, CIFAR.
* **NLP: GLUE, SuperGLUE, SQuAD, MMLU.
* **Repositories: Kaggle, UCI Machine Learning Repository, OpenML, {Milvus](https://milvus.io/ai-quick-reference/what-are-benchmark-datasets-in-machine-learning-and-where-can-i-find-them) https://milvus.io/ai-quick-reference/what-are-benchmark-datasets-in-machine-learning-and-where-can-i-find-them), TensorFlow Datasets, TorchVision. [1, 4, 6, 11]

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

---

### Performance metrics

These are specific, quantitative measures used to evaluate a model's behavior, such as accuracy, precision, recall, perplexity, or inference speed. They provide the raw, numerical data for analysis.

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
