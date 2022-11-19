# Linking BOMs with BOM-Link
With CycloneDX, it is possible to reference a component, service, or vulnerability inside a BOM from other systems or
other BOMs. This deep-linking capability is referred to as BOM-Link and is a
[formally registered URN](https://www.iana.org/assignments/urn-formal/cdx), governed by [IANA](https://www.iana.org),
and compliant with [RFC-8141](https://www.rfc-editor.org/rfc/rfc8141.html).

**Syntax**:
```
urn:cdx:serialNumber/version#bom-ref
```

**Examples**:
```
urn:cdx:f08a6ccd-4dce-4759-bd84-c626675d60a7/1
urn:cdx:f08a6ccd-4dce-4759-bd84-c626675d60a7/1#componentA
```

| Field        | Description                                                                       |
| ------------ | --------------------------------------------------------------------------------- |
| serialNumber | The unique serial number of the BOM. The serial number MUST conform to RFC-4122.  |
| version      | The version of the BOM. The default version is `1`.                               |
| bom-ref      | The unique identifier of the component, service, or vulnerability within the BOM. |

There are many use cases that BOM-Link supports. Two common scenarios are to:
* Reference one BOM from another BOM
* Reference a specific component or service in one BOM from another BOM

## Linking to External BOMs
External references provide a way to document systems, sites, and information that may be relevant but which are not
included with the BOM. External references can be applied to individual components, services, or to the BOM itself.
One external reference type is `bom` which can point to a URL of where the BOM is located, or BOM-Link URI that
references the precise serial number and version of the BOM.

```json
"externalReferences": [
  {
    "type": "bom",
    "url": "urn:cdx:bdd819e6-ee8f-42d7-a4d0-166ff44d51e8/5",
    "comment": "Refers to version 5 of a specific BOM. Integrity verification should be performed to ensure the BOM has not been tampered with.",
    "hashes": [
      {
        "alg": "SHA-512",
        "content": "45c6e3d03ec4207234e926063c484446d8b55f4bfce3f929f44cbc2320565290cc4b71de70c1d983792c6d63504f47f6b94513d09847dbae69c8f7cdd51ce980"
      }
    ]
  }
]
```

## Linking External VEX to BOM Inventory
Vulnerability Exploitability eXchange (VEX) is core capability of CycloneDX that can convey the exploitability of 
vulnerable components in the context of the product in which they're used. VEX information may be very dynamic and
subject to change while the product's SBOM will typically remain static until such time the inventory changes.
Therefore, it is recommended to decouple the VEX from the BOM. This allows VEX information to be updated without having 
to create and track additional BOMs.

In the following example, a vulnerability is identified in a component called Jackson Databind, and the VEX provides a
direct link to the precise component within a BOM.

```json
"vulnerabilities": [
  {
    "id": "CVE-2018-7489",
    "source": {
      "name": "NVD",
      "url": "https://nvd.nist.gov/vuln/detail/CVE-2019-9997"
    },
    "analysis": {
      "state": "not_affected",
      "justification": "code_not_reachable",
      "response": ["will_not_fix", "update"],
      "detail": "An optional explanation of why the application is not affected by the vulnerable component."
    },
    "affects": [
      {
        "ref": "urn:cdx:3e671687-395b-41f5-a30f-a58921a69b79/1#jackson-databind-2.8.0"
      }
    ]
  }
]
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>