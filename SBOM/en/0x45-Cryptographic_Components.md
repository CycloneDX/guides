# Introduction to Cryptographic Components

CycloneDX can describe cryptographic assets and their dependencies. Discovering, managing, and reporting on cryptographic
assets is necessary as the first step on the migration journey to quantum-safe systems and applications. Cryptography is
typically buried deep within components that are used to compose and build systems and applications. 

Advances in quantum computing introduce the risk of previously-secure cryptographic algorithms becoming compromised
faster than ever before. In May of 2022, the White House released a [National Security Memorandum](https://www.whitehouse.gov/briefing-room/statements-releases/2022/05/04/national-security-memorandum-on-promoting-united-states-leadership-in-quantum-computing-while-mitigating-risks-to-vulnerable-cryptographic-systems/)
outlining the government’s plan to secure critical systems against potential quantum threats. This memorandum contains
two key takeaways for both agency and commercial software providers: document the potential impact of a breach, and have
an alternative cryptography solution ready.

As cryptographic systems evolve from using classical primitives to quantum-safe primitives, there is expected to be more
widespread use of cryptographic agility, or the ability to quickly switch between multiple cryptographic primitives.
Cryptographic agility serves as a security measure or incident response mechanism when a system’s cryptographic
primitive is discovered to be vulnerable or no longer complies with policies and regulations.

As part of an agile cryptographic approach, organizations should seek to understand what cryptographic assets they are
using and facilitate the assessment of the risk posture to provide a starting point for mitigation.


### Algorithm Example
A cryptographic algorithm is added in the components array of the BOM. The examples below list the algorithm
AES-128-GCM.

```json
"components": [
  {
    "type": "cryptographic-asset",
    "name": "AES-128-GCM",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "primitive": "ae",
        "parameterSetIdentifier": "128",
        "mode": "gcm",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "keygen", "encrypt", "decrypt", "tag" ],
        "classicalSecurityLevel": 128,
        "nistQuantumSecurityLevel": 1
      },
      "oid": "2.16.840.1.101.3.4.1.6"
    }
  }
]
```

Organizations should consider including cryptographic assets in their SBOMs and optionally producing a BOM specific for
cryptographic material, otherwise known as a Cryptographic Bill of Material (CBOM).

Refer to the [Authoritative Guide to CBOM](https://cyclonedx.org/guides/) for in-depth information about leveraging
CycloneDX for cryptographic use cases.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>