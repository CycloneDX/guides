# Appendix B: References

This appendix includes references to resources, standards, technologies and models used within this guide.

#### CycloneDX references and resources

* [OWASP Foundation](https://owasp.org/)
  * [OWASP Dependency-Track](https://dependencytrack.org/)
  * [OWASP Software Component Verification Standard (SCVS)](https://scvs.owasp.org/)
    * [SCVS BOM Maturity Model](https://scvs.owasp.org/bom-maturity-model/)
* [OWASP CycloneDX](https://cyclonedx.org/)
  * [CycloneDX Authoritative Guide to SBOM](https://cyclonedx.org/guides/OWASP_CycloneDX-Authoritative-Guide-to-SBOM-en.pdf)
  * [CycloneDX Property Taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy)
  * [CycloneDX Tool Center](https://cyclonedx.org/tool-center/)
  * [CycloneDX BOM Repository Server](https://github.com/CycloneDX/cyclonedx-bom-repo-server)
* [Package-URL (PURL) Specification](https://github.com/package-url/purl-spec/) (GitHub)

---

#### Regulatory references and standards

##### Regulatory references

* [Ecma Technical Committee 54 - Software and System Transparency.](https://tc54.org) - Standardizing core data formats, APIs, and algorithms that advance software and system transparency.
  * [ECMA-424 BOM Specification](https://tc54.org/cyclonedx/) - The CycloneDX specification for describing software, hardware and data components, services, dependencies, composition, attestations, vulnerabilities, licenses, formulations and more.
  * [ECMA-427 PURL Specification](https://ecma-international.org/publications-and-standards/standards/ecma-427/) - This standard defines the Package-URL (PURL) syntax for identifying software packages independently from their ecosystem or distribution channel
  * [ECMA-428 Common Lifecycle Enumeration (CLE) specification](https://ecma-international.org/publications-and-standards/standards/ecma-428/) - The CLE provides a standardized format for communicating software component lifecycle events in a machine-readable format.
* [European Union's Cyber Resilience Act (EU CRA)](https://www.european-cyber-resilience-act.com/)
  * [Cyber Resilience Act (CRA)](https://www.european-cyber-resilience-act.com/Cyber_Resilience_Act_Articles.html) - "The Final Text"
* [EU’s AI Act](https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng) - The European Union's  comprehensive legal framework for artificial intelligence, designed to ensure that AI systems used in the European Union are safe, ethical, and trustworthy.
  * [Article 53: Obligations for Providers of General-Purpose AI Models](https://artificialintelligenceact.eu/article/53/)
  * [Annex XI: Technical Documentation Referred to in Article 53(1), Point (a) – Technical Documentation for Providers of General-Purpose AI Models](https://artificialintelligenceact.eu/annex/11/)
  * [Explanatory Notice and Template for the Public Summary of Training Content for general-purpose AI models](https://digital-strategy.ec.europa.eu/en/library/explanatory-notice-and-template-public-summary-training-content-general-purpose-ai-models)

##### Standards

* [Linux Foundation projects](https://www.linuxfoundation.org/projects)
  * [System Package Data Exchange™ (SPDX®)](https://spdx.dev/)
    * [SPDX License IDs](https://spdx.dev/ids/)
    * [SPDX License List](https://spdx.org/licenses/)
* [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework)
  * [NIST Artificial Intelligence Risk Management
Framework (AI RMF 1.0)](https://nvlpubs.nist.gov/nistpubs/ai/nist.ai.100-1.pdf) (PDF) - A flexible guide designed to help organizations manage AI-related risks and promote trustworthy AI development.


---

#### Technology references

The following AI or ML technologies were referenced in discussion and/or examples in this guide:

* [Hugging Face](https://huggingface.co/) - an open-source platform and community for Artificial Intelligence (AI) and Machine Learning (ML).
  * [Hugging Face Transformers](https://huggingface.co/docs/transformers/) - a library that simplifies the training and inference of models that have a transformer architecture which uses PyTorch types and implementations "under-the-covers".
* [llama.cpp](https://github.com/ggml-org/llama.cpp) - an open-source inference engine, written in C++, designed for high-performance Large Language Model (LLM) execution across diverse hardware.
* [PyTorch](https://pytorch.org/) - an optimized tensor library and framework used for deep learning on GPUs and CPUs.
* [TensorFlow](https://www.tensorflow.org/) - An end-to-end open source machine learning platform.
  * [Tensorflow ModelCard Toolkit](https://github.com/tensorflow/model-card-toolkit) (archived) - streamlines and automates generation of Model Cards, machine learning documents that provide context and transparency into a model's development and performance.


---

#### Model references

The following ML models were referenced in discussion and/or examples in this guide:

##### Huggingface

Huggingface model (repositories) typically support the `.safetensors` Huggingface format; however, within the same repository alternative formats are often found such as PyTorch (`.bin`, `.pt`), GGUF (`.gguf`)

  * [microsoft/resnet-50](https://huggingface.co/microsoft/resnet-50/blob/main/README.md) - single `model.safetensors`, `pytorch_model.bin` file.
  * [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) - multiple  `*.safetensors` files with `model.safetensors.index.json` index.
    * [ArXiv - STEM: Efficient Relative Capability Evaluation of LLMs through Structured Transition Samples](https://arxiv.org/html/2508.12096v1) - Analysis of Qwen3 model performance.
  * [Qwen/Qwen3-8B-GGUF](https://huggingface.co/Qwen/Qwen3-8B-GGUF) - Contains GGUF format (i.e., `.gguf` files) which contain quantized versions of the Qwen3 large language model which contains both dense and mixture-of-experts (MoE) architecture models.
    * [ArXiv - Qwen3 Technical Report](https://arxiv.org/abs/2505.09388)

##### Kaggle

  * [mistral-ai/ministral-3](https://www.kaggle.com/models/mistral-ai/ministral-3) - multiple files that appear much like they would in a HF repo. Multiple  `*.safetensors` files with `model.safetensors.index.json` index.

##### ONNX

ONNX models are typically single file format ending with the `.onnx` extension.

Note: Most ONNX models have transitioned to and are now registered in Huggingface, but are downloaded from linked GitHub repository files not within the HF repo. itself.

* Huggingface
  * [onnx/DenseNet-121-9](https://huggingface.co/onnx/DenseNet-121-9/tree/main) - `densenet-9.onnx`
* GitHub (https://github.com/onnx/models/tree/main/validated/)
  * [vision/object_detection_segmentation/tiny-yolov2/model](https://github.com/onnx/models/tree/main/validated/vision/object_detection_segmentation/tiny-yolov2/model) - `tinyyolov2-7.onnx`
