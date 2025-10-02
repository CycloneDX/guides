# Introduction
CycloneDX is a modern standard for the software supply chain. At its core, CycloneDX is a general-purpose Bill of
Materials (BOM) standard capable of representing software, hardware, services, and other types of inventory. CycloneDX 
is an OWASP flagship project, has a formal standardization process and governance model through 
[Ecma Technical Committee 54](https://tc54.org), and is supported by the global information security community.

## What is CycloneDX Formulation?

CycloneDX formulation provides a universal framework for describing how *anything* came to be - whether software, hardware, services, data, algorithms, processes, or even the BOM document itself. The formulation capability extends the core CycloneDX specification to capture not just *what* components exist in a system, but *how* they were created, manufactured, tested, validated, certified, deployed, configured, or brought into existence through any process.

**Universal Applicability**: Formulation can describe the provenance and manufacturing process for virtually any entity:
- **Software Applications**: How code was compiled, tested, and packaged
- **Hardware Components**: Manufacturing processes, quality control, and assembly procedures
- **Services**: Deployment, configuration, testing, and operational procedures
- **Cryptographic Algorithms**: Implementation, validation, and compliance testing (FIPS 140-2, Common Criteria)
- **Data Sets**: Collection, curation, transformation, and validation processes
- **Infrastructure**: Provisioning, configuration, and deployment of systems
- **Compliance Artifacts**: How certifications, audits, and validations were conducted
- **BOM Documents**: The tools, processes, and procedures used to generate the BOM itself

### The Strategic Importance of Universal Formulation

In today's interconnected world, understanding how things come to be is critical across all domains:

- **Security Assurance**: Verifying that security controls were applied during any creation or validation process
- **Compliance Verification**: Demonstrating adherence to regulatory requirements across all domains (FIPS 140-2, Common Criteria, FDA validation, etc.)
- **Reproducible Processes**: Enabling independent verification and reconstruction of any process or artifact
- **Supply Chain Risk Management**: Identifying potential vulnerabilities in any creation, testing, or deployment pipeline
- **Incident Response**: Understanding how compromised or defective components were introduced into any system
- **Quality Assurance**: Documenting quality control processes for any type of deliverable
- **Regulatory Compliance**: Meeting documentation requirements across industries (automotive, aerospace, healthcare, finance, etc.)

## Design Philosophy and Guiding Principles

The CycloneDX formulation specification is built on several foundational principles that enable universal applicability:

**Universal Process Capture**: The standard ensures comprehensive capture of any creation, manufacturing, testing, validation, certification, or deployment process, regardless of domain. This includes everything from software compilation to hardware assembly, service deployment, algorithm validation, data curation, and compliance certification.

**Process Integration**: Formulation captures key elements of any systematic process, leveraging patterns and semantics from workflow management across all domains - whether CI/CD tooling, manufacturing execution systems, laboratory information management systems, or compliance management platforms.

**Compositional Integrity**: The design assures that compositional elements, their associations, and relationships allow for a complete representation of the formulas and processes necessary to enable repeatable processes with full traceability across any domain.

**Standards Compatibility**: Formulation information is designed to be compatible with domain-specific standards and frameworks:
- **Software**: Supply-chain Levels for Software Assurance (SLSA), NIST Secure Software Development Framework (SSDF)
- **Hardware**: IPC standards, ISO 9001 quality management
- **Cryptography**: FIPS 140-2, Common Criteria (ISO/IEC 15408), NIST Post-Quantum Cryptography
- **Healthcare**: FDA 21 CFR Part 11, ISO 13485, IEC 62304
- **Automotive**: ISO 26262 (Functional Safety), ISO/SAE 21434 (Cybersecurity)
- **Aerospace**: DO-178C, DO-254, AS9100
- **Finance**: PCI DSS, SOX compliance

## The Role of MBOM in Supply Chain Transparency

The Manufacturing Bill of Materials serves as a critical bridge between different aspects of supply chain security:

- **SBOM Integration**: Links manufacturing processes to the resulting software components
- **SLSA Compliance**: Provides detailed provenance information required for SLSA attestations
- **DevSecOps Enablement**: Documents security controls integrated into development workflows
- **Audit Trail Creation**: Maintains comprehensive records for compliance and security audits
The information of an MBOM is designed to be compatible with standards such as:

## High-Level MBOM Use Cases


A few high-level use cases for MBOM and its compatibility with other CycloneDX xBOM types include:

* **Software (SBOM)** - Describe how a software component or service is built and deployed via a Continuous Integration and Continuous Delivery (CI/CD) pipeline.
  * *This include capturing simple application builds using traditional `Makefiles`  or more complex, multi-tier software using CI/CD platforms such as Jenkins, Tekton, CircleCI, etc.*
* **Hardware (HBOM)** - Describe how a hardware component or service is manufactured.
* **Machine Learning (MLBOM)** - Describe the process of training, quantizing, optimizing and deploying ML models.
* **Data Processing Pipelines** - Describes how data is marshalled, transformed, enhanced, curated, stored, analyzed and used. 

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
