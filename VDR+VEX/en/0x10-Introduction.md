# Introduction

CycloneDX is a modern standard for the software supply chain. At its core, CycloneDX is a general-purpose Bill of 
Materials (BOM) standard capable of representing software, hardware, services, and vulnerabilities. The CycloneDX 
standard began life in 2017 in the Open Web Application Security Project (OWASP) community. Since then, the standard has 
matured into an OWASP Flagship project, has adopted a formal standardization process and governance model, and is 
supported by the global information security community.

## Design Philosophy and Guiding Principals
Simplicity of design is at the forefront of the CycloneDX philosophy. The format is easily approachable by a wide range
of technical and non-technical roles. CycloneDX is a full-stack BOM format with many advanced capabilities which are
achieved without sacrificing its design philosophy. Some guiding principals influencing its design include:

* Be easy to adopt and easy to contribute to
* Identify risk to as many adopters as possible, as quickly as possible
* Avoid any and all blockers that prevent the identification of risk
* Continuous improvement - innovate quickly and improve over time
* Encourage innovation and competition through extensions
* Produce immutable and backward compatible releases
* Focus on high degrees of automation
* Provide smooth path to specification compliance through prescriptive design

## Serialization Formats
CycloneDX can be represented in JSON, XML and Protocol Buffers (protobuf) and has corresponding schemas for each.

| **Format** | **Resource**  | **URL**                                          |
|------------|---------------|--------------------------------------------------|
| JSON       | Documentation | https://cyclonedx.org/docs/latest/json/          |
| JSON       | Schema        | https://cyclonedx.org/schema/bom-1.4.schema.json |
| XML        | Documentation | https://cyclonedx.org/docs/latest/xml/           |
| XML        | Schema        | https://cyclonedx.org/schema/bom-1.4.xsd         |
| Protobuf   | Schema        | https://cyclonedx.org/schema/bom-1.4.proto       |


### A note on validation
CycloneDX relies upon JSON Schema, XML Schema, and protobuf for validation. The entirety of the specification can be
validated using officially supported CycloneDX tools or via hundreds of available validators that support JSON Schema,
XML Schema, or protobuf.

## High-Level Capabilities
CycloneDX provides advanced, supply chain capabilities for cyber risk reduction. Among these capabilities are:

* Software Bill of Materials (SBOM)
* Software-as-a-Service Bill of Materials (SaaSBOM)
* Hardware Bill of Materials (HBOM)
* Operations Bill of Materials (OBOM)
* Bill of Vulnerabilities (BOV)
* Vulnerability Disclosure Report (VDR)
* Vulnerability Exploitability eXchange (VEX)
* Common Release Notes Format

### Software Bill of Materials (SBOM)
SBOMs describe the inventory of software components and services and the dependency relationships between them.
A complete and accurate inventory of all first-party and third-party components is essential for risk identification.
SBOMs should ideally contain all direct and transitive components and the dependency relationships between them.

### Software-as-a-Service BOM (SaaSBOM)
SaaSBOMs provide an inventory of services, endpoints, and data flows and classifications that power cloud-native applications.
CycloneDX is capable of describing any type of service including microservices, Service Orientated Architecture (SOA),
Function as a Service (FaaS), and System of Systems.

SaaSBOMs compliment Infrastructure-as-Code (IaC) by providing a logical representation of a complex system, complete
with inventory of all services, their reliance on other services, endpoint URLs, data classifications, and the directional
flow of data between services. Optionally, SaaSBOMs may also include the software components that make up each service.

### Hardware Bill of Materials (HBOM)
CycloneDX supports many types of components, including hardware devices, making it ideal for use with consumer
electronics, IoT, ICS, and other types of embedded devices. CycloneDX fills an important role in-between traditional
eBOM and mBOM use cases for hardware devices.

### Operations Bill of Materials (OBOM)
OBOMs provide full-stack inventory of runtime environments, configurations, and additional dependencies. CycloneDX is a
full-stack bill of materials standard supporting entire runtime environments consisting of hardware, firmware, containers,
operating systems, applications and their libraries. Coupled with the ability to specify configuration makes CycloneDX
ideal for Operational Bill of Materials.

### Bill of Vulnerabilities (BOV)
CycloneDX BOMs may consist solely of vulnerabilities, thus can be used to share vulnerability data between systems and
sources of vulnerability intelligence. Complex vulnerability data can be represented including the vulnerability source,
references, multiple severity and risk ratings, details and recommendations, and the affected software and hardware 
along with and their versions.

### Vulnerability Disclosure Report (VDR)
VDRs communicate known and unknown vulnerabilities affecting components and services. Known vulnerabilities inherited
from the use of third-party and open source software can be communicated with CycloneDX. Previously unknown vulnerabilities
affecting both components and services may also be disclosed using CycloneDX, making it ideal for Vulnerability Disclosure
Report (VDR) use cases.

### Vulnerability Exploitability eXchange (VEX)
VEX conveys the exploitability of vulnerable components in the context of the product in which they're used. VEX is a
subset of VDR. Often times, products are not affected by a vulnerability simply by including an otherwise vulnerable
component. VEX allows software vendors and other parties to communicate the exploitability status of vulnerabilities,
providing clarity on the vulnerabilities that pose risk and the ones that do not.

### Common Release Notes Format
CycloneDX standardizes release notes into a common, machine-readable format. This capability unlocks new workflow
potential for software publishers and consumers alike. This functionality works with or without the Bill of Materials
capabilities of the spec.


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>