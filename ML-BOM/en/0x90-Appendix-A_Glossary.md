# Appendix A: Glossary

##### Tensor

In machine learning, the term tensor typically refers to data organized in a multidimensional array (M-way array), informally referred to as a "data tensor". Relational observations and concepts, established via ML model training of text, images, movies, sounds, and more can be stored in these "data tensors", and further analyzed either by artificial neural networks or tensor methods. [1]

[1] [Wikipedia - Tensor (machine learning)](https://en.wikipedia.org/wiki/Tensor_(machine_learning))

---

##### Transformer

Transformers are a type of neural network architecture that transforms or changes an input sequence into an output sequence. They do this by learning context and tracking relationships between sequence components. [1]

The transformer's neural network architecture takes input data converts it to numerical representations called tokens, and each token is converted into a vector via lookup from an embedding table. At each layer of the neural network, each token is then contextualized within the scope of the context window with other (unmasked) tokens via a parallel multi-head attention mechanism, allowing the signal for key tokens to be amplified and less important tokens to be diminished.  After one or many iterations through the neural network, the output tokens can then be converted back into consumable output. [2]

[1] [AWS - What are transformers in artificial intelligence?](https://aws.amazon.com/what-is/transformers-in-artificial-intelligence/)
[2] [Wikipedia - Transformer (deep learning)](https://en.wikipedia.org/wiki/Transformer_(deep_learning))

---

##### Natural Language Processing (NLP)

is the processing of natural language information by a computer. NLP is a subfield of computer science and is closely associated with artificial intelligence. NLP is also related to information retrieval, knowledge representation, computational linguistics, and linguistics more broadly.

Major processing tasks in an NLP system include: speech recognition, text classification, natural language understanding, and natural language generation. [1]

[1] [Wikipedia - Natural language processing](https://en.wikipedia.org/wiki/Natural_language_processing)


---

### Model formats

#### Huggingface Safetensors

Safetensors addresses security and efficiency limitations present in traditional Python serialization approaches like pickle, used by PyTorch. The format uses a restricted deserialization process to prevent code execution vulnerabilities.

A safetensors file contains:

* A metadata section saved in JSON format. This section contains information about all tensors in the model, such as their shape, data type, and name. It can optionally also contain custom metadata.
* A section for the tensor data.

[1] https://huggingface.co/blog/ngxson/common-ai-model-formats

#### GGUF (GPT-Generated Unified Format)

GGUF is an acronym for GPT-Generated Unified Format and was initially developed for the llama.cpp project. GGUF is a binary format designed for fast model loading and saving, and for ease of readability. Models are typically developed using PyTorch or another framework, and then converted to GGUF for use with GGML.

A GGUF file comprises:

* A metadata section organized in key-value pairs. This section contains information about the model, such as its architecture, version, and hyperparameters.
* A section for tensor metadata. This section includes details about the tensors in the model, such as their shape, data type, and name.
* Finally, a section containing the tensor data itself.

[1] https://huggingface.co/blog/ngxson/common-ai-model-formats

---

#### ONNX

Open Neural Network Exchange (ONNX) format offers a vendor-neutral representation of machine learning models. It is part of the ONNX ecosystem, which includes tools and libraries for interoperability between different frameworks like PyTorch, TensorFlow, and MXNet.

ONNX models are saved in a single file with the .onnx extension. Unlike GGUF or Safetensors, ONNX contains not only the model's tensors and metadata, but also the model's computation graph. [1]

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

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>
