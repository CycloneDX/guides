# Appendix A: Glossary

- TBD

---

### Model formats

#### Huggingface Safetensors

Safetensors addresses security and efficiency limitations present in traditional Python serialization approaches like pickle, used by PyTorch. The format uses a restricted deserialization process to prevent code execution vulnerabilities.

A safetensors file contains:

* A metadata section saved in JSON format. This section contains information about all tensors in the model, such as their shape, data type, and name. It can optionally also contain custom metadata.
* A section for the tensor data.

[1] https://huggingface.co/blog/ngxson/common-ai-model-formats

#### GGUF

GGUF was initially developed for the llama.cpp project. GGUF is a binary format designed for fast model loading and saving, and for ease of readability. Models are typically developed using PyTorch or another framework, and then converted to GGUF for use with GGML.

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
