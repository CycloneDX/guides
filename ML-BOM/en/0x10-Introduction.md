# Introduction

CycloneDX is a modern standard for the software supply chain. At its core, CycloneDX is a general-purpose Bill-of-Materials (BOM) standard capable of representing software, hardware,  services, and other types of inventory.

CycloneDX is notably an OWASP flagship project, has a formal standardization process and governance model through [Ecma Technical Committee 54](https://tc54.org), and is supported by the global information security community.

## What is an ML-BOM?

An ML-BOM (Machine Learning Bill-of-Materials) is a CycloneDX BOM document specialized to address the unique complexities and risks of AI/ML systems. It  provides a detailed inventory of all components, configurations, and processes involved in the development, training, deployment and hosting (i.e., via hardware/software stacks and frameworks) of a machine learning model.

The primary purpose of an ML-BOM is to ensure transparency, traceability, security, and compliance throughout an ML model's lifecycle.


### Why ML-BOMs are Important

ML-BOMs address critical challenges in the machine learning supply chain:

- **Security & Vulnerability Management**: Help  identify security risks, such as malicious (open-source) models or vulnerable dependencies, before they are integrated into production applications.

- **Governance & Compliance**: Provide documentation for audits or formal informational requests based upon requirements from emerging global AI regulations such as the [European Union's Cyber Resilience Act (EU CRA)](https://www.european-cyber-resilience-act.com/), including specifics for AI models and systems from the complementary [EU AI Act](https://artificialintelligenceact.eu/), as well as for voluntary, guidance-focused frameworks such as the [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework).

- **Risk Mitigation**: Enable teams to track data lineage, helping to identify and eliminate potential data quality issues, privacy risks, or unwanted biases that could affect the model's performance and fairness.

- **Reproducibility & Explainability**: Show adherence to software development lifecycle best practices by providing a detailed record of components and training processes such that developers are able to reproduce models (via training from datasets) and their benchmarks in order to validate claims of model accuracy and adherence to ethical considerations.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
