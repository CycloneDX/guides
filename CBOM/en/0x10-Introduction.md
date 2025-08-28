# Introduction

A Cryptography Bill of Materials (CBOM) is an object model to describe cryptographic assets and their dependencies.
Support for CBOM is included in CycloneDX v1.6 and higher. Discovering, managing, and reporting on cryptographic assets
is necessary as the first step on the migration journey to quantum-safe systems and applications. Cryptography is
typically buried deep within components that are used to compose and build systems and applications. It makes sense to
minimize this effort through alignment and reuse of concepts and components used to implement the Software Supply Chain
Security (SSCS).

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
using and facilitate the assessment of the risk posture to provide a starting point for mitigation. CycloneDX designed 
CBOM for this purpose.

## CBOM Design
The overall design goal of CBOM is to provide an abstraction that allows modeling and representing cryptographic assets
in a structured object format. This comprises the following points.

1. Modelling cryptographic assets
   Cryptographic assets occur in several forms. Algorithms and protocols are most commonly implemented in specialized cryptographic libraries. They may, however, also be 'hardcoded' in software components. Certificates and related cryptographic material like keys, tokens, secrets, or passwords are other cryptographic assets to be modeled.

2. Capturing cryptographic asset properties
   Cryptographic assets have properties that uniquely define them and that make them actionable for further reasoning. For example, it makes a difference if one knows the algorithm family (e.g. AES) or the specific variant or instantiation (e.g. AES-128-GCM). This is because the security level and the algorithm primitive (authenticated encryption) are only defined by the definition of the algorithm variant. The presence of a weak cryptographic algorithm like SHA1 vs. HMAC-SHA1 also makes a difference. Therefore, the goal of CBOM is to capture relevant cryptographic asset properties.

3. Capturing crypto asset dependencies
   To understand the impact of a cryptographic asset, it is important to capture its dependencies. Cryptographic libraries 'implement' certain algorithms and protocols, but their implementation alone does not reflect their usage by applications. CBOM, therefore, differentiates between 'provides' and 'uses' dependencies. It is possible to model algorithms or protocols that use other algorithms (e.g., TLS 1.3 uses ECDH/secp256r1), libraries that implement algorithms, and applications that 'use' algorithms from a library.

4. Applicability to various software components
   CycloneDX supports various components such as applications, frameworks, libraries, containers, operating systems, devices, firmware, and files. CBOM extends this model and can communicate a component's dependency on cryptographic assets.

5. High compatibility to CycloneDX SBOM and related tooling
   CBOM is native to the CycloneDX standard. It integrates cryptographic assets as an additional component type in the CycloneDX schema and further extends dependencies with the ability to specify dependency usage and implementation details. CBOM data can be present in existing xBOMs or externalized into dedicated CBOMs, thus creating modularity, which may optionally have varying authentication and authorization requirements.

6. Enable automatic reasoning
   CBOM enables tooling to reason about cryptographic assets and their dependencies automatically. This allows checking for compliance with policies that apply to cryptographic use and implementation.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

