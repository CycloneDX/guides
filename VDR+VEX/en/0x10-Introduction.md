# Introduction

CycloneDX is a modern standard for the software supply chain. At its core, CycloneDX is a general-purpose Bill of 
Materials (BOM) standard capable of representing software, hardware, services, and vulnerabilities. The CycloneDX 
standard began life in 2017 in the Open Web Application Security Project (OWASP) community. Since then, the standard has 
matured into an OWASP Flagship project, has adopted a formal standardization process and governance model, and is 
supported by the global information security community.

## Design Philosophy and Guiding Principals



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

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>