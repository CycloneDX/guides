# License Compliance
CycloneDX can be used for open-source and commercial license compliance. By leveraging the licensing capabilities of
CycloneDX, organizations can identify any licenses that may be incompatible or require specific compliance obligations,
such as attribution or sharing of source code.

## Open Source Licensing
The following is an example of a components license. CycloneDX communicates this information using the SPDX license IDs
along with optionally including a Base64 encoded representation of the full license text.

```json
"licenses": [
  {
    "license": {
      "id": "Apache-2.0",
      "acknowledgement": "declared",
      "text": {
        "contentType": "text/plain",
        "encoding": "base64",
        "content": "RW5jb2RlZCBsaWNlbnNlIHRleHQgZ29lcyBoZXJlLg=="
      },
      "url": "https://www.apache.org/licenses/LICENSE-2.0.txt"
    }
  }
]
```

SPDX license expressions are also fully supported.

```json
"licenses": [
  {
    "expression": "(LGPL-2.1 OR BSD-3-Clause AND MIT)",
    "acknowledgement": "declared"
  }
]
```

## Declared and Concluded Licenses
Declared licenses and concluded licenses represent two different stages in the licensing process within software
development. Declared licenses refer to the initial intention of the software authors regarding the licensing terms
under which their code is released. On the other hand, concluded licenses are the result of a comprehensive analysis
of the project's codebase to identify and confirm the actual licenses of the components used, which may differ from
the initially declared licenses. While declared licenses provide an upfront indication of the licensing intentions,
concluded licenses offer a more thorough understanding of the actual licensing within a project, facilitating proper
compliance and risk management.

| Acknowledgement | Description                                                                                                |
|-----------------|------------------------------------------------------------------------------------------------------------|
| declared        | Declared licenses represent the initial intentions of authors regarding the licensing terms of their code. |
| concluded       | Concluded licenses are verified and confirmed.                                                             |


## Using Evidence To Substantiate Concluded Licenses and Track Copyrights
In addition to asserting the declared or concluded license(s) of a component, CycloneDX also supports evidence of other 
licenses and copyrights found in a given component. These licenses are "observed" in the course of analyzing a
software project and form the necessary evidence to substantiate a "concluded" license. For example:

```json
"evidence": {
  "licenses": [
    { "license": { "id": "Apache-2.0" } },
    { "license": { "id": "LGPL-2.1-only" } }
  ],
  "copyright": [
    { "text": "Copyright 2012 Acme Inc. All Rights Reserved." },
    { "text": "Copyright (C) 2004,2005 University of Example" }
  ]
}
```
Refer to the "Evidence" chapter for more information.


## Commercial Licensing
CycloneDX can also help organizations manage their commercial software licenses by providing a clear understanding of
what licenses are in use and which ones require renewal or additional purchases, which may impact the operational aspects
of applications or systems. By leveraging CycloneDX for commercial license compliance, organizations can reduce the risks
associated with license violations, enhance their license management practices, and align their SBOM practice with
Software Asset Management (SAM) and IT Asset Management (ITAM) systems for enterprise visibility.

The following example illustrates a commercial license for a given component.

```json
"licenses": [
  {
    "license": {
      "name": "Acme Commercial License",
      "licensing": {
        "licensor": {
          "organization": { "name": "Acme Inc" }
        },
        "licensee": {
          "organization": { "name": "Example Co." }
        },
        "purchaser": {
          "individual": {
            "name": "Samantha Wright",
            "email": "samantha.wright@gmail.com",
            "phone": "800-555-1212"
          }
        },
        "purchaseOrder": "PO-12345",
        "licenseTypes": [ "appliance" ],
        "lastRenewal": "2022-04-13T20:20:39+00:00",
        "expiration": "2023-04-13T20:20:39+00:00"
      }
    }
  }
]
```

All commercial license fields are optional. The licensor, licensee, and purchaser may be an organization or individual.
Multiple license types may be specified and include:

| **License Type** | **Description**                                                                                                                                                   |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| academic         | A license that grants use of software solely for the purpose of education or research.                                                                            |
| appliance        | A license covering use of software embedded in a specific piece of hardware.                                                                                      |
| client-access    | A Client Access License (CAL) allows client computers to access services provided by server software.                                                             |
| concurrent-user  | A Concurrent User license (aka floating license) limits the number of licenses for a software application and licenses are shared among a larger number of users. |
| core-points      | A license where the core of a computer's processor is assigned a specific number of points.                                                                       |
| custom-metric    | A license for which consumption is measured by non-standard metrics.                                                                                              |
| device           | A license that covers a defined number of installations on computers and other types of devices.                                                                  |
| evaluation       | A license that grants permission to install and use software for trial purposes.                                                                                  |
| named-user       | A license that grants access to the software to one or more pre-defined users.                                                                                    |
| node-locked      | A license that grants access to the software on one or more pre-defined computers or devices.                                                                     |
| oem              | An Original Equipment Manufacturer license that is delivered with hardware, cannot be transferred to other hardware, and is valid for the life of the hardware.   |
| perpetual        | A license where the software is sold on a one-time basis and the licensee can use a copy of the software indefinitely.                                            |
| processor-points | A license where each installation consumes points per processor.                                                                                                  |
| subscription     | A license where the licensee pays a fee to use the software or service.                                                                                           |
| user             | A license that grants access to the software or service by a specified number of users.                                                                           |
| other            | Another license type.                                                                                                                                             |


Solutions supporting the Software Development Life Cycle (SDLC) typically involve open-source license compliance or
intellectual property use cases. Whereas Software Asset Management (SAM) is primarily concerned with commercial license
and procurement use cases. OWASP CycloneDX has extensive support for both and can be applied to any component or service
within a BOM.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
