# Appendix D: Glossary and References

## Glossary

**Abuse case.** The security counterpart of a use case: a misuse scenario with an abuser, preconditions, detection opportunities, and mitigations.

**Assessment.** A point-in-time or continuous evaluation recording assessors, scope, the risks evaluated, conclusions, and assumptions.

**Asset.** A node in a blueprint, referencing a component, service, or party, or declared inline with a type and name.

**Attack path.** An ordered sequence of steps expressing progression and lateral movement, each optionally naming a technique, kill-chain phase, and boundary crossed.

**Attack tree.** A goal decomposed into AND/OR subgoals as a flat node list with a root.

**Behavior instance.** One behavior coded against the taxonomy, with an acknowledgment of declared, observed, or both.

**Blueprint.** The architectural substrate: assets, zones, boundaries, flows, and relationships, declared as one or more model types.

**BOM-Link.** A URN referencing an element in another document by serial number, version, and bom-ref.

**Business objective.** A declared organizational goal that use cases, threats, and risks can reference.

**Control.** A safeguard instance, with a category, implementation status, effectiveness, what it applies to, and what it satisfies.

**Design and assurance models.** The collective name for the branch capability set: blueprints, behaviors, use cases, requirements, business objectives, threats, weaknesses, risks, controls, and profiles.

**Detection rule.** The rule, policy, or query that produced a finding, identified and versioned and bound to its ruleset so the finding can be reproduced.

**Exploit maturity.** The state of exploitation observed for a vulnerability in the wild, from unreported through active, independent of any one subject.

**Exploitability level.** The graduated degree to which evidence substantiates that a vulnerability can be exploited in a specific subject, from component-present to exploited.

**Predefined-or-custom.** The pattern offering a curated enumeration or a custom object with a name and description, with no `other` value.

**Presence evidence.** A single attributable determination that a vulnerability is present, absent, or exploitable in a subject, with its confidence, methods, and attribution.

**Profile.** A reusable characterization (data profile, threat profile) held in the profile registry, separating characterization from identity.

**Risk appetite.** The amount of risk a party will accept, expressed overall and per domain.

**Risk rating.** A likelihood, impact, and score, expressed as inherent, residual, and target.

**Supporting data.** Labeled material that records or reproduces evidence, typed, classified, redactable, and linkable to the determination it corroborates.

**Threat.** A documented account of what can go wrong, independent of any adversary or occurrence.

**Threat scenario.** A realization of one or more threats by an actor, adding motivation, intent, access, and a rating.

**Trust boundary.** A threat-model annotation over a blueprint boundary, adding the trust differential and the threats and controls there.

**Use case.** In prose, a job to be done (a scenario). As a construct, the `useCase` object declaring intended use.

**Vulnerability Advisory Report (VAR).** The newer NIST name for the disclosure artifact, defined by way of ISO/IEC 29147 as a publication describing a vulnerability with a focus on remediation and mitigation.

**Vulnerability Disclosure Report (VDR).** An assertion of the vulnerabilities affecting a product and its dependencies, known and previously unknown, with the impact analysis behind each.

**Vulnerability Exploitability eXchange (VEX).** A negative assertion stating which known vulnerabilities a product is not affected by, with the justification for each verdict.

**Weakness.** A shared classification: a CWE identifier or a named weakness, never both.

## References

- CycloneDX project and schema: https://cyclonedx.org/
- Specification repository: https://github.com/CycloneDX/specification
- ECMA-424 (CycloneDX): https://ecma-international.org/publications-and-standards/standards/ecma-424/
- Ecma TC54: https://tc54.org/
- Threat model capabilities (issue #462), Blueprints (issue #463), Usage context and behaviors (issue #670), 2.0 umbrella (issue #631)
- Threat Modeling Manifesto: https://www.threatmodelingmanifesto.org/
- NIST SP 800-161r1-upd1, Cybersecurity Supply Chain Risk Management Practices for Systems and Organizations (defines the VDR and, as of the November 2024 update, the VAR): https://csrc.nist.gov/pubs/sp/800/161/r1/upd1/final
- ISO/IEC 29147:2018, Information technology, Security techniques, Vulnerability disclosure: https://www.iso.org/standard/72311.html
- CISA, Minimum Requirements for Vulnerability Exploitability eXchange (VEX): https://www.cisa.gov/resources-tools/resources/minimum-requirements-vulnerability-exploitability-exchange-vex
- OWASP Threat Model Library: https://github.com/OWASP/threat-model-library
- Companion guides in the series: Authoritative Guide to SBOM, Authoritative Guide to Attestations, and the CycloneDX 2.0 foundation documentation
- Blueprints use cases and requirements (community working document, OWASP CycloneDX and Ecma TC54)
- How Karambit.AI and Microsoft bring software authenticity to 14 billion files per month, Microsoft Security Blog, 2026: https://techcommunity.microsoft.com/blog/microsoft-security-blog/how-karambit-ai-and-microsoft-bring-software-authenticity-to-14-billion-files-pe/4528606
