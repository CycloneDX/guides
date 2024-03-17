# Making Attestations
TODO

## Claims
Claims are the way organizations can articulate their argument for meeting a particular requirement. You can break the requirement down into a set of claims that tackle some part of the overall requirement. There are many ways to structure your claims, but generally the simplest and most straightforward arguments are best.

For example, you may want to create a claim about each major module in a complex system. Or you might make claims about several separate aspects of a security defense. In some cases, a single claim is enough to cover the entire requirement.

A `Claim` is simply a statement that captures at least one aspect of how a certain requirement has been satisfied. A claim has two key parts, a target and a predicate. Claims often restate the requirement using specific terms related to the defenses in the system.

* `Target:` Each claim has a `target` that is the subject of the claim. The target might be the specific name of entire system, a module, a process, a team, a business unit, or an entire company. In many cases, the target is simply an interpretation of the requirement for the current attestation. For example, the specifi might be "Acme Corporation" or "The Mxyzptlk Module."

* `Predicate:` Each claim also has a `predicate` that states what is being claimed about the target. Once again, this is often a specific interpretation of the requirement that details exactly what was done to meet the requirement.  For example,

For example, consider the requirement, "All developers must receive security training." An appropriate claim might be that "All members of the Acme development team have taken the HackMe Secure Coding for Java training course and received a passing grade on the final test." The target is "All members of the Acme development team" and the predicate is "have taken the HackMe Secure Coding for Java training course and received a passing grade on the final test."

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