# CycloneDX Object Model
The CycloneDX object model is defined in JSON Schema, XML Schema, and Protocol Buffers and consists of metadata,
components, services, dependencies, compositions, vulnerabilities, and formulation. CycloneDX is prescriptive, can 
easily describe complex relationships, and is extensible to support specialized and future use cases.

![CycloneDX Object Model](../../images/CycloneDX-Object-Model-Swimlane.png)

Within the root `bom` element, CycloneDX defines the following data types:

![BOM Metadata](../../images/Object%20Model/CycloneDX-Object-Type-Overview.png)

## BOM Identity
In addition, the `bom` element has properties for `serialNumber` and `version`. Together these two properties form the
identity of a BOM. A BOMs identity can be expressed using a BOM-Link, a formally registered URN capable of referencing
a BOM or any component, service, or vulnerability in a BOM. Refer to the chapter on BOM-Link for more information.

### Serial Number
Every BOM generated SHOULD have a unique serial number, even if the contents of the BOM have not changed over time. 
If specified, the serial number MUST conform to RFC-4122. Use of serial numbers are RECOMMENDED.

### Version
Whenever an existing BOM is modified, either manually or through automated processes, the version of the BOM SHOULD be 
incremented by 1. When a system is presented with multiple BOMs with identical serial numbers, the system SHOULD use 
the most recent version of the BOM. The default version is '1'.

## Metadata
BOM metadata includes the supplier, manufacturer, and the target component for which the BOM describes. It also includes
the tools used to create the BOM, and license information for the BOM document itself.

![Metadata](../../images/Object%20Model/Metadata.png)


## Components
Components describe the complete inventory of first-party and third-party components. The specification can represent
applications, frameworks, libraries, containers, operating systems, devices, firmware, files, along with the manufacturer
information, license and copyright details, and complete pedigree and provenance for every component.

![Components](../../images/Object%20Model/Components.png)

## Services
Services describe external APIs that the software may call. Services describe endpoint URI’s, authentication
requirements, and trust boundary traversals. The flow of data between software and services can also be described
including the data classifications, and the flow direction of each type.

![Services](../../images/Object%20Model/Services.png)

## Dependencies
CycloneDX provides the ability to describe components and their dependency on other components. The dependency graph is
capable of representing both direct and transitive relationships. Components that depend on services can be represented
in the dependency graph and services that depend on other services can be represented as well.

![Dependencies](../../images/Object%20Model/Dependencies.png)

## Compositions
Compositions describe constituent parts (including components, services, and dependency relationships) and their
completeness. The aggregate of each composition can be described as complete, incomplete, incomplete first-party only,
incomplete third-party only, or unknown.

![Compositions](../../images/Object%20Model/Compositions.png)

## Vulnerabilities
Known vulnerabilities inherited from the use of third-party and open source software and the exploitability of the
vulnerabilities can be communicated with CycloneDX. Previously unknown vulnerabilities affecting both components and
services may also be disclosed using CycloneDX, making it ideal for both VEX and security advisory use cases.

![Vulnerabilities](../../images/Object%20Model/Vulnerabilities.png)

## Formulation
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras et nibh justo. Fusce ornare eros at venenatis dapibus. In dignissim luctus pellentesque. Pellentesque blandit odio lorem, varius hendrerit metus elementum quis. Vestibulum eget dictum urna. Donec lacinia et ipsum non blandit. Praesent arcu risus, feugiat et arcu id, fermentum cursus elit. Fusce nec orci auctor, laoreet turpis in, tincidunt arcu. Ut faucibus nibh sit amet magna pharetra consequat. Fusce eu leo enim. Phasellus ac libero nisl. Nam congue dolor vitae metus tempor euismod. Nam viverra felis eu nulla rhoncus, at rhoncus sem gravida. In tempor libero vel turpis vehicula, non aliquam urna venenatis. Etiam tincidunt est nec bibendum commodo.

![Formulation](../../images/Object%20Model/Formulation.png)

## Extensions
Multiple extension points exist throughout the CycloneDX object model allowing fast prototyping of new capabilities and
support for specialized and future use cases. The CycloneDX project maintains extensions that are beneficial to the
larger community. The project encourages community participation and development of extensions that target specialized
or industry-specific use cases.

![Extensions](../../images/Object%20Model/Extensions.png)

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>