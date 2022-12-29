# High-Level Capabilities
CycloneDX provides advanced, supply chain capabilities for cyber risk reduction. Among these capabilities are:

## Software Bill of Materials (SBOM)
SBOMs describe the inventory of software components and services and the dependency relationships between them.
A complete and accurate inventory of all first-party and third-party components is essential for risk identification.
SBOMs should ideally contain all direct and transitive components and the dependency relationships between them.

CycloneDX far exceeds the [Minimum Elements for Software Bill of Materials](https://www.ntia.gov/files/ntia/publications/sbom_minimum_elements_report.pdf)
as defined by the [National Telecommunications and Information Administration (NTIA)](https://www.ntia.gov/) in response
to [U.S. Executive Order 14028](https://www.whitehouse.gov/briefing-room/presidential-actions/2021/05/12/executive-order-on-improving-the-nations-cybersecurity/).

Adopting CycloneDX allows organizations to quickly meet these minimum requirements and mature into using more
sophisticated use cases over time. CycloneDX is capable of achieving all SBOM requirements defined in the
[OWASP Software Component Verification Standard (SCVS)](https://owasp.org/scvs).

## Software-as-a-Service BOM (SaaSBOM)
SaaSBOMs provide an inventory of services, endpoints, and data flows and classifications that power cloud-native applications.
CycloneDX is capable of describing any type of service including:

* Microservice Architecture
* Service Orientated Architecture (SOA)
* Function as a Service (FaaS)
* n-Tier Architecture
* Actor model
* System of Systems

SaaSBOMs compliment Infrastructure-as-Code (IaC) by providing a logical representation of a complex system, complete
with inventory of all services, their reliance on other services, endpoint URLs, data classifications, and the directional
flow of data between services. Optionally, SaaSBOMs may also include the software components that make up each service.

CycloneDX is protocol agnostic and is capable of describing services over HTTP(S), REST, GraphQL, MQTT, and intra-process
communication. The specification provides enough information about services to automatically generate dataflow diagrams
useful in security and privacy threat modeling.

## Hardware Bill of Materials (HBOM)
CycloneDX supports many types of components, including hardware devices, making it ideal for use with consumer
electronics, IoT, ICS, and other types of embedded devices. CycloneDX fills an important role in-between traditional
eBOM and mBOM use cases for hardware devices.

* Supports `device` as a first-class component type
* Utilizes a [formal and extensible taxonomy](https://github.com/CycloneDX/cyclonedx-property-taxonomy/blob/main/cdx/device.md) that defines a wide range of hardware devices and configurations

CycloneDX can represent any type of software component, service, and the firmware and hardware devices in an ‘as-built’
product. A formal property taxonomy can be leveraged and extended to describe any type of hardware attribute or
configuration. CycloneDX can also reference documentation that may describe the ‘recipe’ for how the product is
manufactured.

## Operations Bill of Materials (OBOM)
OBOMs provide full-stack inventory of runtime environments, configurations, and additional dependencies. CycloneDX is a
full-stack bill of materials standard supporting entire runtime environments consisting of hardware, firmware, containers,
operating systems, applications and their libraries. Coupled with the ability to specify configuration makes CycloneDX
ideal for Operational Bill of Materials.

CycloneDX properties provide a mechanism to store configuration on a per-component and per-service basis inside a BOM.
The specification also provides a mechanism to store URLs to documentation, including configuration management systems.

## Bill of Vulnerabilities (BOV)
CycloneDX BOMs may consist solely of vulnerabilities, thus can be used to share vulnerability data between systems and
sources of vulnerability intelligence. Complex vulnerability data can be represented including (but not limited to):

* Source of vulnerability intelligence
* References to other sources of intelligence containing the same vulnerability
* Multiple severity and/or risk ratiings
* Complete vulnerability details and recommendations
* Organizations and individuals credited with discovery
* Affected software and their versions

## Vulnerability Disclosure Report (VDR)
VDRs communicate known and unknown vulnerabilities affecting components and services. Known vulnerabilities inherited
from the use of third-party and open source software can be communicated with CycloneDX. Previously unknown vulnerabilities
affecting both components and services may also be disclosed using CycloneDX, making it ideal for Vulnerability Disclosure
Report (VDR) use cases.

## Vulnerability Exploitability eXchange (VEX)
VEX conveys the exploitability of vulnerable components in the context of the product in which they're used. VEX is a
subset of VDR. Often times, products are not affected by a vulnerability simply by including an otherwise vulnerable
component. VEX allows software vendors and other parties to communicate the exploitability status of vulnerabilities,
providing clarity on the vulnerabilities that pose risk and the ones that do not.

## Common Release Notes Format
CycloneDX standardizes release notes into a common, machine-readable format. This capability unlocks new workflow
potential for software publishers and consumers alike. This functionality works with or without the Bill of Materials
capabilities of the spec.

* Provides a common format in which to consume or publish release notes
* Every component and service may optionally contain release notes
* Helps reduce risk and operational expense by providing upgrade and security information to consumers
* Release notes include everything necessary for publishing into multiple formats


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>