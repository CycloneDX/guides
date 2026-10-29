# Cryptography Definitions
CycloneDX provides a list of cryptographic algorithms definitions for use in a CBOM. It defines and organizes cryptographic algorithms by their primitive types—such as digital signatures, hash functions, symmetric encryption, and public-key encryption.

Each section corresponds to a specific cryptographic primitive and groups algorithms by family. Within each family, algorithm variants are described using patterns that capture key characteristics such as parameter sets, modes of operation, or key lengths.
These definitions supports consistent identification, classification, and reporting of cryptographic algorithms in a CBOM.

## Algorithm Family Definition Structure

The format for each algorithm entry is:
```text
AlgorithmFamily: Pattern[-{optionalParameter}]
```

Where:

- `AlgorithmFamily` identifies the algorithm family.
- `Pattern` describes how to construct an algorithm name.
- `{name}` is a placeholder for an algorithm-specific value.
- `[ ... ]` marks optional content, including any separators inside the brackets.
- `( ... )` groups content. A group without alternatives or repetition contributes its content once.
- `|` separates alternatives, exactly one of which is selected, either across the whole pattern or within a group. For example, `(SHA256|SHAKE)` selects `SHA256` or `SHAKE`.
- `( ... )+` repeats the grouped content one or more times.
- `<Name>` references another variant's naming pattern, as described below.

Braces, brackets, parentheses, angle brackets, `|`, and a `+` immediately
following `)` are notation rather than characters in the constructed name.
Other characters are literal, including `-`, `_`, `/`, and the `+` in
`SPAKE2+`. This notation is not a regular expression.

### Pattern references

`<Name>` identifies the variant pattern whose initial literal text, before
its first notation construct, is `Name`. For example, `<LMS>` references
the pattern beginning `LMS[`, not the entire LMS algorithm family.

Each reference shall resolve to exactly one variant pattern. References
shall not form cycles. A reference expands to a name constructed using
the referenced pattern, including its optional-content rules.

### Optional content and partial identification

Omitting an optional parameter leaves that parameter unspecified. A name
can therefore identify an algorithm partially without specifying its
complete parameter configuration.

An optional fixed literal has a different meaning: its absence selects
the form without that literal. For example, omitting `[-PKCS7]` selects
the form without the `-PKCS7` suffix.

### LMS, LMOTS, and HSS

In the LMS pattern, `{bytesPerNode}` is measured in bytes. In the LMOTS
pattern, `{hashOutputLength}` is the hash output length in bytes.

HSS uses the following pattern:

~~~text
HSS[_L{levels}][(_<LMS>_<LMOTS>)+]
~~~

Each repeated group describes one level using an LMS name followed by
an LMOTS name. Levels are listed starting at the root and proceeding
downward.

When both `{levels}` and the repeated pairs are present, the number of
pairs shall equal `{levels}`. Omitting the pairs leaves the per-level
parameters unspecified. Parameters omitted from a pair are unspecified
and are not inherited from another pair.

Examples:

- `HSS_L2` identifies two levels without specifying their parameter sets.
- `HSS_LMS_LMOTS` lists one pair with its algorithm parameters unspecified.
- `HSS_L2_LMS_LMOTS_LMS_LMOTS` explicitly lists two pairs with their algorithm parameters unspecified.

These examples illustrate naming syntax and partial identification;
they do not establish that a parameter configuration satisfies a
particular cryptographic standard or profile.

### RSA naming example

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
