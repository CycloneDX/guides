# Core Concepts and Architecture

## The Formulation Framework

The CycloneDX formulation framework describes how something was "formed" or manufactured by capturing the complete manufacturing process. This includes:

**Formulas**: High-level descriptions of manufacturing processes that can be applied across different contexts and environments.

**Workflows**: Logical phases of the manufacturing process, organized as directed acyclic graphs of dependent tasks. In CI/CD contexts, workflows correspond to pipelines that execute a series of related operations.

**Tasks**: Individual units of work within workflows, each with specific inputs, outputs, and execution steps. Tasks represent atomic operations like building code, running tests, or deploying artifacts.

**Steps**: The granular commands and operations executed within tasks, providing the lowest level of detail about the manufacturing process.

## High-Level MBOM Use Cases

The Manufacturing Bill of Materials supports diverse manufacturing scenarios across different domains:

**Software Development (SBOM Integration)**
- Describes how software components are built and deployed via CI/CD pipelines
- Captures everything from simple Makefile-based builds to complex multi-tier software systems
- Documents the use of build frameworks, dependency management, and deployment automation
- Supports both traditional and cloud-native development practices

**Hardware Manufacturing (HBOM Integration)**
- Documents hardware component manufacturing processes
- Captures assembly instructions, quality control procedures, and testing protocols
- Links physical manufacturing to digital twins and simulation models

**Machine Learning Operations (MLBOM Integration)**
- Describes ML model training, quantization, optimization, and deployment processes
- Captures data preprocessing pipelines, model validation procedures, and inference deployment
- Documents MLOps workflows including model versioning and A/B testing

**Data Processing Pipelines**
- Describes how data is collected, transformed, enhanced, curated, stored, analyzed, and utilized
- Captures data lineage, processing logic, and quality assurance procedures
- Documents data governance and compliance controls

## Composability and Separation of Concerns

One of the key architectural decisions in CycloneDX formulation is the separation of creation/manufacturing information
from component inventories. This composability approach offers several advantages across all domains:

**Security Boundaries**: Organizations can share component inventories (SBOMs, HBOMs, etc.) with customers and partners
while maintaining strict control over sensitive process details (formulation data). This separation enables appropriate
access controls and information sharing policies across different stakeholder groups.

**Scalability**: Large or complex processes can be decomposed into manageable, reusable components that can be linked
and referenced as needed. This applies whether dealing with software builds, hardware assembly lines, or compliance
certification processes.

**Flexibility**: Different stakeholders can access the level of detail appropriate for their use cases, from high-level
component lists to detailed procedural documentation.

### Formulation Linking Strategy

The recommended approach for managing formulation information involves referencing it from the primary component BOM
using CycloneDX's BOM-Link mechanism. This applies universally whether describing software builds, hardware manufacturing,
service deployment, or compliance processes:

```json
"externalReferences": [
  {
    "type": "formulation",
    "url": "https://example.com/mboms/acme-library-1.0.cdx.json",
    "hashes": [
      {
        "alg": "SHA-256",
        "content": "c7be1ed902fb8dd4d48997c6452f5d7e509fbcdbe2808b16bcf4edce4c07d14e"
      }
    ]
  }
]
```

This approach enables:
- **Independent Access Control**: Different security policies for inventory vs. process data across all domains
- **Modular Management**: Separate lifecycle management for different aspects of the BOM (inventory vs. provenance)
- **Reduced Complexity**: Smaller, focused documents that are easier to process and validate
- **Domain Flexibility**: Different formulation documents for different aspects (manufacturing, testing, deployment, certification)


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
