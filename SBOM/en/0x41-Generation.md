# Generating CycloneDX BOMs
There are many ways to generate BOMs, each method having various trade-offs. CycloneDX recommends organizations 
establish a process around BOM generation that aligns with the needs of the business and that of the BOM consumer. 
In practice, BOM generation is a process, not a one-time event. As organizations mature their BOM efforts and consumers 
expect increased accuracy and expanded data, having an established process that can accommodate multiple generation 
methods and the ability to augment and correct BOM data throughout the generation process will provide strategic advantages.

The following process is the path most traveled by organizations that first adopt SBOMs. This process starts with SBOM 
generation, which is often performed during the build process, followed by consumption and analysis of the SBOM. 
Simultaneously, the SBOM is often published alongside the artifacts that result from the build process.

<div style="page-break-after: always; visibility: hidden">
\emptyparagraph
</div>

![Simple SBOM Process](images/simple_sbom_process.svg)

<div style="page-break-after: always; visibility: hidden">
\emptyparagraph
</div>

For some organizations, the process above is where their journey ends. However, for many other organizations, it's
just the start. OWASP recommends that SBOM creation become an integrated and repeatable process aiming to 
achieve accurate and trustworthy results. The following is an example workflow that illustrates SBOM creation, verification,
and enrichment using multiple tools and techniques.

<div style="page-break-after: always; visibility: hidden">
\emptyparagraph
</div>

![Recommended SBOM Process](images/recommended_sbom_process_lifecycles.svg)

<div style="page-break-after: always; visibility: hidden">
\emptyparagraph
</div>

The benefits of this approach are numerous. It starts with SBOM generation in the build lifecycle. This typically involves
a plugin specific to the build tool used, which often generates the most accurate and complete set of initial results.
Build plugins often rely on manifests that can be manipulated or, in the case of unmanaged dependencies, may not include
all dependent components. 

The verification stage may involve specialized tools that perform different types of analysis against the build artifacts
and compare the findings to the results in the SBOM. If there are deltas, then the resulting SBOM may need to be corrected.

One common scenario where correction often occurs is with modified or forked components. Manifest and binary analysis 
typically falls short in properly identifying modified components. Tools may identify the component as being modified or
the upstream version but generally cannot distinguish what the modifications were, who made them, or for what purpose.
Open source is the ultimate supply chain. Components can and will be modified. Often these modifications are to add new 
features or to backport security fixes. Describing these modifications in the SBOM greatly increases its accuracy and the 
perceived trustworthiness of the SBOM and the vendor who provided it. Tracking modifications is referred to as "pedigree" 
and is covered later in the "Relationships" chapter.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

As the SBOM process evolves, it may become an integrated part of building software. One vision of this type of process
comes from DJ Schleen who proposed the following reference architecture:

![Advanced SBOM Process](images/advanced_sbom_process.pdf)

The content in this architecture is beyond the scope of this guide, but is provided to illustrate what is possible using
freely available open source tools.

## Approaches to Generating CycloneDX SBOMs
There are many approaches to generating SBOMs. Each has its strengths, but all provide value in an SBOM process. Common
approaches are listed below along with the lifecycles they could be executed in.

| Approach         | Lifecycles                   | Description                                                                                                                                                           |
|------------------|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Build Plugin     | Build                        | Specialized tool that integrates directly into native build systems                                                                                                   |
| Software Factory | Pre Build, Build, Post Build | An approach whereby the system that orchestrates builds directly generates SBOMs                                                                                      |
| SCA              | Pre Build, Build, Post Build | Software Composition Analysis, which may inspect manifests in version control pre-build, be integrated into builds, or perform analysis of built artifacts post-build |
| IAST/RASP        | Post Build, Operations       | Specialized tool that often involves instrumentation against running systems                                                                                          |

Each approach may use multiple methods and techniques to identify components and other relevant data. The techniques 
used, the confidence, and call stack reachability can all be described granularly at the component level in CycloneDX. 
Refer to the "Evidence" chapter for more information.

