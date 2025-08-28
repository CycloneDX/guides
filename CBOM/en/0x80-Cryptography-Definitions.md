# Cryptography Definitions
CycloneDX provides a list of cryptographic algorithms definitions for use in a CBOM. It defines and organizes cryptographic algorithms by their primitive types—such as digital signatures, hash functions, symmetric encryption, and public-key encryption.

Each section corresponds to a specific cryptographic primitive and groups algorithms by family. Within each family, algorithm variants are described using patterns that capture key characteristics such as parameter sets, modes of operation, or key lengths.
These definitions supports consistent identification, classification, and reporting of cryptographic algorithms in a CBOM.

## Definition structure

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

## Example

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
