# Generating CycloneDX BOMs
There are many ways to generate BOMs, each method having various trade-offs. CycloneDX recommends organizations 
establish a process around BOM generation that aligns with the needs of the business and that of the BOM consumer. 
In practice, BOM generation is a process, not a one-time event. As organizations mature their BOM efforts and 
consumers expect increased accuracy and expanded data, having an established process that can accommodate multiple 
generation methods along with the ability to augment and correct BOM data throughout the generation process, will 
provide strategic advantages.

The following is an example workflow that illustrates BOM creation and enrichment using multiple tools and techniques.
TODO - Insert flowchart

## Different Methods of Generating CycloneDX SBOMs
TODO - Lifecycle

### Generating SBOMs for Source Files
SBOMs may describe individual source files and other digital assets in a directory or version control system. These types
of SBOMs typically include file components, file hashes, and evidence of license and copyright statements. The primary
purpose of this type of BOM is for license compliance and intellectual property use cases. They may also be used
as an OpenChain Compliance Artifact. Oftentimes, license attribution reports can be derived from source SBOMs.


## Using CycloneDX Plugins and Integrations
TODO

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

TODO: pros/cons of generating lifecycle vs external

### Software Factory
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

## Generating BOMs at Runtime
Analyzing source files or build manifests has some limitations in that they do not capture the environment in which the
software is being run, the system dependencies that are used which are not specified in the source files or manifests, and
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

## Generating BOMs at Deploy
TODO: what was I thinking here?

## Generating BOMs From Evidence (from binaries)
Oftentimes, especially for legacy software, the source or build files may not be available, and runtime instrumentation
may not be possible. In these cases, analyzing the binary artifacts may be necessary. These same approaches may also
be used by security firms specializing in firmware forensics associated with medical, IoT, and other types of devices.

TODO: reach out to IWG for guidance...

## Building CycloneDX BOMs From Scratch
TODO

## Best Practices for Generating Accurate and Useful CycloneDX BOMs
TODO

TODO - Get SBOM with "enrichment" slide from DJ.


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>