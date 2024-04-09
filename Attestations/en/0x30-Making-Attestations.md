# Making Attestations
CycloneDX Attestations (CDXA) represent a automated approach to enhancing security and compliance across various 
standards. CycloneDX facilitates the representation of any standard—whether security-focused or otherwise—along with 
the specific requirements associated with that standard. This capability ensures a broad applicability across different
domains and compliance needs.

Building upon this foundational support, CycloneDX further empowers organizations by enabling them to make formal 
attestations against these defined standards and requirements. These attestations are comprised of claims that are 
supported by concrete evidence, providing a robust mechanism for demonstrating compliance or security posture. 
Importantly, CycloneDX acknowledges the complexity of real-world scenarios by also accommodating counter-claims and 
counter-evidence, thus fostering a comprehensive and nuanced view of compliance and security assessments.

In instances where a requirement is not being fully met, CycloneDX's versatile framework allows for the specification of
mitigation strategies. This feature ensures that organizations can transparently communicate their efforts to address 
potential shortcomings, thereby maintaining trust and integrity in the face of compliance challenges. Through these 
capabilities, CycloneDX Attestations serve as a powerful tool for organizations striving to navigate the complex 
compliance landscape with confidence and clarity.

## Claims
Claims serve as the medium through which organizations can articulate their argument for meeting a specific requirement. You can dissect the requirement into a series of claims that address some part of the overall requirement. There are numerous ways to structure your claims, but it's important to remember that the simplest and most straightforward arguments often prove to be the most effective.

For example, you may want to create a claim about each major module in a complex system. Or you might make claims about several separate aspects of a security defense. Sometimes, a single claim is enough to cover the entire requirement.

A `Claim` is simply a statement that captures at least one aspect of how a certain requirement has been satisfied. A claim has two key parts: a target and a predicate. Claims often restate the requirement using specific terms related to the defenses in the system.

* `Target:` Each claim has a `target` that is the subject of the claim. The target might be the specific name of an entire system, a module, a process, a team, a business unit, or a company. In many cases, the target is simply an interpretation of the requirement for the current attestation. For example, the target might be "Acme Corporation" or "The Mxyzptlk Module."

* `Predicate:` Each claim also has a `predicate` that states what is being claimed about the target. Once again, this is often a specific interpretation of the requirement that details exactly what was done to meet the requirement. For example,

The following table details the makeup of a claim.

| Property             | Description                                                                                                                                                                                        |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| bom-ref              | An identifier, unique to the CDXA document, that identifies the claim.                                                                                                                             |
| target               | The bom-ref to a target representing a specific system, application, API, module, team, person, process, business unit, company, etc... that this claim is being applied to.                       |
| predicate            | The specific statement or assertion about the target.                                                                                                                                              |
| mitigationStrategies | The list of bom-ref to the evidence provided describing the mitigation strategies. Each mitigation strategy should include an explanation of how any weaknesses in the evidence will be mitigated. |
| reasoning            | The written explanation of why the evidence provided substantiates the claim.                                                                                                                      |
| evidence             | The list of bom-ref to evidence that supports this claim.                                                                                                                                          |
| counterEvidence      | The list of bom-ref to counterEvidence that supports this claim.                                                                                                                                   |


<div style="page-break-after: always; visibility: hidden">
\emptyparagraph
</div>

For example, consider the requirement, "All developers must receive security training." An appropriate claim might be that "All members of the Acme development team have taken the HackMe Secure Coding for Java training course and received a passing grade on the final test." The target is "All members of the Acme development team," and the predicate is "have taken the HackMe Secure Coding for Java training course and received a passing grade on the final test."

```json
"claims": [
  {
    "bom-ref": "claim-1",
    "target": "acme-inc",
    "predicate": "Developers have taken the HackMe Secure Coding for Java training course and received a passing grade on the final test.",
    "mitigationStrategies": [ "mitigationStrategy-1" ],
    "reasoning": "The provided evidence shows that 70% of developers have been trained this year.",
    "evidence": [ "evidence-1" ],
    "counterEvidence": [ "counterEvidence-1" ],
    "signature": {
      "algorithm": "ES256",
      "certificatePath": [ "MIIB...", "MIID..." ],
      "value": "tqIT..."
    }
  }
]
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
