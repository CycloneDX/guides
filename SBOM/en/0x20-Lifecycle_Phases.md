# Lifecycle Phases
The Software Development Life Cycle (SDLC) is a process that outlines the phases involved in software development from
conception to deployment and maintenance. It typically includes planning, analysis, design, implementation, testing,
deployment, and maintenance, and each phase has its own set of activities and deliverables. The purpose of the SDLC is
to provide a structured and systematic approach to software development that ensures the final product meets customer's
requirements, is of high quality, is delivered on time and within budget, and can be maintained and supported throughout
its lifecycle.

Lifecycle phases are supported by CycloneDX and communicate the points in which data in the BOM was captured. This
support extends beyond software to capture hardware, IoT, and cloud-native use cases.

Different types of data may be available at various phases of a lifecycle and thus a BOM may include data specific or
only obtainable in a given lifecycle. Incorporating lifecycle phases in a CycloneDX BOM provides additional context
of when and how the BOM was created. It becomes an additional datapoint that may be useful in the overall analysis of
the BOM.

CycloneDX defines the following phases:

| **Phase**    | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                         |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Design       | BOM produced early in the development lifecycle containing inventory of components and services that are proposed or planned to be used. The inventory may need to be procured, retrieved, or resourced prior to use.                                                                                                                                                                                                                   |
| Pre-build    | BOM consisting of information obtained prior to a build process and may contain source files and development artifacts and manifests. The inventory may need to be resolved and retrieved prior to use.                                                                                                                                                                                                                                 |
| Build        | BOM consisting of information obtained during a build process where component inventory is available for use. The precise versions of resolved components are usually available at this time as well as the provenance of where the components were retried from.                                                                                                                                                                       |
| Post-build   | BOM consisting of information obtained after a build process has completed and the resulting components(s) are available for further analysis. Built components may exist as the result of a CI/CD process, may have been installed or deployed to a system or device, and may need to be retrieved or extracted from the system or device.                                                                                             |
| Operations   | BOM produced that represents inventory that is running and operational. This may include staging or production environments, and will generally encompass multiple SBOMs describing the applications and operating system, along with HBOMs describing the hardware that make up the system. Operations Bill of Materials (OBOM) can provide full-stack inventory of runtime environments, configurations, and additional dependencies. |
| Discovery    | BOM consisting of information observed through network discovery providing point-in-time enumeration of embedded, on-premise, and cloud native services such as server applications, connected devices, microservices, and serverless functions.                                                                                                                                                                                        |
| Decommission | BOM containing inventory that will be, or has been retired from operations.                                                                                                                                                                                                                                                                                                                                                             |

In additional, CycloneDX provides a mechanism to supply user-defined lifecycle phases as well.

In IT governance, Software Asset Management (SAM) is a set of processes, policies, and procedures that help organizations
manage and optimize their software assets throughout their lifecycle. SAM involves the identification, acquisition,
deployment, maintenance, utilization, and disposal of software assets to ensure compliance with licensing agreements,
mitigate risks associated with software usage, and optimize costs.

Lifecycle phases in CycloneDX compliment both SDLC and SAM processes.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>