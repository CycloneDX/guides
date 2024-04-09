# Substantiating Claims With Evidence

CycloneDX Attestations is a standard that enables organizations to build an argument explaining how they meet security requirements. Organizations can start this process very early in development, using attestations to plan their security strategy for meeting each requirement and capturing the general reasoning that will be used.

As the system is built and tested, the team can capture the details of their implementation with specific claims. Ultimately, they can complete the argument by generating and gathering evidence to support each claim and creating specific reasoning that explains how the evidence demonstrates the claims are well supported and that the overall requirement has been met.

Let's explore the claims, evidence and reasoning that attest to how a requirement has been satisfied. Remember, a single requirement may be supported by multiple claims and a claim may be supported by many different pieces of evidence, tied together by some reasoning.

## Evidence

Once we have a specific claim, we can consider the types of evidence that might support that claim. The best evidence directly supports the target and predicate in the claim.  Indirect evidence is valuable, but generally can't stand alone and will need more explanation in the reasoning section below. For example, it's better to know that the software was extensively tested for SQL Injection than it would be to know that SQL Injection is covered in the organization's secure coding guide.  

* `Evidence:` A list of references to evidence that supports this claim. Evidence can include metrics, observations, test results, analysis, surveys, sampling, expert opinion, and more. It's important to not only  present output as evidence, but also to capture the metadata about how the evidence was created, any relevant configuration details, expertise, etc...  

* `Counter Evidence:` A list of references to evidence that contradicts this claim. Often, evidence will be created that directly or partially contradicts a claim.  For example, a security testing tool discovers a gap in security defenses, such as a lack of authorization on a particular interface.

* `Mitigation Strategy:` If the evidence is not compelling or counter evidence is present, the producer can detail their plans for improving conformance in this section. Ideally, the strategy should detail the change or enhancement, the rough schedule, and the expected effect on the evidence supporting the claim.

The following table details the makeup of evidence.

| Property     | Description                                                                       |
|--------------|-----------------------------------------------------------------------------------|
| bom-ref      | An identifier, unique to the CDXA document, that identifies the evidence.         |
| propertyName | The reference to the property name as defined in the CycloneDX Property Taxonomy. |
| description  | The written description of what this evidence is and how it was created.          |
| data         | The output or analysis that supports claims.                                      |
| created      | The date and time (timestamp) when the evidence was created.                      |
| expires      | The optional date and time (timestamp) when the evidence is no longer valid.      |
| author       | The author of the evidence.                                                       |
| reviewer     | The reviewer of the evidence.                                                     |


```json
"evidence": [
  {
    "bom-ref": "evidence-1",
    "propertyName": "internal.com.acme.someProperty",
    "description": "Description here",
    "data": [
      {
        "name": "Name of the data",
        "contents": {
          "attachment": {
            "content": "Evidence here",
            "contentType": "text/plain"
          }
        },
        "classification": "PII",
        "sensitiveData": [ "Describe sensitive data here" ]
      }
    ],
    "created": "2023-04-25T00:00:00+00:00",
    "expires": "2023-05-25T00:00:00+00:00",
    "author": { "name": "Mary" },
    "reviewer": { "name": "Sanford" }, 
    "signature": {
      "algorithm": "ES256",
      "certificatePath": [ "MIIB...", "MIID..." ],
      "value": "tqIT..."
    }
  }
]
```

## Reasoning

Simply providing claims and evidence is not sufficient to determine whether the claim was satisfied. We need some reasoning that explains how all the evidence, counter evidence, and mitigation strategy work together to support the claim. The best reasoning is simple and direct, and ties back to the claim as a straighforward argument.

* `Reasoning:` An argument that explains how the provided evidence, counter evidence, and mitigation strategy combine to support the overall claim.

Your reasoning for a claim about not being susceptible to SQL injection might tie together several pieces of evidence (and address any counter evidence). For example, a strong argument would be that "Acme corporation policy, secure coding guidelines, and training progam ensure that developers are aware of SQL injection and how to prevent it. All database access is performed through Hibernate which uses parameterized SQL queries in most cases. We test our software for all types of SQL injection using IAST and have remediated all instances discovered. Finally, we use RASP in production to detect SQL injection attacks and prevent exploitation."


## Other

* `External References:` A claim can reference any systems, sites, and information that may be relevant, but are not included with the BOM. They may also establish specific relationships within or external to the BOM.

* `Signature:` Enveloped signature in [JSON Signature Format (JSF)](https://cyberphone.github.io/doc/security/jsf.html).


## Another Example

Claim: The software component complies with the SLSA framework.

Evidence:
* A code review report that was generated by a qualified code reviewer.
* A build log that shows that the software component was built using a secure build system.
* A cryptographic signature of the software component, generated using a digital certificate issued by a trusted certificate authority.

Reasoning:
The evidence in this example provides support for the claim that the software component complies with the SLSA framework. The code review report provides evidence that the source code of the software component has been reviewed by a qualified person. The build log provides evidence that the software component was built using a secure build system. The cryptographic signature provides evidence that the component used was verified by a trusted entity. 

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
