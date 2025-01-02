# Introduction
CycloneDX is a modern standard for the software supply chain. At its core, CycloneDX is a general-purpose Bill of
Materials (BOM) standard capable of representing software, hardware, services, and other types of inventory. CycloneDX 
is an OWASP flagship project, has a formal standardization process and governance model through 
[Ecma Technical Committee 54](https://tc54.org), and is supported by the global information security community.

## Design Philosophy and Guiding Principles

Some guiding principles influencing the design of formulation schema include:

* Assure the capture of general manufacturing processes, including those related to producing components against security and compliance standards.
* Capture key elements of a typical Continuous Integration and Continuous  Delivery (CI/CD) processes used to release and produce software and hardware products.
* Leverage patterns and semantics from workflow management and CI/CD tooling.
* Assure compositional elements and their associations and relationships allow for a representation of the formulae and processes to enable repeatable builds.

## The Role of MBOM in Supply Chain Transparency

The information of an MBOM is designed to be compatible with standards such as:

* **Security Levels for Software Assurance (SLSA)** (https://slsa.dev/) which is a specification for describing and incrementally improving supply chain security.


## High-Level MBOM Use Cases


A few high-level use cases for MBOM and its compatibility with other CycloneDX xBOM types include:

* **Software (SBOM)** - Describe how a software component or service is built and deployed via a Continuous Integration and Continuous Delivery (CI/CD) pipeline.
  * *This include capturing simple application builds using traditional `Makefiles`  or more complex, multi-tier software using CI/CD platforms such as Jenkins, Tekton, CircleCI, etc.*
* **Hardware (HBOM)** - Describe how a hardware component or service is manufactured.
* **Machine Learning (MLBOM)** - Describe the process of training, quantizing, optimizing and deploying ML models.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
