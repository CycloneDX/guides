# Appendix B: Object Index

Every object in the design and assurance models and the adjacent party, vulnerability, and evidence models appears below with its chapter and its example file. The table is the coverage map: every object in the schema has a row. The example files ship in the CycloneDX bom-examples repository, and each validates against the CycloneDX v2.0 schema.

| Object | Model | Chapter | Example file |
|---|---|---|---|
| `abuseCase` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `acceptanceCriterion` | requirement-2 | Declaring Intended Use | `acme-intent` |
| `acknowledgment` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `actor` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `advisory` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `affectedStatus` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `analysisMethod` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `analysisResult` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `analysisTechnique` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `appetiteLevel` | risk-2 | Risk Appetite and Objectives | `acme-risk-register` |
| `assertion` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `assessment` | risk-2 | Assessing and Attesting | `acme-risk-register` |
| `assessmentMethod` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `asset` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `assetClassification` | blueprint-2 | Documenting Architecture | `feature-tour` |
| `assumption` | blueprint-2 | Documenting Architecture | `feature-tour` |
| `attackPath` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `attackPathStep` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `attackPattern` | threat-2 | Modeling Attacks | `feature-tour` |
| `attackTree` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `attackTreeNode` | threat-2 | Modeling Attacks | `feature-tour` |
| `attackVector` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `authenticationType` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `authorizationType` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `behaviorGraph` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `behaviorInstance` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `behaviorNode` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `behaviors` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `blueprint` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `blueprints` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `boundary` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `businessObjective` | business-objective-2 | Risk Appetite and Objectives | `acme-intent` |
| `businessObjectives` | business-objective-2 | Risk Appetite and Objectives | `acme-intent` |
| `callStack` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `callStacks` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `control` | control-2 | Managing Controls | `acme-controls` |
| `controls` | control-2 | Managing Controls | `acme-controls` |
| `criticality` | risk-2 | Managing Risk | `acme-risk-register` |
| `crossingRequirements` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `dataAttribute` | data-2 | Modeling Data Stores and Data Sets | `acme-data` |
| `dataClassification` | data-2 | Analyzing Privacy | `acme-data` |
| `dataContents` | data-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `dataFlowDirection` | data-2 | Analyzing Privacy | `acme-data` |
| `dataGovernance` | data-2 | Analyzing Privacy | `feature-tour` |
| `dataObject` | data-2 | Modeling Data Stores and Data Sets | `acme-data` |
| `dataProfile` | data-2 | Analyzing Privacy | `acme-data` |
| `dataProfileChoice` | data-2 | Modeling Data Stores and Data Sets | `acme-data` |
| `dataProfiles` | data-2 | Analyzing Privacy | `acme-data` |
| `dataRelationship` | data-2 | Modeling Data Stores and Data Sets | `acme-data` |
| `dataSet` | blueprint-2 | Modeling Data Stores and Data Sets | `acme-data` |
| `dataStore` | blueprint-2 | Modeling Data Stores and Data Sets | `acme-data` |
| `dependency` | requirement-2 | Declaring Intended Use | `feature-tour` |
| `detectionRule` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `effectiveness` | control-2 | Managing Controls | `acme-controls` |
| `estimateRange` | risk-2 | Managing Risk | `feature-tour` |
| `evidenceDataType` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `exception` | usecase-2 | Declaring Intended Use | `feature-tour` |
| `exploitability` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `exploitabilityLevel` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `exploitMaturity` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `flow` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `flow` | usecase-2 | Declaring Intended Use | `acme-intent` |
| `frame` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `identificationMethod` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `identifier` | party-2 | Identifying Parties | `acme-parties` |
| `impact` | risk-2 | Managing Risk | `acme-risk-register` |
| `impactAnalysisJustification` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `impactAnalysisState` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `impactCategory` | risk-2 | Managing Risk | `acme-risk-register` |
| `impactFactor` | risk-2 | Managing Risk | `feature-tour` |
| `impactQuantification` | risk-2 | Managing Risk | `feature-tour` |
| `implementationStatus` | control-2 | Managing Controls | `acme-controls` |
| `indicators` | threat-2 | Threat Modeling | `feature-tour` |
| `informationType` | data-2 | Analyzing Privacy | `acme-data` |
| `interface` | blueprint-2 | Documenting Architecture | `feature-tour` |
| `jurisdictions` | data-2 | Analyzing Privacy | `acme-data` |
| `killChainPhase` | threat-2 | Threat Modeling | `acme-threat-model` |
| `likelihood` | risk-2 | Managing Risk | `acme-risk-register` |
| `likelihoodFactor` | risk-2 | Managing Risk | `acme-risk-register` |
| `metadata` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `methodology` | threat-2 | Threat Modeling | `acme-threat-model` |
| `modelType` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `occurrence` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `ordering` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `organization` | party-2 | Identifying Parties | `acme-parties` |
| `ownership` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `parties` | party-2 | Identifying Parties | `acme-parties` |
| `party` | party-2 | Identifying Parties | `acme-parties` |
| `partyAttribution` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `partyChoice` | party-2 | Identifying Parties | `acme-parties` |
| `partyRelations` | party-2 | Identifying Parties | `acme-parties` |
| `person` | party-2 | Identifying Parties | `acme-parties` |
| `persona` | party-2 | Identifying Parties | `acme-parties` |
| `postalAddress` | party-2 | Identifying Parties | `acme-parties` |
| `preDefinedRole` | party-2 | Identifying Parties | `acme-parties` |
| `presenceEvidence` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `priority` | risk-2 | Managing Risk | `acme-risk-register` |
| `profiles` | profile-2 | Profiles and Reuse | `acme-profiles` |
| `purpose` | data-2 | Analyzing Privacy | `acme-data` |
| `rating` | risk-2 | Managing Risk | `acme-risk-register` |
| `rating` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `regulations` | data-2 | Analyzing Privacy | `acme-data` |
| `relationship` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `relationshipTargets` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `requirement` | requirement-2 | Declaring Intended Use | `feature-tour` |
| `requirementAssertions` | requirement-2 | Declaring Intended Use | `acme-intent` |
| `requirements` | requirement-2 | Declaring Intended Use | `acme-intent` |
| `requirementStatus` | requirement-2 | Declaring Intended Use | `acme-intent` |
| `requirementType` | requirement-2 | Declaring Intended Use | `feature-tour` |
| `risk` | risk-2 | Managing Risk | `acme-risk-register` |
| `riskAppetite` | risk-2 | Risk Appetite and Objectives | `acme-risk-register` |
| `riskAttribute` | risk-2 | Managing Risk | `acme-risk-register` |
| `riskDomain` | risk-2 | Managing Risk | `acme-risk-register` |
| `riskResponse` | risk-2 | Managing Risk | `acme-risk-register` |
| `risks` | risk-2 | Managing Risk | `acme-risk-register` |
| `riskScore` | risk-2 | Managing Risk | `acme-risk-register` |
| `role` | party-2 | Identifying Parties | `acme-parties` |
| `scope` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `scoreMethod` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `sessionManagement` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `severity` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `signature` | threat-2 | Threat Modeling | `feature-tour` |
| `step` | usecase-2 | Declaring Intended Use | `acme-intent` |
| `subject` | data-2 | Analyzing Privacy | `acme-data` |
| `supportingData` | evidence-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `system` | party-2 | Identifying Parties | `acme-parties` |
| `technique` | threat-2 | Modeling Attacks | `feature-tour` |
| `threat` | threat-2 | Threat Modeling | `acme-threat-model` |
| `threatProfile` | threat-2 | Threat Modeling | `acme-threat-model` |
| `threatProfiles` | threat-2 | Threat Modeling | `acme-threat-model` |
| `threats` | threat-2 | Threat Modeling | `acme-threat-model` |
| `threatScenario` | threat-2 | Threat Modeling | `acme-threat-model` |
| `transition` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `trigger` | behavior-2 | Describing Behavior | `acme-behaviors` |
| `trustBoundary` | threat-2 | Modeling Attacks | `acme-threat-model` |
| `useCase` | usecase-2 | Declaring Intended Use | `acme-intent` |
| `useCaseAssertions` | usecase-2 | Declaring Intended Use | `acme-intent` |
| `useCases` | usecase-2 | Declaring Intended Use | `acme-intent` |
| `validityPeriod` | blueprint-2 | Documenting Architecture | `acme-architecture` |
| `visualization` | blueprint-2 | Documenting Architecture | `feature-tour` |
| `visualizationType` | blueprint-2 | Documenting Architecture | `feature-tour` |
| `vulnerabilities` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `vulnerability` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `vulnerabilityEvidence` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `vulnerabilitySource` | vulnerability-2 | Reporting and Responding to Vulnerabilities | `acme-vulnerability-response` |
| `weakness` | weakness-2 | Reporting and Responding to Vulnerabilities | `acme-threat-model` |
| `weaknesses` | weakness-2 | Reporting and Responding to Vulnerabilities | `acme-threat-model` |
| `zone` | blueprint-2 | Documenting Architecture | `acme-architecture` |

Total objects: 148 across fourteen models (party, vulnerability, and evidence, plus the eleven design and assurance models). Objects not shown with a dedicated inline example appear within a parent object's example in the cited file.

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