## Generating SBOMs for Source Files
SBOMs may describe individual source files and other digital assets in a directory or version control system. These types
of SBOMs typically include file components, file hashes, and evidence of license and copyright statements. The primary
purpose of this type of BOM is for license compliance and intellectual property use cases. They may also be used
as an OpenChain Compliance Artifact. Oftentimes, license attribution reports can be derived from source SBOMs. Generating
SBOMs from source files typically occur in the "pre build" lifecycle.

## Integrating CycloneDX Into The Build Process
Integrating SBOM generation into the software's build system is the preferred starting point for producing SBOMs for
cybersecurity use cases. Modern build systems rely on package manifests which describe the intent to use specific
dependencies. Examples of manifests include `pom.xml` (Java/Maven), `package-lock.json` (Javascript/npm), and
`requirements.txt` (Python).

There are three primary strategies for producing SBOMs during a build.
* Integration into build lifecycle
* Analyzing build artifacts external to lifecycle
* Software factory

### Build Lifecycle vs. External to Lifecycle
Many build systems have a "lifecycle" that can affect dependency resolution. These lifecycles are often
configurable by the developers and can profoundly affect component inventory and versions. For example, Maven resolves 
dependencies as it progresses through its lifecycle. A Maven build may also include optional profiles, which can alter 
what dependencies are included or excluded from the final deliverable. Analyzing `pom.xml` outside of Mavens' lifecycle 
will typically lead to erroneous results. On the Javascript front, many plugins to npm or web frameworks can dramatically
affect component inventory. For example, many web frontends are optimized using a process called bundling which removes 
unused dependencies and/or functions through a process called "tree-shaking" and aggregates the Javascript into highly 
optimized bundles for efficient delivery to web and mobile browsers. In these scenarios, relying on `package-lock.json`
as the source of truth would lead to an erroneous SBOM containing an inventory of components that are not distributed in 
the final artifact. In the case of software vendors, it is important only to include the components that are distributed 
with the final software. Not doing so may lead to increased and unnecessary support costs.

### Software Factory
Integrating into individual builds, especially a build's lifecycle, has many advantages but generally takes more effort.
Another approach is to target the generation at the software factories themselves. Software factories often comprise
Continuous Integration and Continuous Delivery (CI/CD) systems. Organizations may customize their CI/CD environment to 
optimize software delivery and increase the efficiency of onboarding new software projects. A strategic option for many 
organizations is to reduce the effort necessary to create SBOMs by automating as much as possible. Once configured, 
generating SBOMs from software factories allows organizations to produce SBOMs for many software projects with little to
no effort. GitHub Actions, GitLab Runners, Jenkins libraries, and Circle CI orbs are often used as the foundation for 
many software factories. While this approach can quickly scale across an organization, the accuracy of the SBOMs may be 
impacted as the software factories orchestrate the build tools; they are not directly part of the build systems lifecycle.

## Generating BOMs at Runtime
Analyzing source files or build manifests has some limitations. They do not capture the environment in which the
software is being run, the system dependencies that are used, which are not specified in the source files or manifests, and
will be limited to the inventory of software components. Generating SBOMs at runtime is often achieved through observability
or instrumentation. Examples of platforms capable of runtime generation include:
* Interactive Application Security Testing (IAST)
* Mobile Application Security Testing (MAST)

Generating SBOMs at runtime has many benefits including:
* Capturing the dependencies that are invoked and those which are not
* Capturing system dependencies of the underlying platform or operating system
* Capturing information and configuration about the runtime environment
* Capturing the use and reliance on external services such as those provided via HTTP and MQTT

The platforms capable of runtime generation are often used as part of the software's testing phase and orchestrated by
CI systems. In addition, many IAST platforms also double as RASP (Runtime Application Security Protection) and can
proactively mitigate specific types of attacks automatically.

## Generating BOMs From Evidence (from binaries)
Oftentimes, especially for legacy software, the source or build files may not be available, and runtime instrumentation
may not be possible. In these cases, analyzing the binary artifacts may be necessary. These same approaches may also
be used by security firms specializing in firmware forensics associated with medical, IoT, and other types of devices.

