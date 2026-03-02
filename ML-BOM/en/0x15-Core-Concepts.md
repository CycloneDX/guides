# Core Concepts and Considerations

## Key Components of an ML-BOM

An ML-BOM typically documents the identifying elements, architecture, components and its supply chain along with any configurations and developmental or executional considerations inclusive of the following areas:

- **Model identifiers**: Identifying information such as the model's [Package URL (PURL)](https://tc54.org/purl/) (e.g., from Huggingface `pkg:huggingface/distilbert-base-uncased@043235d6088ecd3dd5fb5ca3592b6913fd51602`) or other domain-specific identifiers within other registries.

- **Model metadata**: Descriptive details such as the model's name, version, license, developer, purpose, use cases, architecture, (hyper)parameters and any additional identifying elements.

- **Model architecture**: Description of the  composition of the model's neural network including configurations, layers, input/output parameters, attention mechanisms, etc. used at network processing stages.

- **Datasets**: Description of datasets, as CycloneDX data components, used for training and testing of the associated model. This includes data sources, selection criteria, acquisition methods, preprocessing steps and more.

- **Tokenizers and prompt templates**: Descriptive details of specific tokenizers (e.g., libraries, files, configurations) and prompt templates used to train and/or interact with the model during runtime.

- **Hardware, software & frameworks**: A list of all hardware and software components including libraries, packages, frameworks (e.g., TensorFlow, PyTorch, Huggingface), along with specific versions and associated licenses used in aspects of the model's lifecycle.
This informational category may also include operational and application aspects of models (perhaps as agents) used within compositional frameworks and workflows along with the protocols used for communication.

- **Training & testing details**: Information about the computational environment and systems (software, hardware, operating system, and GPUs) used for training or evaluation along with necessary configurations, hyperparameters, and evaluation metrics.

- **Intended use & ethical considerations**: Documentation of the model's intended use, known limitations, safety guardrails, and ethical considerations.

- **Environmental impacts**: Documentation of the resource needed to train or execute the model which have an environmental impact or cost (e.g., data center energy and water cooling cost details).

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
