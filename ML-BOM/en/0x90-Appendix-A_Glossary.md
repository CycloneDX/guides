# Appendix A: Glossary

### General machine learning terms

##### Activation function

An activation function is a mathematical operation applied to a neuron's output to introduce nonlinearity, allowing the model to learn complex patterns beyond simple straight lines. It essentially determines whether and how much a neuron "fires" based on its weighted inputs. [1]

[1] [Activation functions in neural networks](https://www.youtube.com/watch?v=v1MhJs4A1i4&t=89s)

##### Computer Vision

Computer Vision is an area of artificial intelligence (AI) that enables computers to interpret, analyze, and extract meaningful information from digital images, videos, and other visual inputs. Using techniques such as deep learning and neural networks, these systems simulate human vision to identify objects, recognize patterns, and automate tasks across industries such as healthcare, autonomous driving, and security. [1]

[1] [IBM - What is computer vision?](https://www.ibm.com/think/topics/computer-vision)

##### F1 Score

The F-score or F-measure is a measure of predictive performance. It is calculated from the precision and recall of the test, where precision is the number of true positive results divided by the total number of samples predicted to be positive. The F1 score is the harmonic mean of precision and recall, symmetrically combining them into a single metric.

[1] [Wikipedia - F1 score](https://en.wikipedia.org/wiki/F-score)

##### Large Language Model (LLM)

A model trained with self-supervised machine learning on a vast amount of text, designed for [Natural Language Processing](#natural-language-processing-nlp) tasks, especially language generation. The largest and most capable LLMs are Generative Pre-trained [Transformers](#transformer) (GPTs) and provide the core capabilities of modern chatbots. LLMs can be fine-tuned for specific tasks or guided by prompt engineering. [1]

[1] [Wikipedia - Large language model](https://en.wikipedia.org/wiki/Large_language_model)

##### Neural network

A neural network consists of connected units or nodes called artificial neurons, which loosely model the neurons in the brain. Each artificial neuron receives signals from connected neurons, processes them, and sends signals to other connected neurons. The "signal" is a real number, and the output of each neuron is computed by some non-linear function of the totality of its inputs, called the [activation function](#activation-function). [1]

[1] [Wikipedia - Neural network (machine_learning)](https://en.wikipedia.org/wiki/Neural_network_(machine_learning))

##### Prompt engineering

The process of structuring or crafting an instruction in order to produce better outputs from a generative artificial intelligence (AI) model. It typically involves designing clear queries, adding relevant context, and refining wording to guide the model toward more accurate, useful, and consistent responses/ [1]

[1] [Wikipedia - prompt engineering](https://en.wikipedia.org/wiki/Prompt_engineering)

##### Quantization

A technique to reduce the computational and memory costs of running inference by representing the ([tensor](#tensor)) weights and [activations](#activation-function) with low-precision data types like 8-bit integer (int8) instead of the usual 32-bit floating point (float32). [1]

[1] [Hugging Face - Quantization](https://huggingface.co/docs/optimum/en/concept_guides/quantization#quantization)
[2] [GGUF - Quantization types](https://huggingface.co/docs/hub/en/gguf#quantization-types)

##### Tensor

In machine learning, a tensor typically refers to data organized as a multidimensional array (M-way array), informally called a "data tensor". Relational observations and concepts, established via ML model training of text, images, movies, sounds, and more, can be stored in these "data tensors" and further analyzed either by artificial neural networks or tensor methods. [1]

[1] [Wikipedia - Tensor (machine learning)](https://en.wikipedia.org/wiki/Tensor_(machine_learning))

##### Transformer

Transformers are a type of neural network architecture that transforms or changes an input sequence into an output sequence. They do this by learning context and tracking relationships between sequence components. [1]

The transformer's neural network architecture takes input data, converts it to numerical representations called tokens, and converts each token into a vector via a lookup in an embedding table. At each layer of the neural network, each token is then contextualized within the scope of the context window with other (unmasked) tokens via a parallel multi-head attention mechanism, allowing the signal for key tokens to be amplified and less important tokens to be diminished.  After one or many iterations through the neural network, the output tokens can then be converted back into consumable output. [2]

[1] [AWS - What are transformers in artificial intelligence?](https://aws.amazon.com/what-is/transformers-in-artificial-intelligence/)
[2] [Wikipedia - Transformer (deep learning)](https://en.wikipedia.org/wiki/Transformer_(deep_learning))

##### Natural Language Processing (NLP)

is the processing of natural language information by a computer. NLP is a subfield of computer science and is closely associated with artificial intelligence. NLP is also related to information retrieval, knowledge representation, computational linguistics, and linguistics more broadly.

Major processing tasks in an NLP system include: speech recognition, text classification, natural language understanding (NLU), and natural language generation. [1]

[1] [Wikipedia - Natural language processing](https://en.wikipedia.org/wiki/Natural_language_processing)

---

### Model format terms

#### Huggingface Safetensors

Safetensors addresses security and efficiency limitations present in traditional Python serialization approaches like pickle, used by PyTorch. The format uses a restricted deserialization process to prevent code execution vulnerabilities.

A safetensors file contains:

* A metadata section saved in JSON format. This section provides information on all tensors in the model, including their shapes, data types, and names. It can optionally also contain custom metadata.
* A section for the tensor data.* A section for the tensor data.

[1] https://huggingface.co/blog/ngxson/common-ai-model-formats

#### GGUF (GPT-Generated Unified Format)

GGUF is an acronym for GPT-Generated Unified Format and was initially developed for the llama.cpp project. GGUF is a binary format designed for fast model loading and saving, and for ease of readability. Models are typically developed using PyTorch or another framework, and then converted to GGUF for use with GGML.

A GGUF file comprises:

* A metadata section organized in key-value pairs. This section provides information about the model, including its architecture, version, and hyperparameters.
* A section for tensor metadata. This section provides details on the model's tensors, including their shapes, data types, and names.
* Finally, a section containing the tensor data itself.

[1] https://huggingface.co/blog/ngxson/common-ai-model-formats

---

#### ONNX

Open Neural Network Exchange (ONNX) format offers a vendor-neutral representation of machine learning models. It is part of the ONNX ecosystem, which includes tools and libraries for interoperability across frameworks such as PyTorch, TensorFlow, and MXNet.

ONNX models are saved in a single file with the .onnx extension. Unlike GGUF or Safetensors, ONNX contains not only the model's tensors and metadata but also its computation graph. [1]

The internal contents of an ONNX file generally include:

* **Model Metadata**: General information about the model, such as its name, a human-readable documentation string, the name and version of the tool that generated it (e.g., PyTorch), the ONNX Intermediate Representation (IR) version it uses, and the version of the operator sets it relies on.
* **Computation Graph**: This is the core of the ONNX model, representing the data flow and operations required for computation. It is structured as a topologically sorted, directed acyclic graph (DAG). The graph itself contains:
    * **Nodes**: Each node represents a specific operation (e.g., convolution, activation function, matrix multiplication).
    * **Inputs and Outputs**: These define the data (tensors) that enter and leave the overall graph, including information on their data types and shapes.
    * **Initializers** (Weights/Parameters): These are named, constant tensor values that define the pre-trained weights and biases of the model. When an initializer has the same name as a graph input, it serves as a default value.
    * **Value Information**: Optional information regarding the types and shapes of intermediate values (tensors) produced and consumed within the graph.

* **Operator Sets** (Opsets): A model specifies the collection of operator sets (identified by a domain and version number) that define the available operators and their semantics (behavior). This ensures consistency across different runtimes.
* **Functions** (Optional): An optional list of functions local to the model, which are custom operators defined as a sub-graph of other, more primitive ONNX operators. [2, 3, 4, 5, 6]

[1] https://huggingface.co/blog/ngxson/common-ai-model-formats
[2] https://www.tutorialspoint.com/onnx/onnx-file-format.htm
[3] https://www.ultralytics.com/glossary/onnx-open-neural-network-exchange
[4] https://nx.docs.scailable.net/for-data-scientists/about-onnx
[5] https://mmapped.blog/posts/37-onnx-intro
[6] https://github.com/onnx/onnx/blob/main/docs/IR.md
