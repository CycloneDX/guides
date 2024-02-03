# Dependencies
Dependencies between components in the components array are added to the dependencies array.

The two dependency types are:

implements: refers to crypto assets implemented, or statically available in a component. Examples are the algorithms provided by crypto libraries. A crypto asset 'implemented' by a component does not imply that it is in use.
uses: refers to crypto assets in use, or being referenced by other components. The referencing can be done by explicit function calls or by configuration at run time. Usage may change over time, so CBOMs always represent a snapshot at a given point in time.
A component can have a dependencies of both types implements and uses. A crypto asset A is considered as 'used' by component C if there is a used dependency path from C to A.

Note: In classic SBOM, a component represents a library, application, service, etc. that is used as a dependency within the application. Since for some crypto, e.g. the relationship between a protocol and the algorithms used, this relationship is not external but internal, we decided to express this relationship differently by using specific properties to reference assets rather than using the classical dependency implementation.


![Dependencies](./images/dependencies.svg)


The example shows an application (nginx) that uses the libssl cryptographic library. This library implements the TLSv1.2 protocol. The relationship between the application, the library and the protocol can be expressed by using the depenedencies properties of the SBOM standard.

Since a TLS protocol supports different cipher suites that include multiple algorithms, there should be a way to represent these relationships as part of the CBOM. Compared to adding the algorithms as "classic" dependencies to the protocol, we defined special property fields that allow referencing the deployment with additional meaning. The protocolProperties allow adding an array of algorithms to a cipher suite as part of the cipher suite array. By modeling and then referencing these algorithms, we can still have only one classical component at the SBOM level, but a subtree of crypto dependencies within the crypto asset components.

```json
TODO
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>