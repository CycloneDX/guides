# Appendix A: ML-BOM mappings to the European Union's Artificial Intelligence Act (EU AI Act)

This appendix provides a mapping between the [EU AI Act's]() prose requirements and how they are shown to be fulfilled using CycloneDX ML-BOM as documented in specific sections of this guide.

### Summary of the EU AI Act

The AI Act requires model providers to report extensive information on the models they produce to be used for risk assessment and compliance purposes.  This act, effectively endorses moving away from the current non-normative publication of model cards and research papers (or similar or documentation) towards normative and standardized methods such as AI/ML Bills-of-Materials (AI/ML-BOMs).  Specifically, AIBOMs are recognized as a key method for creating the technical documentation required by the EU AI Act (Article 11 and Annex IV).

In order to fulfill requirements of the act, providers must create and maintain up-to-date technical documentation, which includes providing a detailed description of the model’s capabilities, limitations, and intended use.

Some of these model documentation requirements include:

- General description, architecture, number of parameters and capabilities.
- Training data provenance, methodologies and scope.
- Evaluation results and performance benchmarks.
- Known limitations and intended use cases.
- Disclosing energy consumption and other environmental impacts.

### EU AI Act mappings

This section provides mappings of the EU AI Act's requirements to sections of this guide that show how CycloneDX can accommodate these requirements.

#### Article 53: Obligations for Providers of General-Purpose AI Models

This section contains mappings for [Article 53: Obligations for Providers of General-Purpose AI Models](https://artificialintelligenceact.eu/article/53/) which is part of [Chapter V: General-Purpose AI Models](https://artificialintelligenceact.eu/chapter/5/).

##### Mappings

1. Providers of general-purpose AI models shall:

(a) draw up and keep up-to-date the technical documentation of the model, including its training and testing process and the results of its evaluation, which shall contain, at a minimum, the information set out in Annex XI for the purpose of providing it, upon request, to the AI Office and the national competent authorities;

(b) draw up, keep up-to-date and make available information and documentation to providers of AI systems who intend to integrate the general-purpose AI model into their AI systems. Without prejudice to the need to observe and protect intellectual property rights and confidential business information or trade secrets in accordance with Union and national law, the information and documentation shall:

(i) enable providers of AI systems to have a good understanding of the capabilities and limitations of the general-purpose AI model and to comply with their obligations pursuant to this Regulation; and

(ii) contain, at a minimum, the elements set out in Annex XII;

(c) put in place a policy to comply with Union law on copyright and related rights, and in particular to identify and comply with, including through state-of-the-art technologies, a reservation of rights expressed pursuant to Article 4(3) of Directive (EU) 2019/790;

(d) draw up and make publicly available a sufficiently detailed summary about the content used for training of the general-purpose AI model, according to a template provided by the AI Office.

2. The obligations set out in paragraph 1, points (a) and (b), shall not apply to providers of AI models that are released under a free and open-source licence that allows for the access, usage, modification, and distribution of the model, and whose parameters, including the weights, the information on the model architecture, and the information on model usage, are made publicly available. This exception shall not apply to general-purpose AI models with systemic risks.

3. Providers of general-purpose AI models shall cooperate as necessary with the Commission and the national competent authorities in the exercise of their competences and powers pursuant to this Regulation.

4. Providers of general-purpose AI models may rely on codes of practice within the meaning of Article 56 to demonstrate compliance with the obligations set out in paragraph 1 of this Article, until a harmonised standard is published. Compliance with European harmonised standards grants providers the presumption of conformity to the extent that those standards cover those obligations. Providers of general-purpose AI models who do not adhere to an approved code of practice or do not comply with a European harmonised standard shall demonstrate alternative adequate means of compliance for assessment by the Commission.

5. For the purpose of facilitating compliance with Annex XI, in particular points 2 (d) and (e) thereof, the Commission is empowered to adopt delegated acts in accordance with Article 97 to detail measurement and calculation methodologies with a view to allowing for comparable and verifiable documentation.

6. The Commission is empowered to adopt delegated acts in accordance with Article 97(2) to amend Annexes XI and XII in light of evolving technological developments.

7. Any information or documentation obtained pursuant to this Article, including trade secrets, shall be treated in accordance with the confidentiality obligations set out in Article 78.

---

#### ANNEX XI: Technical Documentation Referred to in Article 53(1), Point (a) – Technical Documentation for Providers of General-Purpose AI Models

This section contains mappings for [ANNEX XI: Technical Documentation Referred to in Article 53](https://artificialintelligenceact.eu/annex/11/).


Section 1

Information to be provided by all providers of general-purpose AI models

The technical documentation referred to in Article 53(1), point (a) shall contain at least the following information as appropriate to the size and risk profile of the model:

1.


A general description of the general-purpose AI model including:

(a)


the tasks that the model is intended to perform and the type and nature of AI systems in which it can be integrated;

(b)


the acceptable use policies applicable;

(c)


the date of release and methods of distribution;

(d)


the architecture and number of parameters;

(e)


the modality (e.g. text, image) and format of inputs and outputs;

(f)


the licence.

2.


A detailed description of the elements of the model referred to in point 1, and relevant information of the process for the development, including the following elements:

(a)


the technical means (e.g. instructions of use, infrastructure, tools) required for the general-purpose AI model to be integrated in AI systems;

(b)


the design specifications of the model and training process, including training methodologies and techniques, the key design choices including the rationale and assumptions made; what the model is designed to optimise for and the relevance of the different parameters, as applicable;

(c)


information on the data used for training, testing and validation, where applicable, including the type and provenance of data and curation methodologies (e.g. cleaning, filtering, etc.), the number of data points, their scope and main characteristics; how the data was obtained and selected as well as all other measures to detect the unsuitability of data sources and methods to detect identifiable biases, where applicable;

(d)


the computational resources used to train the model (e.g. number of floating point operations), training time, and other relevant details related to the training;

(e)


known or estimated energy consumption of the model.

With regard to point (e), where the energy consumption of the model is unknown, the energy consumption may be based on information about computational resources used.

Section 2

Additional information to be provided by providers of general-purpose AI models with systemic risk


1.
	A detailed description of the evaluation strategies, including evaluation results, on the basis of available public evaluation protocols and tools or otherwise of other evaluation methodologies. Evaluation strategies shall include evaluation criteria, metrics and the methodology on the identification of limitations.


2.
	Where applicable, a detailed description of the measures put in place for the purpose of conducting internal and/or external adversarial testing (e.g. red teaming), model adaptations, including alignment and fine-tuning.


3.
	Where applicable, a detailed description of the system architecture explaining how software components build or feed into each other and integrate into the overall processing.