Refer to the "Evidence" chapter for more information.

## Building CycloneDX BOMs Manually
CycloneDX evolved in the era of DevSecOps and has a strong focus on being highly automatable. Most CycloneDX tools
are also focused on automation. However, some ecosystems such as C/C++ continue to mostly rely on unmanaged dependencies
despite the availability of package managers. In these situations, manually managing dependencies often requires manual
SBOM generation. Several tools exist to accomplish this task including [OWASP Dependency-Track](https://dependencytrack.org/). 

## Tracking SBOM Data Provenance with Citations
Accurate attribution is essential for establishing trust, ensuring data provenance, and enabling traceability across 
the software supply chain. The `citations` capability in CycloneDX provides a structured mechanism to reference the 
origin of specific data within a BOM. Whether information is generated by automated tools, verified by individuals, or 
updated during the lifecycle of the BOM, citations allow stakeholders to identify who or what contributed each piece of 
data. This improves auditability, supports compliance verification, and enhances confidence in both manual and automated
SBOM generation processes.

CycloneDX citations support two methods for referencing the location of attributed data within a BOM: 
[JSON Pointers](https://datatracker.ietf.org/doc/html/rfc6901) and [JSONPath](https://datatracker.ietf.org/doc/html/rfc9535) 
expressions. JSON Pointers provide an exact, location-specific reference, while JSONPath expressions allow more flexible, 
query-like targeting across the document structure. This enables citations to precisely or dynamically associate 
attributions with individual fields or sets of data. Additionally, the optional process field allows organizations to 
reference a declared workflow task, providing context for how the cited data was generated, whether by automated 
scanning, manual entry, or a hybrid method. Combined with the attributedTo field, this enables rich provenance chains 
that document not only who contributed data, but how and when it was produced.

```json
"citations": [
  {
    "bom-ref": "citation-1",
    "pointers": [ "/components/0/name" ],
    "timestamp": "2025-05-01T14:00:00Z",
    "attributedTo": "person-1",
    "note": "Manually entered by Alice Example - with `attributedTo`"
  },
  {
    "bom-ref": "citation-2",
    "expressions": [ "$..[?(@.bom-ref=='component-1')].version" ],
    "timestamp": "2025-05-01T14:00:00Z",
    "process": "task-license-scan",
    "note": "Documents the formulation process, not the specific tool within that process."
  },
  {
    "bom-ref": "citation-3",
    "expressions": [ "$.components[*].licenses[*].license.id" ],
    "timestamp": "2025-05-01T14:05:00Z",
    "attributedTo": "scan-tool-1",
    "process": "task-license-scan",
    "note": "Documents both the process and the tool used within a process."
  }
]
```

## Distribution Constraints and Traffic Light Protocol
Communicating sharing restrictions is essential to maintaining legal compliance, operational security, and 
confidentiality. The `distributionConstraints` object in CycloneDX allows organizations to specify conditions under 
which the BOM or its components may be distributed. This includes support for established classification models such as
the [Traffic Light Protocol](https://www.first.org/tlp/) (TLP), which governs information sharing based on sensitivity 
and audience. By encoding distribution constraints directly into the BOM, producers can communicate clear handling 
guidelines to recipients, reducing the risk of data leakage, regulatory violations, or unintended disclosures across 
the supply chain.

| Label            | Description                                                                                                                                            |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| CLEAR            | The information is not subject to any restrictions as regards the sharing.                                                                             |
| GREEN            | The information is subject to limited disclosure, and recipients can share it within their community but not via publicly accessible channels.         |
| AMBER            | The information is subject to limited disclosure, and recipients can only share it on a need-to-know basis within their organization and with clients. |
| AMBER_AND_STRICT | The information is subject to limited disclosure, and recipients can only share it on a need-to-know basis within their organization.                  |
| RED              | The information is subject to restricted distribution to individual recipients only and must not be shared.                                            |
