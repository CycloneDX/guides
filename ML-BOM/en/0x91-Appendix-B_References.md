# Appendix B: References

The following resources may be useful to users and adopters of the CycloneDX standard and its ML-BOM profile:

#### Standards and regulatory references

* [Ecma Technical Committee 54](https://tc54.org)
  * [ECMA-424 BOM Specification](https://tc54.org/cyclonedx/) - Specification for describing software, hardware and data components, services, dependencies, composition, attestations, vulnerabilities, licenses, formulations and more.
  * [ECMA-427 PURL Specification](https://ecma-international.org/publications-and-standards/standards/ecma-427/)
  * [ECMA-428 Common Lifecycle Enumeration (CLE) specification](https://ecma-international.org/publications-and-standards/standards/ecma-428/)
* [European Union's Cyber Resilience Act (EU CRA)](https://www.european-cyber-resilience-act.com/)
  * [Cyber Resilience Act (CRA) | The Final Text](https://www.european-cyber-resilience-act.com/Cyber_Resilience_Act_Articles.html)
  * [Article 53: Obligations for Providers of General-Purpose AI Models](https://artificialintelligenceact.eu/article/53/)
  * [Annex XI: Technical Documentation Referred to in Article 53(1), Point (a) – Technical Documentation for Providers of General-Purpose AI Models](https://artificialintelligenceact.eu/annex/11/)
  * [Explanatory Notice and Template for the Public Summary of Training Content for general-purpose AI models](https://digital-strategy.ec.europa.eu/en/library/explanatory-notice-and-template-public-summary-training-content-general-purpose-ai-models)

* [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework)

#### CycloneDX resources

* [OWASP CycloneDX](https://cyclonedx.org/)
  * OWASP CycloneDX [Authoritative Guide to SBOM](https://cyclonedx.org/guides/OWASP_CycloneDX-Authoritative-Guide-to-SBOM-en.pdf)
  * [Tool Center](https://cyclonedx.org/tool-center/)
  * [BOM Repository Server](https://github.com/CycloneDX/cyclonedx-bom-repo-server)
* [OWASP Dependency-Track](https://dependencytrack.org/)
* [OWASP Software Component Verification Standard (SCVS)](https://scvs.owasp.org/)
  * [SCVS BOM Maturity Model](https://scvs.owasp.org/bom-maturity-model/)
* [Package-URL (PURL) Specification](https://github.com/package-url/purl-spec/) (GitHub)

#### Referenced standards

* [OpenChain](https://www.openchainproject.org/)
* [SPDX License IDs](https://spdx.dev/ids/)
* [SPDX License List](https://spdx.org/licenses/)

#### Technology references

* [Huggingface](https://huggingface.co/) - an open-source platform and community for Artificial Intelligence (AI) and Machine Learning (ML).
* [PyTorch](https://pytorch.org/) - an optimized tensor library and framework used for deep learning on GPUs and CPUs.
* [TensorFlow](https://www.tensorflow.org/) - An end-to-end open source machine learning platform.

#### Model references

##### Huggingface

Huggingface model (repositories) typically support the `.safetensors` Huggingface format; however, within the same repository alternative formats are often found such as PyTorch (`.bin`, `.pt`), GGUF (`.gguf`)

  * [microsoft/resnet-50](https://huggingface.co/microsoft/resnet-50/blob/main/README.md) - single `model.safetensors`, `pytorch_model.bin` file.
  * [Qwen/Qwen-7B](https://huggingface.co/Qwen/Qwen-7B) - multiple  `*.safetensors` files with `model.safetensors.index.json` index.

##### Kaggle

  * [mistral-ai/ministral-3](https://www.kaggle.com/models/mistral-ai/ministral-3) - multiple files that appear much like they would in a HF repo. Multiple  `*.safetensors` files with `model.safetensors.index.json` index.

##### ONNX

ONNX models are typically single file format ending with the `.onnx` extension.

Note: Most ONNX models have transitioned to and are now registered in Huggingface, but are downloaded from linked GitHub repository files not within the HF repo. itself.

* Huggingface
  * [onnx/DenseNet-121-9](https://huggingface.co/onnx/DenseNet-121-9/tree/main) - `densenet-9.onnx`
* GitHub (https://github.com/onnx/models/tree/main/validated/)
  * [vision/object_detection_segmentation/tiny-yolov2/model](https://github.com/onnx/models/tree/main/validated/vision/object_detection_segmentation/tiny-yolov2/model) - `tinyyolov2-7.onnx`
