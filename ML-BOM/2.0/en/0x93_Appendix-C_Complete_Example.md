# Appendix C: Complete Example

This appendix includes a complete AI/ML-BOM example that combines most of the isolated examples for the Qwen model shown throughout this guide.

#### Example: Qwen-7B AI/ML-BOM

Unlike the abbreviated examples elsewhere in this guide, the AI/ML-BOM below contains no `// ...` placeholders and validates against the [CycloneDX 2.0 JSON schema](https://github.com/CycloneDX/specification/tree/2.0-dev/schema/2.0).

> **Note**: For brevity, the `formulation` entry for the model's training only describes the top-level `workflow` topology (i.e., the run-time "stack"), but none of the `tasks` or `steps` that could be detailed.  Similarly, only a few of the model repository's files are listed, so the composition's `aggregate` is `incomplete`.

> **Note**: Some of the datasets, identifiers, and measurements combined into this example (e.g., the ACME datasets and identifier, the GLUE score, and the energy consumption) come from the illustrative examples in earlier sections and are not published information about Qwen-7B.

The example is organized as follows:

* **inventories** - The Qwen-7B model is the `subject` of the AI/ML-BOM's single inventory, whose `components` include files from the model repository (configuration, tokenizer, chat template, and tensor data) and the datasets used for training and evaluation.
* **compositions** - Asserts the completeness of the model's inventory.
* **formulation** - The model training workflow and its runtime topology.
* **risks** - The model's ethical considerations and fairness assessments.
* **definitions** - The components of the training "stack", the parties (suppliers, intended users, and groups at risk), the use cases, and graphics shared across the AI/ML-BOM.
* **perspectives** - An abridged "Model Card" perspective that maps the AI/ML-BOM data to familiar model card sections.

```json
{
  "$schema": "https://cyclonedx.org/schema/2.0/cyclonedx-2.0.schema.json",
  "specFormat": "CycloneDX",
  "specVersion": "2.0",
  "serialNumber": "urn:uuid:ec45525e-516c-4405-9de3-4fbdaef7f09a",
  "version": 1,
  "inventories": [
    {
      "subject": {
        "type": "machine-learning-model",
        "refId": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
        "group": "Qwen",
        "name": "Qwen/Qwen-7B",
        "version": "ef3c5c9c57b252f3149c1408daf4d649ec8b6c85",
        "description": "Qwen-7B is a Transformer-based large language model, which is pretrained on a large volume of data, including web texts, books, codes, etc.",
        "parties": [
          {
            "refId": "party-alibaba-cloud",
            "roles": [
              {
                "role": "manufacturer"
              }
            ],
            "organization": {
              "name": "Alibaba Cloud",
              "url": [
                {
                  "url": "https://www.alibabacloud.com"
                }
              ]
            }
          },
          {
            "ref": "party-hugging-face"
          }
        ],
        "identifiers": [
          {
            "party": "party-hugging-face",
            "identities": [
              {
                "scheme": "purl",
                "value": "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9c57b252f3149c1408daf4d649ec8b6c85"
              }
            ]
          },
          {
            "party": "party-acme",
            "identities": [
              {
                "scheme": {
                  "name": "acme:research:model:llm:id",
                  "description": "ACME Research internal LLM registry identifier"
                },
                "value": "MODEL-ID-12345-INTERNAL"
              }
            ]
          }
        ],
        "licenses": [
          {
            "license": {
              "name": "Tongyi Qianwen LICENSE AGREEMENT",
              "text": {
                "content": "By clicking to agree or by using or distributing any portion or element of the Tongyi Qianwen Materials, ..."
              }
            }
          }
        ],
        "releaseNotes": {
          "type": "major",
          "title": "Qwen 7B initial release",
          "timestamp": "2023-08-03T15:30:00Z",
          "notes": [
            {
              "locale": "en-US",
              "text": {
                "content": "United States (US), English release date."
              }
            }
          ]
        },
        "externalReferences": [
          {
            "type": "vcs",
            "url": "https://huggingface.co/Qwen/Qwen-7B"
          },
          {
            "type": "model-card",
            "url": "https://huggingface.co/Qwen/Qwen-7B"
          },
          {
            "type": "documentation",
            "url": "https://arxiv.org/abs/2309.16609",
            "comment": "Qwen Technical Report"
          },
          {
            "type": "documentation",
            "url": "https://qwen.ai/usagepolicy",
            "comment": "Usage policy"
          }
        ],
        "tags": [
          "pytorch",
          "transformers",
          "text-generation"
        ],
        "pedigree": {
          "descendants": [
            {
              "type": "machine-learning-model",
              "name": "Qwen/Qwen-7B-Chat",
              "description": "The chat (instruction-following) variant of Qwen-7B, aligned using supervised fine-tuning (SFT) and reinforcement learning from human feedback (RLHF).",
              "identifiers": [
                {
                  "party": "party-hugging-face",
                  "identities": [
                    {
                      "scheme": "purl",
                      "value": "pkg:huggingface/Qwen/Qwen-7B-Chat"
                    }
                  ]
                }
              ]
            }
          ]
        },
        "useCaseAssertions": [
          {
            "assertionType": "supports",
            "useCaseRefs": [
              "uc-code-assistant",
              "uc-translation",
              "uc-support-triage",
              "uc-research-summarization",
              "uc-edge-device",
              "uc-security-log-analysis",
              "uc-local-assistant"
            ]
          }
        ],
        "modelProperties": {
          "learningTypes": [
            "self-supervised",
            "supervised",
            "reinforcement-learning"
          ],
          "tasks": [
            "text-generation"
          ],
          "architecture": {
            "name": "QWenLMHeadModel",
            "description": "Decoder-only Transformer using rotary position embeddings and SwiGLU activations.",
            "family": "transformer",
            "features": [
              "decoder-only",
              "rotary-position-embedding",
              "gated-linear-units"
            ],
            "topology": "dense"
          },
          "parameterCount": 7000000000,
          "inputs": [
            {
              "name": "prompt",
              "description": "The text prompt to be completed by the model.",
              "modality": "text",
              "dataType": "string",
              "processingStage": "pre-tokenizer",
              "required": true
            }
          ],
          "outputs": [
            {
              "name": "completion",
              "description": "The generated text completion.",
              "modality": "text",
              "dataType": "string",
              "processingStage": "post-processing"
            }
          ],
          "training": {
            "formula": "formula-model-training",
            "datasets": [
              "pkg:huggingface/openbmb/UltraFeedback@40b4365",
              "pkg:huggingface/snorkelai/Snorkel-Mistral-PairRM-DPO@07af5d0a",
              "dataset-acme-midwest-health"
            ]
          },
          "limitations": [
            "Greedy Decoding Degradation. The model is optimized for sampling-based generation. Using greedy decoding (temperature=0) can lead to performance degradation, repetitive loops, and \"stuck\" reasoning steps, particularly in the new Thinking Mode",
            "Native Context Window Boundaries. While the model supports up to 131,072 tokens using YaRN scaling, its native pre-training context is limited to 32,768 tokens. Performance may degrade on very long sequences if proper scaling factors (like RoPE or YaRN) are not manually configured for local deployments.",
            "Synthetic Data \"Sanding\" Effects. Research indicates that Qwen, like many models trained on massive synthetic datasets, can suffer from \"model collapse\" where rare edge cases or minority user behaviors are underrepresented, potentially leading to errors in complex, real-world production environments.",
            "Thinking Mode History Overhead. In multi-turn conversations, including the model's internal \"thinking\" steps in the chat history can confuse the model and consume unnecessary tokens. Best practices require developers to filter out \"thinking\" content from the history to maintain coherence.",
            "Performance tradeoff: Intelligence Plateau in Domain-Specific Tasks. Research indicates that for specialized fields like legal text analysis, performance often flattens beyond the 7B parameter mark. While efficient, the 7B model may not offer the incremental reasoning gains found in the 32B or 235B models for complex, high-stakes domain reasoning.",
            "Performance tradeoff: Enhanced Quantization Sensitivity. The Qwen-7B employs advanced pre-training techniques that reduce parameter redundancy. A documented tradeoff of this efficiency is a higher sensitivity to low-bit quantization (3-bit and below), where it exhibits more pronounced performance degradation compared to previous 7B generations.",
            "Performance tradeoff: Context Window Consistency. While the 7B model supports a native context window of 32,768 tokens, its performance degrades significantly more than the Qwen-8B (which uses YaRN scaling to reach 128K+) when handling massive document sets. Users must tradeoff deep long-document comprehension for the 7B's lower memory footprint.",
            "Performance tradeoff: Conciseness vs. Contextual Nuance. Experiments show that the older 7B design prioritizes cleaner, easier-to-read, and more concise outputs. The tradeoff is a loss of the \"faithful and nuanced\" insights and richer context provided by the newer 8B and larger architectures.",
            "Performance tradeoff: Agentic Capability Limitations. The 7B model shows a documented gap in its ability to follow complex multi-step instructions or navigate large software repositories, requiring tighter chunking and more finely tuned prompts to be effective",
            "Performance tradeoff: Hardware Efficiency vs. Throughput. Running the 7B model on older hardware (e.g., 8GB VRAM cards) is possible but results in a tradeoff of throughput. Modern inference techniques like continuous batching and PagedAttention are less effective at this scale than on the larger, more parallelizable MoE models.",
            "Performance tradeoff: Decoding Strategy Rigidity. The 7B model is highly sensitive to sampling parameters; specifically, using greedy decoding (temperature=0) can lead to severe repetition loops and \"endless repetitions\". To maintain performance, users must tradeoff predictability for more complex sampling-based generation."
          ],
          "properties": [
            {
              "name": "cdx:ai-ml:model:parameter:tune_method",
              "value": "sft"
            },
            {
              "name": "cdx:ai-ml:model:parameter:tune_method",
              "value": "rlhf"
            },
            {
              "name": "cdx:ai-ml:model:hyperparameter:num_hidden_layers",
              "value": "32"
            },
            {
              "name": "cdx:ai-ml:model:hyperparameter:hidden_size",
              "value": "4096"
            },
            {
              "name": "cdx:ai-ml:model:hyperparameter:context_length",
              "value": "8192"
            },
            {
              "name": "cdx:ai-ml:model:hyperparameter:vocab_size",
              "value": "151936"
            },
            {
              "name": "cdx:ai-ml:model:hyperparameter:quantization",
              "value": "BF16"
            }
          ]
        },
        "measurements": [
          {
            "type": "accuracy",
            "benchmark": "MMLU (5-shot)",
            "measure": {
              "value": 58.2,
              "unit": "%"
            },
            "confidenceInterval": {
              "lowerBound": 57.48,
              "upperBound": 58.92
            },
            "evaluationDatasets": [
              "pkg:huggingface/cais/mmlu"
            ],
            "graphics": [
              {
                "ref": "graphic-qwen-benchmarks"
              }
            ]
          },
          {
            "type": "f1",
            "benchmark": "GLUE",
            "slice": "cola",
            "measure": {
              "value": 0.87,
              "unit": "1"
            }
          },
          {
            "activity": "training",
            "energyProviders": [
              {
                "description": "Meta data-center, US-East",
                "provider": {
                  "roles": [
                    {
                      "role": "supplier"
                    }
                  ],
                  "organization": {
                    "name": "Fake.ai",
                    "addresses": [
                      {
                        "country": "United States",
                        "region": "New Jersey",
                        "locality": "Newark"
                      }
                    ]
                  }
                },
                "energySource": "natural-gas",
                "energyProvided": {
                  "value": 0.4,
                  "unit": "kWh"
                }
              }
            ],
            "activityEnergyCost": {
              "value": 0.4,
              "unit": "kWh"
            },
            "co2CostEquivalent": {
              "value": 31.22,
              "unit": "tCO2eq"
            },
            "co2CostOffset": {
              "value": 31.22,
              "unit": "tCO2eq"
            },
            "formula": "formula-model-training"
          }
        ],
        "properties": [
          {
            "name": "cdx:ai-ml:model:modality",
            "value": "text"
          },
          {
            "name": "cdx:ai-ml:model:modality",
            "value": "code"
          },
          {
            "name": "cdx:ai-ml:model:language",
            "value": "en,fr,de,it,ja,zh"
          }
        ]
      },
      "components": [
        {
          "type": "file",
          "name": "config.json",
          "description": "Model configuration file using the 'QWenLMHeadModel' model class in Hugging Face Transformers",
          "refId": "pkg:huggingface/Qwen/Qwen-7B@e7a368b#config.json",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#config.json"
                }
              ]
            }
          ]
        },
        {
          "type": "file",
          "name": "configuration_qwen.py",
          "description": "Python 'QWenConfig' class implementation for the Qwen-7B model using Hugging Face Transformers",
          "refId": "pkg:huggingface/Qwen/Qwen-7B@a6ca629#configuration_qwen.py",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/Qwen/Qwen-7B@a6ca629d063f56f34d184852301e8852a7afbd58#configuration_qwen.py"
                }
              ]
            }
          ]
        },
        {
          "type": "library",
          "name": "tokenization_qwen.py",
          "description": "Python tokenization classes for QWen (QWenTokenizer)",
          "refId": "pkg:huggingface/Qwen/Qwen-7B@e7a368b#tokenization_qwen.py",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/Qwen/Qwen-7B@e7a368b0774370edec29674e7c51f52fc7663f59#tokenization_qwen.py"
                }
              ]
            }
          ],
          "properties": [
            {
              "name": "cdx:ai-ml:model:tokenizer",
              "value": "true"
            },
            {
              "name": "cdx:ai-ml:tokenizer:hyperparameter:tokenizer_class",
              "value": "QWenTokenizer"
            }
          ]
        },
        {
          "type": "file",
          "refId": "qwen-7b-chat-template",
          "name": "ChatML",
          "description": "The ChatML chat template used to format conversational input for the model.",
          "externalReferences": [
            {
              "type": "documentation",
              "url": "https://huggingface.co/learn/llm-course/en/chapter11/2#common-template-formats"
            }
          ],
          "properties": [
            {
              "name": "cdx:ai-ml:model:template:chat",
              "value": "true"
            }
          ]
        },
        {
          "type": "data",
          "name": "model-00001-of-00008.safetensors",
          "description": "Model tensor data (01 of 08)",
          "refId": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6#model-00001-of-00008.safetensors",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00001-of-00008.safetensors"
                }
              ]
            }
          ],
          "data": [
            {
              "type": "dataset",
              "contents": {
                "url": "https://huggingface.co/Qwen/Qwen-7B/blob/main/model-00001-of-00008.safetensors"
              }
            }
          ]
        },
        {
          "type": "data",
          "name": "model-00002-of-00008.safetensors",
          "description": "Model tensor data (02 of 08)",
          "refId": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6#model-00002-of-00008.safetensors",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/Qwen/Qwen-7B@abcb6d6d8ec63ce606f816e2d08072da6309f965#model-00002-of-00008.safetensors"
                }
              ]
            }
          ],
          "data": [
            {
              "type": "dataset",
              "contents": {
                "url": "https://huggingface.co/Qwen/Qwen-7B/blob/main/model-00002-of-00008.safetensors"
              }
            }
          ]
        },
        {
          "type": "data",
          "name": "UltraFeedback dataset",
          "refId": "pkg:huggingface/openbmb/UltraFeedback@40b4365",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/openbmb/UltraFeedback@40b436560ca83a8dba36114c22ab3c66e43f6d5e"
                }
              ]
            }
          ],
          "data": [
            {
              "type": "dataset",
              "classification": "public",
              "contents": {
                "url": "https://huggingface.co/datasets/openbmb/UltraFeedback"
              }
            }
          ]
        },
        {
          "type": "data",
          "name": "Snorkel-Mistral-PairRM-DPO dataset",
          "refId": "pkg:huggingface/snorkelai/Snorkel-Mistral-PairRM-DPO@07af5d0a",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/snorkelai/Snorkel-Mistral-PairRM-DPO@07af5d0a875b4c692dfaff6c675b10af07b45511"
                }
              ]
            }
          ]
        },
        {
          "type": "data",
          "name": "ACME Midwest health data",
          "refId": "dataset-acme-midwest-health",
          "data": [
            {
              "type": "dataset",
              "classification": "confidential",
              "contents": {
                "url": "https://acme.ai/adatasets/health/patient?region=midwest"
              }
            }
          ]
        },
        {
          "type": "data",
          "name": "MMLU",
          "refId": "pkg:huggingface/cais/mmlu",
          "description": "Massive Multitask Language Understanding evaluation dataset.",
          "identifiers": [
            {
              "party": "party-hugging-face",
              "identities": [
                {
                  "scheme": "purl",
                  "value": "pkg:huggingface/cais/mmlu"
                }
              ]
            }
          ]
        }
      ]
    }
  ],
  "compositions": [
    {
      "kind": "components",
      "aggregate": "incomplete",
      "targets": [
        "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
      ]
    }
  ],
  "formulation": [
    {
      "refId": "formula-model-training",
      "workflows": [
        {
          "refId": "workflow-model-training",
          "uid": "a3f9e2b1-7d8c-4a5f-9e6b-3c2d1a0b8f7e",
          "name": "Model training workflow",
          "description": "Describes the tasks used for training the model described by the AI/ML-BOM.",
          "taskTypes": [
            "build"
          ],
          "resourceReferences": [
            {
              "ref": "pkg:oci/nvidia-pytorch@sha256:f398a0"
            },
            {
              "ref": "nvidia-h100-pcie-gpu-1"
            }
          ],
          "runtimeTopology": [
            {
              "ref": "pkg:oci/nvidia-pytorch@sha256:f398a0",
              "dependsOn": [
                "nvidia-h100-pcie-gpu-1"
              ],
              "provides": [
                "pkg:pypi/cuda-toolkit@13.1.1",
                "pkg:generic/nvidia-cuda-runtime@12.2.0",
                "pkg:pypi/pytorch@2.10.0",
                "pkg:generic/nccl@2.29.2"
              ]
            }
          ]
        }
      ]
    }
  ],
  "risks": {
    "risks": [
      {
        "refId": "risk-bias",
        "name": "Algorithmic and Cultural Bias",
        "statement": "Training on trillions of tokens across many languages → the model reflects societal biases and stereotypes present in its training data → representational harm to affected groups.",
        "domains": [
          {
            "type": "ethical"
          },
          {
            "type": "fairness"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
        ],
        "status": "identified",
        "responses": [
          {
            "refId": "resp-bias-detection",
            "strategy": "reduce",
            "description": "Use the Qwen-Gender framework or Chain-of-Thought (CoT) prompting to detect and reduce implicit biases in generated text."
          }
        ]
      },
      {
        "refId": "risk-jailbreak",
        "name": "Vulnerability to Adversarial Attacks (Jailbreaking)",
        "statement": "Despite safety tuning, users craft adversarial prompts (\"Prompt Hacking\" or \"Jailbreaking\") → safety constraints are bypassed → the model generates toxic or illegal content.",
        "domains": [
          {
            "type": "ethical"
          },
          {
            "type": "security"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
        ],
        "status": "identified",
        "responses": [
          {
            "refId": "resp-guard-filter",
            "strategy": "reduce",
            "description": "Implement Qwen3Guard as an input/output filter to classify and block unsafe queries or responses in real-time."
          }
        ]
      },
      {
        "refId": "risk-hallucination",
        "name": "Misinformation or Hallucinations",
        "statement": "Probabilistic generation without grounding → the model fabricates false or misleading information, especially regarding sensitive topics like government actions or historical events → users are misinformed.",
        "domains": [
          {
            "type": "ethical"
          },
          {
            "type": "societal"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
        ],
        "status": "identified",
        "responses": [
          {
            "refId": "resp-rag-grounding",
            "strategy": "reduce",
            "description": "Explicitly instruct the model to \"Prioritize Safety\" in the prompt and use Retrieval-Augmented Generation (RAG) to ground responses in verified external documents."
          }
        ]
      },
      {
        "refId": "risk-pii-leakage",
        "name": "Privacy, Sensitive or Personally Identifiable Information (PII) Content Leakage",
        "statement": "Sensitive or personally identifiable data present in the pre-training corpus → the model reproduces such data in its outputs → privacy violation.",
        "domains": [
          {
            "type": "ethical"
          },
          {
            "type": "privacy"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
        ],
        "status": "identified",
        "responses": [
          {
            "refId": "resp-local-deploy-pii-scrub",
            "strategy": "reduce",
            "description": "Deploy the model locally using tools like Ollama to ensure sensitive data stays within a secure environment, and apply regex-based PII scrubbing to outputs."
          }
        ]
      },
      {
        "refId": "risk-inference-energy",
        "name": "Environmental Impact (Inference Energy)",
        "statement": "Continuous large-scale deployment of even mid-sized models like the 7B → significant energy consumption → increased carbon footprint.",
        "domains": [
          {
            "type": "ethical"
          },
          {
            "type": "environmental"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
        ],
        "status": "identified",
        "responses": [
          {
            "refId": "resp-quantize-efficient-inference",
            "strategy": "reduce",
            "description": "Utilize 4-bit quantization and low-latency inference engines to reduce the FLOPs required per token, minimizing the power draw per query."
          }
        ]
      },
      {
        "refId": "risk-instruction-misalignment",
        "name": "Instruction Misalignment",
        "statement": "In-context learning → \"emergent misalignment\" where the model prioritizes following a user's conversational style → established safety boundaries are not respected.",
        "domains": [
          {
            "type": "ethical"
          },
          {
            "type": "safety"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9"
        ],
        "status": "identified",
        "responses": [
          {
            "refId": "resp-system-prompt-hard-switch",
            "strategy": "reduce",
            "description": "Standardize output formats using system prompts and utilize the \"hard switch\" to disable the model's internal thinking mode when maximum safety and predictability are required."
          }
        ]
      },
      {
        "refId": "risk-fairness-discriminatory-outcomes",
        "name": "Discriminatory outcomes across protected characteristics",
        "statement": "Biases in training data → the model produces discriminatory outcomes across protected characteristics in task assignment scenarios → individuals in the affected groups are unfairly labeled or treated.",
        "domains": [
          {
            "type": "fairness"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
          "group-protected-characteristics"
        ],
        "status": "assessed",
        "inherentRisk": {
          "impacts": [
            {
              "polarity": "harm",
              "level": "major",
              "categories": [
                "discrimination"
              ],
              "description": "The model was found to produce discriminatory outcomes across protected characteristics, including race, gender, and disability status. For example, individuals categorized as \"gypsy\" or \"mute\" were incorrectly labeled as untrustworthy in task assignment scenarios."
            }
          ]
        },
        "responses": [
          {
            "refId": "resp-rlaif-alignment",
            "strategy": "reduce",
            "description": "Researchers recommend using Reinforcement Learning from Artificial Intelligence Feedback (RLAIF) and rule-based rewards to align the model with specific legal standards like the EU AI Act."
          }
        ]
      },
      {
        "refId": "risk-fairness-quality-of-service",
        "name": "Quality-of-service disparity across languages",
        "statement": "Reasoning capabilities trained predominantly on English and Mandarin data → oversimplified, factually incorrect, or hallucinated responses in other supported languages → lower quality of service for speakers of those languages.",
        "domains": [
          {
            "type": "fairness"
          }
        ],
        "affects": [
          "pkg:huggingface/Qwen/Qwen-7B@ef3c5c9",
          "group-other-language-speakers"
        ],
        "status": "assessed",
        "inherentRisk": {
          "impacts": [
            {
              "polarity": "harm",
              "level": "moderate",
              "categories": [
                "fairness"
              ],
              "description": "Quality-of-Service Harm: The model may provide high-quality, nuanced reasoning in English or Mandarin but offer oversimplified, factually incorrect, or \"hallucinated\" information when queried in other supported languages."
            }
          ]
        },
        "responses": [
          {
            "refId": "resp-cross-lingual-sft",
            "strategy": "reduce",
            "description": "Cross-Lingual Alignment: Developers can use multilingual Supervised Fine-Tuning (SFT), training on additional high-quality, parallel corpora from other languages on \"reasoning capabilities\" (e.g., logic, math, coding)."
          }
        ]
      }
    ]
  },
  "definitions": {
    "components": [
      {
        "type": "container",
        "name": "h100-training-image",
        "version": "25.03-py3-igpu",
        "refId": "pkg:oci/nvidia-pytorch@sha256:f398a0",
        "identifiers": [
          {
            "party": "party-nvidia",
            "identities": [
              {
                "scheme": "purl",
                "value": "pkg:oci/nvidia-pytorch@sha256:f398a0955ec5fcf9e3bbf77610225ff4e953e137423ab248e2bf32cd4971a1dc?repository_url=nvcr.io/nvidia/pytorch&tag=25.03-py3-igpu"
              }
            ]
          }
        ]
      },
      {
        "type": "library",
        "name": "nvidia-cuda-runtime",
        "version": "12.2.0",
        "refId": "pkg:generic/nvidia-cuda-runtime@12.2.0"
      },
      {
        "type": "library",
        "name": "pytorch",
        "version": "2.10.0",
        "refId": "pkg:pypi/pytorch@2.10.0"
      },
      {
        "type": "library",
        "name": "cuda-toolkit",
        "version": "13.1.1",
        "refId": "pkg:pypi/cuda-toolkit@13.1.1"
      },
      {
        "type": "library",
        "name": "nccl",
        "version": "2.29.2",
        "refId": "pkg:generic/nccl@2.29.2"
      },
      {
        "type": "device",
        "name": "NVIDIA H100 Tensor Core GPU",
        "description": "NVIDIA H100 Tensor Core GPU PCIe Device",
        "refId": "nvidia-h100-pcie-gpu-1"
      }
    ],
    "parties": [
      {
        "refId": "party-hugging-face",
        "roles": [
          {
            "role": "supplier"
          }
        ],
        "organization": {
          "name": "Hugging Face",
          "url": [
            {
              "url": "https://huggingface.co"
            }
          ]
        }
      },
      {
        "refId": "party-acme",
        "roles": [
          {
            "role": "asserter"
          }
        ],
        "organization": {
          "name": "ACME"
        }
      },
      {
        "refId": "party-nvidia",
        "roles": [
          {
            "role": "publisher"
          }
        ],
        "organization": {
          "name": "NVIDIA"
        }
      },
      {
        "refId": "user-software-developer",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Software developer",
          "archetype": "developer"
        }
      },
      {
        "refId": "user-content-creator",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Multilingual Content Creator"
        }
      },
      {
        "refId": "user-support-architect",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Customer Support Systems Architect"
        }
      },
      {
        "refId": "user-researcher",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Academic Researcher / Student",
          "archetype": "researcher"
        }
      },
      {
        "refId": "user-edge-engineer",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Edge Device Engineer"
        }
      },
      {
        "refId": "user-security-analyst",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Enterprise Security Analyst"
        }
      },
      {
        "refId": "user-local-ai",
        "roles": [
          {
            "role": "end-user"
          }
        ],
        "persona": {
          "label": "Local AI Enthusiast / Privacy-First User"
        }
      },
      {
        "refId": "group-protected-characteristics",
        "roles": [
          {
            "name": "affected-group",
            "description": "A group of people at risk of being systematically disadvantaged by the model."
          }
        ],
        "persona": {
          "label": "People identified by protected characteristics",
          "description": "People identified by characteristics such as race, gender, and disability status."
        }
      },
      {
        "refId": "group-other-language-speakers",
        "roles": [
          {
            "name": "affected-group"
          }
        ],
        "persona": {
          "label": "Non-English/Non-Chinese speakers",
          "description": "Non-English/Non-Chinese speakers, speakers of regional dialects or specific geographic regions (e.g., Southeast Asia or the Middle East) on thinking or \"reasoning\" tasks."
        }
      }
    ],
    "useCases": [
      {
        "refId": "uc-code-assistant",
        "name": "IDE code assistant",
        "description": "Utilizing the Qwen \"instruct\" variants within an IDE for real-time code completion, bug fixing, and unit test generation, benefiting from its \"Agentic\" capabilities for repository-scale understanding.",
        "actors": [
          "user-software-developer"
        ]
      },
      {
        "refId": "uc-translation",
        "name": "Content translation",
        "description": "Translating business, education, or other content or informational materials to other languages and dialects while maintaining the original tone and cultural nuances.",
        "actors": [
          "user-content-creator"
        ]
      },
      {
        "refId": "uc-support-triage",
        "name": "Customer support triage",
        "description": "Deploying low-latency chatbots for high-volume inquiries where the 7B model acts as a \"triage\" agent, answering common questions and only escalating complex logic to other support mechanisms.",
        "actors": [
          "user-support-architect"
        ]
      },
      {
        "refId": "uc-research-summarization",
        "name": "Research summarization and drafting",
        "description": "Summarizing long-form research papers and generating initial drafts for school projects, utilizing the model's long context window to ingest entire documents at once.",
        "actors": [
          "user-researcher"
        ]
      },
      {
        "refId": "uc-edge-device",
        "name": "On-device natural language control",
        "description": "Implementing the model on specialized hardware for real-time perception and reasoning to help an intelligent device navigate and interact with its environment based on natural language commands.",
        "actors": [
          "user-edge-engineer"
        ]
      },
      {
        "refId": "uc-security-log-analysis",
        "name": "Self-hosted security log analysis",
        "description": "Running a self-hosted instance to analyze internal security logs for anomalies, ensuring that sensitive infrastructure data never leaves the organization's firewall.",
        "actors": [
          "user-security-analyst"
        ]
      },
      {
        "refId": "uc-local-assistant",
        "name": "Local personal assistant",
        "description": "Running a personal assistant locally on a laptop to answer questions or process private information such as emails or calendars without sending data to an external server.",
        "actors": [
          "user-local-ai"
        ]
      }
    ],
    "graphics": [
      {
        "refId": "graphic-qwen-benchmarks",
        "name": "Qwen Performance Benchmarks (spider diagram)",
        "description": "benchmark_score",
        "image": {
          "mediaType": "image/jpeg",
          "encoding": "base64",
          "content": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAA"
        }
      }
    ]
  },
  "perspectives": [
    {
      "refId": "perspective-model-card",
      "name": "Model Card",
      "description": "An abridged model card view of this AI/ML-BOM.",
      "domains": [
        "machine-learning",
        "transparency"
      ],
      "mappings": [
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject['name','version','description']",
          "nativeName": "Model Details",
          "relevance": "required",
          "weight": 1.0
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.licenses",
          "nativeName": "License",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.modelProperties.tasks",
          "nativeName": "Supported Tasks",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.modelProperties.architecture",
          "nativeName": "Architecture",
          "relevance": "recommended"
        },
        {
          "expression": "$.definitions.useCases[*]",
          "nativeName": "Intended Use",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.modelProperties.training",
          "nativeName": "Training Data",
          "relevance": "recommended",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.measurements[?(@.type)]",
          "nativeName": "Evaluation Results",
          "relevance": "recommended",
          "weight": 0.9
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.modelProperties.limitations",
          "nativeName": "Technical Limitations",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.risks.risks[?(@.domains[?(@.type=='ethical')])]",
          "nativeName": "Ethical Considerations",
          "relevance": "required",
          "weight": 0.9
        },
        {
          "expression": "$.risks.risks[?(@.domains[?(@.type=='fairness')])]",
          "nativeName": "Fairness Assessments",
          "relevance": "recommended"
        },
        {
          "expression": "$.inventories[?(@.subject.type=='machine-learning-model')].subject.measurements[?(@.activity)]",
          "nativeName": "Environmental Impact",
          "relevance": "recommended"
        }
      ]
    }
  ]
}
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
