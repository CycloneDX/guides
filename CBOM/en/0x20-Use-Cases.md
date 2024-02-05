# Use Cases

## Cryptography Asset Management
The Cryptography Bill of Materials (CBOM) is a comprehensive inventory of cryptographic assets, encompassing keys, 
certificates, tokens, and more. This is a requirement of the [OMB M-23-02](https://www.whitehouse.gov/wp-content/uploads/2022/11/M-23-02-M-Memo-on-Migrating-to-Post-Quantum-Cryptography.pdf), 
where such a system is characterized as a [...”software or hardware implementation of one or more cryptographic algorithms
that provide one or more of the following services: (1) creation and exchange of encryption keys; (2) encrypted connections;
or (3) creation and validation of digital signatures.”] 

CBOM provides a structured framework for organizations to catalog and track their cryptographic resources, facilitating 
efficient management and ensuring security and compliance standards are met. By maintaining a detailed record of 
cryptographic assets, including their usage, expiration dates, and associated metadata, CBOM enables proactive monitoring
and streamlined auditing processes. With CBOM, organizations can effectively safeguard their cryptographic infrastructure,
mitigate risks associated with unauthorized access or misuse, and maintain the integrity and confidentiality of sensitive
data across diverse digital environments.

## Identifying Weak Cryptographic Algorithms
CBOM enables organizations to conduct thorough assessments and discover weak algorithms or flawed implementations that 
could compromise security. Through analysis of CBOM data, including cryptographic algorithms, key management practices, 
and usage patterns, organizations can pinpoint areas of concern and prioritize remediation efforts. CBOM facilitates 
proactive identification of weaknesses and vulnerabilities, allowing organizations to enhance the resilience of their 
cryptographic infrastructure and mitigate the risk of exploitation, thereby bolstering overall cybersecurity posture and
safeguarding sensitive data against potential threats.

## Post-Quantum Cryptography (PQC) Readiness
CBOM is crucial in preparing applications and systems for an impending post-quantum reality, aligning with 
guidance from the National Security Agency (NSA) and the National Institute of Standards and Technology (NIST). As 
quantum computing advancements threaten the security of current cryptographic standards, CBOM provides a structured 
approach to inventorying cryptographic assets and evaluating their resilience against quantum threats. 

Most notably, public key algorithms like RSA, DH, ECDH, DSA or ECDSA are considered not quantum-safe. These algorithms 
occur in various components and may be hardcoded in applications but are more commonly and preferably used via dedicated
cryptographic libraries or services. Developers often don’t directly interact with cryptographic algorithms such as RSA 
or ECDH but use them via protocols like TLS 1.3 or IPsec, by using certificates, keys, or other tokens. With upcoming 
cryptographic agility it becomes less common to put in stone (or software) the algorithms that will be used. Instead, 
they are configured during deployment or negotiated in each network protocol session. CBOM is designed with these 
considerations in mind and to allow insight into the classical and quantum security level of cryptographic assets and 
their dependencies.

By cataloging cryptographic algorithms and their respective parameters, CBOM enables organizations to identify vulnerable
or weak components that require mitigation or replacement with quantum-resistant alternatives recommended by NSA and NIST. 
Through comprehensive analysis and strategic planning facilitated by CBOM, organizations can proactively transition to 
post-quantum cryptographic primitives, ensuring the long-term security and integrity of their systems and applications.

## Assess Cryptographic Policies and Advisories
A cryptographic inventory in machine-readable form like CBOM brings benefits if one wants to check for compliance with 
cryptographic policies and advisories. An example of such an advisory is [CNSA 2.0](https://media.defense.gov/2022/Sep/07/2003071834/-1/-1/0/CSA_CNSA_2.0_ALGORITHMS_.PDF), 
which was announced by NSA in September of 2022. CNSA 2.0 states, among other things, that National Security Systems (NSS)
for firmware and software signing needs to support and prefer CNSA 2.0 algorithms by 2025 and exclusively use them by 2030.
The advised algorithms are the stateful hash-based signature schemes LMS and XMSS from [NIST SP 800-208](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-208.pdf). 
With a CBOM inventory that documents the use of LMS and XMSS by such systems, compliance with CNSA 2.0 can be assessed 
in an automated way.

## Identify Expiring and Long-Term Cryptographic Material
An RSA certificate expiring in one week poses less cryptographic risk than the same certificate expiring in 20 years. 
Service downtime due to an expired certificate is another risk to be considered. Therefore, we argue that an inventory 
that captures the life cycle of cryptographic material as allowed by CBOM gives context to an inventory that is 
instrumental for managing cryptographic risk.

## Ensure Cryptographic Certifications
Higher cryptographic assurance is provided by certifications such as [FIPS 140-3](https://csrc.nist.gov/pubs/fips/140-3/final) 
(levels 1 to 4) or [Common Criteria](https://www.commoncriteriaportal.org/) (EAL1 to 7). To obtain these certifications, 
cryptographic modules need to undergo certification processes. For regulated environments such as FedRAMP, such 
certifications are important requirements. CBOM allows the capture of certification levels of cryptographic assets so that
this property can be easily identified.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>