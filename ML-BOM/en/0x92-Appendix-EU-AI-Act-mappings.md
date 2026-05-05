# Appendix A: ML-BOM mappings to the European Union's Artificial Intelligence Act (EU AI Act)

This appendix provides a mapping between the [EU’s AI Act](https://artificialintelligenceact.eu/) prose requirements, as well as the more prescriptive [Explanatory Notice and Template for the Public Summary of Training Content for general-purpose AI models](https://digital-strategy.ec.europa.eu/en/library/explanatory-notice-and-template-public-summary-training-content-general-purpose-ai-models), and how they are shown to be fulfilled using CycloneDX ML-BOM as documented in specific sections of this guide.

### Summary of the EU AI Act

The AI Act requires model providers to report extensive information on the models they produce to be used for risk assessment and compliance purposes.  This act, effectively endorses moving away from the current non-normative publication of model cards and research papers (or similar or documentation) towards normative and standardized methods such as AI/ML Bills-of-Materials (AI/ML-BOMs).  Specifically, AIBOMs are recognized as a key method for creating the technical documentation required by the EU AI Act (Article 11 and Annex IV).

In order to fulfill requirements of the act, providers must create and maintain up-to-date technical documentation, which includes providing a detailed description of the model’s capabilities, limitations, and intended use.

Some of these model documentation requirements include:

- General description, architecture, number of parameters and capabilities.
- Training data provenance, methodologies and scope.
- Evaluation results and performance benchmarks.
- Known limitations and intended use cases.
- Disclosing energy consumption and other environmental impacts.

### Summary of the Explanatory Notice and Template for the Public Summary of Training Content for general-purpose AI models

On July 24, 2025, the European Commission released the mandatory Explanatory Notice and Template for the Public Summary of Training Content for general-purpose AI (GPAI) models, a key compliance step under [Article 53](https://artificialintelligenceact.eu/article/53/)(1)(d) of the EU AI Act.This template serves as a mandatory minimum baseline for all GPAI providers, including those using open-source licenses, to publicly disclose information about their training data.

### EU AI Act & Explanatory template mappings

This section provides mappings of the EU AI Act's written and templated requirements to sections of this guide that show how CycloneDX can accommodate these requirements.

#### Article 53: Obligations for Providers of General-Purpose AI Models


This section contains mappings for [Article 53: Obligations for Providers of General-Purpose AI Models](https://artificialintelligenceact.eu/article/53/) which is part of [Chapter V: General-Purpose AI Models](https://artificialintelligenceact.eu/chapter/5/).

##### Mappings

| Section | Text | Guide references |
| --- | --- | --- |
| 1. | Providers of general-purpose AI models shall: | N/A |
| 1.(a) | draw up and keep up-to-date the technical documentation of the model, including its training and testing process and the results of its evaluation, which shall contain, at a minimum, the information set out in [Annex XI](https://artificialintelligenceact.eu/annex/11/) for the purpose of providing it, upon request, to the AI Office and the national competent authorities; | See [Annex XI: mappings](#annex-xi-mappings) |
| 1.(b) | draw up, keep up-to-date and make available information and documentation to providers of AI systems who intend to integrate the general-purpose AI model into their AI systems. Without prejudice to the need to observe and protect intellectual property rights and confidential business information or trade secrets in accordance with Union and national law, the information and documentation shall: | This effectively describes the AI/ML BOM document in its entirety. |
| 1.(b).(i) | enable providers of AI systems to have a good understanding of the capabilities and limitations of the general-purpose AI model and to comply with their obligations pursuant to this Regulation; and | [Model design considerations](0x24-Design-Model-Card-Considerations.md#model-design-considerations) |
| 1.(b).(ii) |contain, at a minimum, the elements set out in [Annex XII](https://artificialintelligenceact.eu/annex/12/); | Annex XII: "Technical Documentation for Providers of General-Purpose AI Models to Downstream Providers that Integrate the Model into Their AI System"</br>**Note**: CycloneDX can fully describe an AI/ML model that is part of, or used by, an application or service via contextual or referential inclusion as components in a Software Bill-of-Materials (SBOM) or Software-as-a-Service Bill-of-Materials (SaaSBOM). |
| 1.(c) | put in place a policy to comply with Union law on copyright and related rights, and in particular to identify and comply with, including through state-of-the-art technologies, a reservation of rights expressed pursuant to Article 4(3) of [Directive (EU) 2019/790](https://eur-lex.europa.eu/eli/dir/2019/790/oj/eng); | **Intention**:  *Article 4 in Directive 2019/790 (CDSMD), the European Union legislator intended to both encourage innovation and to provide more legal certainty for text and data mining (TDM) activities.*</br>- See: Oxford: Journal of Intellectual Property Law & Practice["The text and data mining opt-out in Article 4(3) CDSMD: Adequate veto right for rightholders or a suffocating blanket for European artificial intelligence innovations?"](https://academic.oup.com/jiplp/article/19/5/453/7614898)</br></br>CycloneDX enables various methods of conveying non-normative and legal information. Primarily, this is accomplished via `externalReferences`, component `properties`, as well as through explicit `licenses` objects and `copyright` fields. |
| 1.(d) | draw up and make publicly available a sufficiently detailed summary about the content used for training of the general-purpose AI model, according to a template provided by the AI Office. | The CycloneDX model card's parameter object allows for a description of the model's Training [Approach](0x22-Design-Model-Card-Parameters.md#approach).</br></br>**Note**: CycloneDX, as a Bills-of-Materials standard, accounts for each dataset as its own, fully described, component. See [Declaring Datasets](0x22-Design-Model-Card-Parameters.md#declaring-datasets). |
| 2. | The obligations set out in paragraph 1, points (a) and (b), shall not apply to providers of AI models that are released under a free and open-source licence that allows for the access, usage, modification, and distribution of the model, and whose parameters, including the weights, the information on the model architecture, and the information on model usage, are made publicly available. This exception shall not apply to general-purpose AI models with systemic risks. | N/A |
| 3. | Providers of general-purpose AI models shall cooperate as necessary with the Commission and the national competent authorities in the exercise of their competences and powers pursuant to this Regulation. | N/A |
| 4. | Providers of general-purpose AI models may rely on codes of practice within the meaning of [Article 56](https://artificialintelligenceact.eu/article/56/) to demonstrate compliance with the obligations set out in paragraph 1 of this Article, until a harmonised standard is published. Compliance with European harmonised standards grants providers the presumption of conformity to the extent that those standards cover those obligations. Providers of general-purpose AI models who do not adhere to an approved code of practice or do not comply with a European harmonised standard shall demonstrate alternative adequate means of compliance for assessment by the Commission. | In short, article 56 references further creation of new "Codes of Practice" that provide:</br>&bull; a means to ensure that the information, referred to in Article 53, is kept up to date.</br>&bull; an adequate level of detail for the summary about the content used for training;</br>&bull; identification of the type and nature of the systemic risks at Union level, including their sources, where appropriate;</br>&bull; measures, procedures and modalities for the assessment and management of the systemic risks at Union level, including the documentation thereof, which shall be proportionate to the risks.</br></br>As these codes are developed, future revisions of this guide will provide updates to facilitate compliance using CycloneDX. |
| 5. | For the purpose of facilitating compliance with [Annex XI](https://artificialintelligenceact.eu/annex/11/), in particular points 2 (d) and (e) thereof, the Commission is empowered to adopt delegated acts in accordance with [Article 97](https://artificialintelligenceact.eu/article/97/) to detail measurement and calculation methodologies with a view to allowing for comparable and verifiable documentation. | |
| 6. | The Commission is empowered to adopt delegated acts in accordance with [Article 97](https://artificialintelligenceact.eu/article/97/)(2) to amend [Annexes XI](https://artificialintelligenceact.eu/annex/11) and [XII](https://artificialintelligenceact.eu/annex/12) in light of evolving technological developments. | |
| 7. | Any information or documentation obtained pursuant to this Article, including trade secrets, shall be treated in accordance with the confidentiality obligations set out in [Article 78](https://artificialintelligenceact.eu/article/78/). | |

---

#### ANNEX XI: Technical Documentation Referred to in Article 53(1), Point (a) – Technical Documentation for Providers of General-Purpose AI Models

This section contains mappings for [ANNEX XI: Technical Documentation Referred to in Article 53](https://artificialintelligenceact.eu/annex/11/).

# Annex XI mappings

| Section | Text | Guide references | Relevant schema |
| --- | --- | --- | --- |
| 1 | Information to be provided by all providers of general-purpose AI models </br>The technical documentation referred to in [Article 53](https://artificialintelligenceact.eu/article/53)(1), point (a) shall contain at least the following information as appropriate to the size and risk profile of the model: | N/A | N/A |
| 1.1 | A general description of the general-purpose AI model including: | [Declaring ML models](0x20-Design-Model-Component-Metadata.md#declaring-ml-models)  | [metadata:component](https://cyclonedx.org/docs/1.7/json/#metadata_component)</br>- type: `"machine-learning-model"`</br>- name</br>- version</br>- description</br>- supplier</br>- manufacturer</br>- publisher | |
| 1.1.(a) | the tasks that the model is intended to perform and the type and nature of AI systems in which it can be integrated; | The model's model card object includes many considerations including intended use cases and users:</br>[Considerations: Users & use cases](0x24-Design-Model-Card-Considerations.md#users--use-cases)</br>- Use cases | [component.modelCard.considerations](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_modelCard_considerations)</br>- [users](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_modelCard_considerations_users)</br>- [useCases](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_modelCard_considerations_useCases) |
| 1.1.(b) | the acceptable use policies applicable; | Reference Qwen usage policy page:</br>- https://qwen.ai/usagepolicy | Usage policies can be provided as a CycloneDX external reference.</br>- [metadata.component.externalReferences](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_externalReferences)|
| 1.1.(c) | the date of release and methods of distribution; | [Providing model release notes](0x20-Design-Model-Component-Metadata.md#providing-model-release-notes) | Release information can be provided using the `releaseNotes` fields in the model's component:</br>[metadata.component.releaseNotes](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_releaseNotes)</br>- type</br>- description</br>- timestamp</br>- notes</br>- etc.</br>**Note:** *Components support multiple releases notes for the associated model/version.* |
| 1.1.(d) |the architecture and number of parameters; | The model parameters object includes fields for model architecture:</br>[Model metadata](#model-metadata)</br>- [Architecture family](#architecture-family)</br>- [Model architecture](#model-architecture)</br> | [metadata.component.modelCard.modelParameters](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_modelCard_modelParameters)</br>- [architectureFamily](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_modelCard_modelParameters_architectureFamily)</br>- [modelArchitecture](https://cyclonedx.org/docs/1.7/json/#metadata_tools_oneOf_i0_components_items_modelCard_modelParameters_modelArchitecture)  |
| 1.1.(e) |the modality (e.g. text, image) and format of inputs and outputs; | | |
| 1.1.(f) | the licence. | | |
| 1.2 | A detailed description of the elements of the model referred to in point 1, and relevant information of the process for the development, including the following elements: | N/A | |
| 1.2.(a) | the technical means (e.g. instructions of use, infrastructure, tools) required for the general-purpose AI model to be integrated in AI systems; | | |
| 1.2.(b) | the design specifications of the model and training process, including training methodologies and techniques, the key design choices including the rationale and assumptions made; what the model is designed to optimise for and the relevance of the different parameters, as applicable; | | |
| 1.2.(c) | information on the data used for training, testing and validation, where applicable, including the type and provenance of data and curation methodologies (e.g. cleaning, filtering, etc.), the number of data points, their scope and main characteristics; how the data was obtained and selected as well as all other measures to detect the unsuitability of data sources and methods to detect identifiable biases, where applicable; | | |
| 1.2.(d) | the computational resources used to train the model (e.g. number of floating point operations), training time, and other relevant details related to the training; | | |
| 1.2.(e) | known or estimated energy consumption of the model. With regard to point (e), where the energy consumption of the model is unknown, the energy consumption may be based on information about computational resources used. | | |
| 2 | Additional information to be provided by providers of general-purpose AI models with systemic risk | N/A | N/A |
| 2.1 | A detailed description of the evaluation strategies, including evaluation results, on the basis of available public evaluation protocols and tools or otherwise of other evaluation methodologies. Evaluation strategies shall include evaluation criteria, metrics and the methodology on the identification of limitations. | | |
| 2.2 | Where applicable, a detailed description of the measures put in place for the purpose of conducting internal and/or external adversarial testing (e.g. red teaming), model adaptations, including alignment and fine-tuning. | | |
| 2.3 |	Where applicable, a detailed description of the system architecture explaining how software components build or feed into each other and integrate into the overall processing. | | |

#### Annex: Template for the Public Summary of Training Content for General-Purpose AI models required by Article 53

The Explanatory Notice and Template seeks to address
relevant legal text from [Article 53](https://artificialintelligenceact.eu/article/53/)(1)(d) of the AI Act:

*Providers of general-purpose AI models shall […] draw up and make publicly available a sufficiently detailed summary about the content used for training of the general-purpose AI model, according to a template provided by the AI Office.*

As well as [Recital 107](https://artificialintelligenceact.eu/recital/107/) of the AI Act:

*In order to increase transparency on the data that is used in the pre-training and training of general-purpose AI models, including text and data protected by copyright law, it is adequate that providers of such models draw up and make publicly available a sufficiently detailed summary of the content used for training the general-purpose AI model.*

##### Mappings

| Section | Text | Commentary | Guide references |
| --- | --- | --- | --- |
| 1.   | General information | | |
| 1.1 | Provider identification | | |
| 1.1.(i) | Provider name and contact details | | |
| 1.1.(ii) | Authorised representative name and contact details | | |
| 1.2   | Model identification | | |
| 1.2.(i) | Versioned model name(s) | | |
| 1.2.(ii) | Model dependencies | | |
| 1.2.(iii) | Date of placement of the model on the Union market: | | |
| 1.3. | Modalities, overall training data size and other characteristic *(general information about the overall training data after  pre-processing and before the training of the model)* | **Note**: *Multi-model models may  require modality information for each sub-model in v2.0* | | |
| 1.3.(i) | Modality *(e.g., text, image, audio, video, other)*  | | |
| 1.3.(ii) | Training data size | | |
| 1.3.(ii) | Types of content | | |
| 2 | List of data sources *(information about specific sources of data used to train the general-purpose AI model)* | N/A | |
| 2.1 | Publicly available datasets | | |
| 2.2 | Private non-publicly available datasets obtained from third parties | | |
| 2.2.1 | Datasets commercially licensed by rightsholders or their representatives | | |
| 2.2.1.(i) | concluded transactional commercial licensing agreement (modalities covered by license) | **Note**: *modalities covered by license may need future consideration for v2.0* |
| 2.2.2 | Private datasets obtained from other third parties | | |
| 2.2.2.(i) | Specify the modality(ies) of the content covered by the datasets concerned.  | | |
| 2.2.2.(ii) | If publicly known, list private datasets obtained from other third parties | | |
| 2.2.2.(iii) | General description of non-publicly known private datasets obtained from third parties | | |
| 2.2.2.(iv) | Additional comments *(optional)* | *e.g. the period of data collection, size of the datasets and further details* | |
| 2.3 | Data crawled and scraped from online sources *(excluding publicly available datasets already compiled by third parties and made available on platforms such as common crawl that are covered under Section 2.1)* | The following subsections only apply if "crawlers were used for data collection". | |
| 2.3.(i) | specify crawler name(s)/identifier(s) | | |
| 2.3.(ii) | Purposes of the crawler(s) | | |
| 2.3.(iii) | General description of crawler behaviour | | |
| 2.3.(iv) | Period of data collection  | | |
| 2.3.(v) | Comprehensive description of the type of content and online sources crawled | | |
| 2.3.(vi) | Type of modality covered | | |
| 2.3.(vii) | Summary of the most relevant domain names crawled | | |
| 2.3.(viii) | Additional comments *(optional)* |  *e.g., domain names, URLs and the sources of individual works* | |
| 2.4 | User data *(information about user data collected by all services and products of the provider, including through mail services, social media platforms, content platforms)* | The following subsections only apply if user information sources were used. | | |
| 2.4.(i) | provide a general description of the
provider’s services or products that were used to
collect the user data | | |
| 2.4.(ii) | Additional comments *(optional)* | | |
| 2.5 | Synthetic data | The following subsections only apply if synthetic information sources were used. | | |
| 2.5.(i) | modality of the synthetic data | | | |
| 2.5.(ii) | specify the general-purpose AI model(s) used to generate the synthetic data if available on the market | | | |
| 2.5.(iii) | Information about other AI models, including provider’s own AI model(s) not available on the market, used to generate synthetic data to train the model | | | |
| 2.5.(iv) | Additional comments *(optional)* | | |
| 2.6 | Other sources of data | The following subsections only apply if other information sources were used. | | |
| 2.6.(i) | provide a narrative description of these data sources and the data | | |
| 2.5.(ii) | Additional comments *(optional)* | | |
| 3 | Data processing aspects The following subsections only apply if synthetic information sources were used. | N/A | |
| 3.1 | Respect of reservation of rights from text and data mining exception or limitation | *(measures implemented by the provider to identify and comply with the reservation of rights from the text and data mining (TDM) exception or limitation expressed pursuant to Article 4(3))* | |
| 3.1.(i) | Additional comments *(optional)* | | |
| 3.2 | Removal of illegal content | *measures taken to avoid or remove illegal content under Union law from the training data (such as blacklists, keywords, and model-based classifiers), without requiring disclosure of  specific details about the provider’s internal business practices or trade secrets* | |
| 3.3 | Other information *(optional)* | *Other relevant information about data processing* | |
