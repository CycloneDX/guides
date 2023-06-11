# Establishing Relationships in CycloneDX
CycloneDX has a rich set of relationships that provide additional context and information about the objects in the BOMs
inventory. All relationships in CycloneDX are expressed explicitly. Some relationships are declared through the natural
use of the CycloneDX format. These include assemblies, dependencies, and pedigree. Other relationships are formed via
references to the object's identity in the BOM, referred to as `bom-ref`. The combination of these two approaches 
dramatically simplifies the specification, providing necessary guardrails to prevent deviation of its usage and providing 
an easy path to supporting enveloped signing and other advanced usages.

## Component Assemblies
Components in a BOM can be nested to form an assembly. An assembly is a collection of components that are included in a 
parent component. As an analogy, an automotive dashboard contains an instrument panel component. And the instrument panel 
component contains a speedometer component. This nested relationship is called an assembly in CycloneDX. 

Software assemblies that can be represented in CycloneDX can range from large enterprise solutions comprising multiple 
systems, to cloud-native deployments containing extensive collections of related micro-services. 
Assemblies can also describe simpler inclusions, such as software packages that contain supporting files.

> Assemblies, or leaves within an assembly, can independently be signed. BOMs comprising component assemblies from 
> multiple suppliers can benefit from this capability. Each supplier can sign their respective assembly. The creator of 
> final goods can then sign the BOM as a whole.

The following example illustrates a simple component assembly. In this case, Acme Commerce Suite includes two other
applications as part of its assembly.

```json
"components": [
  {
    "type": "application",
    "name": "Acme Commerce Suite",
    "version": "2.0.0",
    "components": [
      {
        "type": "application",
        "name": "Acme Storefront Server",
        "version": "3.7.0",
      },
      {
        "type": "application",
        "name": "Acme Payment Processor",
        "version": "3.1.1",
      }
    ]
  }
]
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

## Service Assemblies
Services also have assemblies and work identically to those of components. While component assemblies describe a component
that _includes_ another component, service assemblies describe a service with other services _behind_ it. A common cloud 
pattern is the use of API gateways which proxy and orchestrate connections to relevant microservices. The microservices 
themselves may not be directly accessible; rather, they are accessed exclusively through the API gateway. For this 
scenario, the API gateway service may contain an assembly of microservices behind it.

## Dependencies
CycloneDX provides the ability to describe components and their dependency on other components. This relies on a 
components `bom-ref` to associate the component with the dependency element in the graph. The only requirement for bom-ref 
is that it is unique within the BOM. Package URL (PURL) is an ideal choice for bom-ref as it will be both unique and 
readable. If PURL is not an option or not all components represented in the BOM contain a PURL, then UUID is recommended.
A dependency graph is typically one node deep and capable of representing both direct and transitive relationships.

TODO - Design a BOX representation of components - and only list the dependencies section.

```json
"dependencies": [
  {
    "ref": "acme-app",
    "dependsOn": [
      "pkg:maven/org.acme/web-framework@1.0.0",
      "pkg:maven/org.acme/persistence@3.1.0"
    ]
  },
  {
  "ref": "pkg:maven/org.acme/web-framework@1.0.0",
    "dependsOn": [
      "pkg:maven/org.acme/common-util@3.0.0"
    ]
  },
  {
    "ref": "pkg:maven/org.acme/common-util@3.0.0",
    "dependsOn": []
  }
]
```

> Components that do not have dependencies MUST be declared as empty elements within the graph. Components not 
> represented in the dependency graph MAY have unknown dependencies. It is RECOMMENDED that implementations assume this 
> to be opaque and not an indicator of a component being dependency-free.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>