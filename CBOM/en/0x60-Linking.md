# Decoupling CBOM From SBOM With BOM-Link
With CycloneDX, it is possible to reference a BOM, or a component, service, or vulnerability inside a BOM from other 
systems or other BOMs. This deep-linking capability is referred to as BOM-Link and is a
[formally registered URN](https://www.iana.org/assignments/urn-formal/cdx), governed by [IANA](https://www.iana.org),
and compliant with [RFC-8141](https://www.rfc-editor.org/rfc/rfc8141.html). 

**Syntax**:
```ini
urn:cdx:serialNumber/version#bom-ref
```

**Examples**:
```ini
urn:cdx:f08a6ccd-4dce-4759-bd84-c626675d60a7/1
urn:cdx:f08a6ccd-4dce-4759-bd84-c626675d60a7/1#componentA
```

| Field        | Description                                                                       |
| ------------ | --------------------------------------------------------------------------------- |
| serialNumber | The unique serial number of the BOM. The serial number MUST conform to RFC-4122.  |
| version      | The version of the BOM. The default version is `1`.                               |
| bom-ref      | The unique identifier of the component, service, or vulnerability within the BOM. |

There are many use cases that BOM-Link supports. Two common scenarios are:
* Reference one BOM from another BOM
* Reference a specific component or service in one BOM from another BOM

### Linking an SBOM to a CBOM
In CycloneDX, external references point to resources outside the object they're associated with and may be
external to the BOM, or may refer to resources within the BOM. External references can be applied to individual
components, services, or to the BOM itself. 

The following example illustrates how an application in an SBOM can reference an external CBOM:

```json
"components": [
  {
    "type": "application",
    "name": "Acme Application",
    "version": "1.0.0",
    "externalReferences": [
      {
        "type": "bom",
        "url": "https://example.com/bom/acme-application-1.0.0-cbom.cdx.json",
        "hashes": [ {
            "alg": "SHA-256",
            "content": "708f1f53b41f11f02d12a11b1a38d2905d47b099afc71a0f1124ef8582ec7313"
        } ]
      }
    ]
  }
]
```
