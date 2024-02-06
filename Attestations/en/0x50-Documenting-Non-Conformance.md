# Documenting Non-Conformance

Non-conformance of requirements occurs when something - a product, service, process, or system - fails to meet its intended specifications or established regulations. This deviation can be minor, like a typo in a document, or major, like a safety breach. Regardless of severity, non-conformance carries risks, impacting quality, performance, and potentially safety. Identifying and addressing it promptly is crucial. Many organizations document non-conformance as part of a risk management process.

## Conformance

CycloneDX Attestations documents conformance through an `attestation` that maps `requirements`, `claims`, `counterClaims` and a `conformance`. The `conformance` documents the ability of the `claims` to satify the `requirements`.

The conformance as three fields.

* `score:` The conformance of the claim between and inclusive of 0 and 1, where 1 is 100% conformance.
* `rationale:` The reasoning for the conformance score.
* `mitigationStrategies:` The list of evidence describing the mitigation strategies.

Instead of specifying that a `claim` is non-conforming, the `attestation` will have a lower `conformance` `score` for the portion of the requirement not met. Additionally the `rationale` describes what the non-conform is as a text statement, and the `mitigationStrategies` is `evidence` that alleviates the risk of the non-conformance.

### Score

The score can either be a binary conformance/non-conformance or a percentage between 0 and 1, where 1 is 100% conformance.

__Examples:__

* A `requirement` for all employees to complete security training. 70 of the 100 employees has completed it. The `conformance score` is `0.7`.
* A `requirement` for separate of accounts for elevated permissions from user accounts. Administrators use their user accounts for all elevated actions with no separation. The `conformance score` is `0.0`.

## Mitigation Strategies

Mitigation strategies are actions taken to reduce the severity or likelihood of a negative outcome. They are an essential part of risk management by reducing risk associated with non-conformance.

CycloneDX Attestations documents `mitigationStrategies` as bomLinks to `evidence`. This `evidence` details the action taken to mitigate the non-conformance.

Each mitigation strategy should include an explanation of what part of the non-conformance is being addressed. This explanation should be included as part of the `conformance` `rationale` or within the `description` of the `evidence`.

### Plan of Action and Milestones (POAM)

 A POAM is process used in cybersecurity and risk management to document risks, and is an opportunity to strengthen or “harden” your system through carefully planned improvements.

Common contexts where POAMs are used:

* NIST Cybersecurity Framework (CSF): Organizations working towards compliance with NIST CSF may use POAMs to address identified gaps.
* Federal Information Systems Management Act (FISMA): US government agencies use POAMs to document corrective actions for security vulnerabilities.
* Defense Contract Management Agency (DCMA): Defense contractors use POAMs to demonstrate plans for achieving cybersecurity requirements.
* Internal risk management: Organizations can use POAMs to address various internal risks beyond cybersecurity.

POAMs work well with CycloneDX Attestations and reference `attestation` and `mitigationStrategies` as bomLinks.

## Counter Evidence

Much like `evidence` is used to document supporting a `claim`, `counterEvidence` is used document `evidence` that contradicts a `claim`. This can provide verification that 100% conformance is not met.  

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
