# Cryptography Definitions
CycloneDX provides a list of cryptographic algorithms definitions for use in a CBOM. It defines and organizes cryptographic algorithms by their primitive types—such as digital signatures, hash functions, symmetric encryption, and public-key encryption.

Each section corresponds to a specific cryptographic primitive and groups algorithms by family. Within each family, algorithm variants are described using patterns that capture key characteristics such as parameter sets, modes of operation, or key lengths.
These definitions supports consistent identification, classification, and reporting of cryptographic algorithms in a CBOM.

## Algorithm Family Definition Structure

The format for each algorithm entry is:
```
AlgorithmFamily: Pattern[-{optionalParameter}]
```

Where:
- `AlgorithmFamily` is the algorithm family
- `Pattern` shows how the algorithm should be referenced
- Elements in `[]` are optional parameters
- Elements in `()` indicate choices
- The `|` symbol indicates alternative choices
- Elements in `{}` indicate placeholders

### Example

The following example defines the RSASSA-PKCS1 algorithm family, a signature scheme that may be used with different digest (hash) algorithms and key sizes. It is standardized in RFC 8017 and in IEEE 1363.

```json
"algorithms": [
    {
      "family": "RSASSA-PKCS1",
      "standard": [
        {"name": "RFC8017", "url": "https://doi.org/10.17487/RFC8017"},
        {"name": "IEEE1363", "url": "https://doi.org/10.1109/IEEESTD.2000.92290"}
      ],
      "variant": [
        {
          "pattern": "RSA-PKCS1-1.5[-{digestAlgorithm}][-{keyLength}]",
          "primitive": "signature"
        }
      ]
    }
]
```

A cryptographic asset can reference the pattern in the component `name`. The following example defines RSASSA-PKCS1 using SHA-256 and a 2048 bit key length.

```json
"components": [
    {
      "type": "cryptographic-asset",
      "bom-ref": "asset-1",
      "name": "RSA-PKCS1-1.5-SHA-256-2048",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "primitive": "signature",
          "algorithmFamily": "RSASSA-PKCS1",
        }
      }
    }
]
```

## Elliptic Curve Definitions

The cryptography definitions also define a list of elliptic curves. The definitions include the standardization body (e.g., NIST), a description, Object Identifier (OID), form (e.g., Weierstrass). Since the same elliptic curve might be standardized by different bodies under different names, the curve also contains aliases. The source data is obtained from [neuromancer.sk](https://neuromancer.sk/std).

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

### Elliptic Curve Example

The following example defines the P-256 NIST curve, along with its aliases secp256r1 and prime256v1.

```json
"ellipticCurves": [
    {
      "name": "nist",
      "description": "RECOMMENDED ELLIPTIC CURVES FOR FEDERAL GOVERNMENT USE  July 1999",
      "curves": [
        {
          "name": "P-256",
          "description": null,
          "oid": "1.2.840.10045.3.1.7",
          "form": "Weierstrass",
          "aliases": [
            {
              "category": "secg",
              "name": "secp256r1"
            },
            {
              "category": "x962",
              "name": "prime256v1"
            }
          ]
        }
      ]
    }
]
```

All elliptic curves are defined in the enum `cryptography-defs.schema.json#/definitions/algorithmFamiliesEnum`.

A cryptographic asset can reference an elliptic curve with the `ellipticCurve` property.
