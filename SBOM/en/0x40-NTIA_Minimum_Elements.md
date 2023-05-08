# CycloneDX Data Felds and NTIA Minimum Elements
The U.S. [National Telecommunications and Information Administration](https://ntia.gov/) (NTIA) defines the following
[minimum elements of an SBOM](https://www.ntia.gov/files/ntia/publications/sbom_minimum_elements_report.pdf). They are:

| **Field**               | **CycloneDX Field**            | **Description**                         |
|-------------------------|--------------------------------|-----------------------------------------|
| Supplier Name           | bom.metadata.supplier          | The name of an entity that creates, defines, and identifies components. |
| Component Name          | bom.components[].name          | Designation assigned to a unit of software defined by the original supplier.|
| Component Version       | bom.components[].version       | Identifier used by the supplier to specify a change in software from a previously identified version.|
| Other Unique Identifiers | bom.components[].cpe,purl,swid | Other identifiers that are used to identify a component, or serve as a look-up key for relevant databases.|
| Dependency Relationship | bom.dependencies[]             | Characterizing the relationship that an upstream component X is included in software Y. |
| Author of SBOM Data     | bom.metadata.author            | The name of the entity that creates the SBOM data for this component.|
| Timestamp               | bom.metadata.timestamp         | Record of the date and time of the SBOM data assembly.|


CycloneDX highly encourages organizations to exceed the NTIA minimum elements whenever possible. Suggestions for other
types of data will vary by use case, but generally should include (but not be limited to):


| **Field**            | **CycloneDX Field**                   | **Description**                                                                                                                           |
|----------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| BOM Generation Tools | bom.metadata.tools[]                  | The tool(s) used to create the BOM                                                                                                        |
| Component Provenance | bom.components[].supplier             | The name of the entity who supplied an individual component                                                                               |
| Component Hash       | bom.components[].hashes[]             | The hash values of the file or package                                                                                                     |
| Component License    | bom.components[].licenses[]           | The license(s) in which the component is released under                                                                                   |
| External References  | bom.components[].externalReferences[] | Locations to advisories, version control and build systems, etc                                                                           |
| Services             | bom.services[].*                      | A complete inventory of services including endpoint URLs, data classifications, etc which the product and/or individual components rely on |
| Known Unknowns       | bom.compositions[].*                  | Assertions on the completeness of the inventory of components and services, along with the completeness of dependency relationships       |


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>