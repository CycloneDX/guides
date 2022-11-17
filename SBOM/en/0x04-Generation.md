# Generation

There are many approaches to generating SBOMs..... TODO

## Software Lifecycle
A typical software development lifecycle (SDLC) includes several phases such as planning, design, implementation, 
testing, release, operations, and decommissioning. SBOMs may be created at various phases of the lifecycle and thus
may include data specific to the lifecycle. It is imperative that the target audience of the SBOM is first identified. 
This should include the types of analysis the target audience may perform on the SBOM and the type of data that 
must be present in the SBOM to support the analyses. It is also important to identify the type of data which 
should not be communicated to the target audience.

### Scenario #1:
A software vendor wants to communicate SBOMs to end consumers. The vendor may want to allow the consumer to perform the
following types of analysis against the vendor SBOM:

| **Analysis**                    | **Required Data Types**             |
|---------------------------------|-------------------------------------|
| Component Inventory             | Component vendor, name, and version |
| Known Vulnerability Analysis    | Package URL, CPE, SWID              |
| File Integrity Monitoring       | Files components, Hashes            |
| OSS Outdated Component Analysis | Package URL                         |


### Scenario #2:
A software vendor wants to verify the integrity of the software components they deliver to the market. The vendor may want
to capture and analyze information for internal purposes only. Release to the public would constitute an unwanted
information disclosure.

| **Analysis**                    | **Required Data Types**                                      |
|---------------------------------|--------------------------------------------------------------|
| Provenance                      | URLs to OSS repositories, builder configuration, formulation |
| License Compliance              | License ID, expression, and text                             |


## Generating SBOMs for source files
SBOMs may describe individual source files and other digital assets in a directory or version control system. These types
of SBOMs typically include file components, file hashes, and evidence of license and copyright statements. The primary
purpose of this type of SBOM is for license compliance and intellectual property use cases. They may also be used
as an OpenChain Compliance Artifact. Oftentimes, license attribution reports can be derived from source SBOMs.

## Generating SBOMs at build
Integrating SBOM generation into the software's build system is the preferred starting point for producing SBOMs for
cybersecurity use cases. Modern build systems rely on package manifests which describe the intent to use specific 
dependencies. Examples of manifests include `pom.xml` (Java/Maven), `package-lock.json` (Javascript/npm), and 
`requirements.txt` (Python). 

There are three primary strategies for producing SBOMs during a build.
* Integration into build lifecycle
* Analyzing build artifacts external to lifecycle
* Software factory

### Build lifecycle vs. external to lifecycle
Many build systems have a "lifecycle" that can affect dependency resolution. These lifecycles are often
configurable by the developers and can have a profound effect on component inventory and versions. For example, Maven
resolves dependencies as it progresses through its lifecycle. A Maven build may also include optional profiles which can
alter what dependencies included or excluded from the final deliverable. Analyzing `pom.xml` outside of Mavens
lifecycle will typically lead to erroneous results. On the Javascript front, many plugins to npm or web frameworks can
dramatically affect component inventory. For example, many web frontends are optimized using a process called bundling
which removes unused dependencies and/or functions through a process called "tree-shaking" and aggregates the Javascript
into highly optimized bundles for efficient delivery to web and mobile browsers. In these scenarios, simply relying on
`package-lock.json` as the source of truth would lead to an erroneous SBOM that contained an inventory of components that
are not distributed in the final artifact. In the case of software vendors, it is important to only include the
components that are distributed with the final software. Not doing so may lead to increased and unnecessary support costs.

todo: pros/cons of generating lifecycle vs external

### Software factory
Integrating into individual builds, especially a build's lifecycle has many advantages, but it generally takes more effort.
Another approach is to target the generation at the software factories themselves. Software factories often comprise
Continuous Integration and Continuous Delivery (CI/CD) systems. Organizations may choose to customize their CI/CD 
environment to optimize software delivery and increase the efficiency of onboarding new software projects. A strategic
option for many organizations is to reduce the effort necessary to create SBOMs by automating as much as possible. 
Once configured, generating SBOMs from software factories allows organizations to produce SBOMs for a large number of 
software projects with little to no effort. GitHub Actions, GitLab Runners, Jenkins libraries, and Circle CI orbs are
often used as the foundation for many software factories. While this approach can quickly scale across an organization, 
the accuracy of the SBOMs may be impacted as the software factories orchestrate the build tools, they are not directly
part of the build systems lifecycle.

## Generating SBOMs at runtime
Analyzing source files or build manifests has some limitations in that they do not capture the environment in which the
software is being run, the system dependencies that are used which are not specified in the source files or manifests, and
will be limited to the inventory of software components. Generating SBOMs at runtime is often achieved through observability
or instrumentation. Examples of platforms capable of runtime generation include:
* Interactive Application Security Testing (IAST)
* Mobile Application Security Testing (MAST)

Generating SBOMs at runtime has many benefits including:
* Capturing the dependencies that are used and those that may be distributed but are unused
* Capturing system dependencies of the underlying platform or operating system
* Capturing information and configuration about the runtime environment
* Capturing the use and reliance on external services such as those provided via HTTP and MQTT

The platforms capable of runtime generation are often used as part of the software's testing phase and orchestrated by
CI systems. In addition, many IAST platforms also double as RASP (Runtime Application Security Protection) and can
proactively mitigate specific types of attacks automatically.

## Generating SBOMs at deploy
TODO: what was I thinking here?

## Generating SBOMs from evidence (from binaries)
Oftentimes, especially for legacy software, the source or build files may not be available, and runtime instrumentation
may not be possible. In these cases, analyzing the binary artifacts may be necessary. These same approaches may also 
be used by security firms specializing in firmware forensics associated with medical, IoT, and other types of devices.

TODO: reach out to IWG for guidance...

## SBOM generation as a process
As we've seen, there are many different ways to generate SBOMs, each method having various trade-offs. CycloneDX
recommends organizations establish a process around SBOM generation that aligns with the needs of the business and that
of the SBOM consumer. In practice, SBOM generation is a process, not a one-time event. As organizations mature their SBOM
efforts and consumers expect increased accuracy and expanded data, having an established process that can accommodate
multiple generation methods along with the ability to augment and correct SBOM data will provide a strategic advantage.

TODO: possible SBOM process flow

## Formulation

## SBOM data recommendations
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


| **Field**              | **CycloneDX Field**                    | **Description**                                                 |
|------------------------|----------------------------------------|-----------------------------------------------------------------|
| BOM Generation Tools   | bom.metadata.tools[]                   | The tool(s) used to create the BOM                              |
| Component Provenance   | bom.components[].supplier              | The name of the entity who supplied an individual component     |
| Component Hash         | bom.components[].hashes[]              | The hash values of the file or package                           |
| Component License      | bom.components[].licenses[]            | The license(s) in which the component is released under         |
| External References    | bom.components[].externalReferences[]  | Locations to advisories, version control and build systems, etc |



<div style="page-break-after: always; visibility: hidden">
\newpage
</div>