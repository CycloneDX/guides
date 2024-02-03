# Practical Examples
Examples of assets typically cataloged within a CBOM include algorithms, keys, protocols, and certificates, each with 
associated metadata crucial for effective management and security. Algorithms refer to the mathematical functions 
utilized for encryption, hashing, and digital signatures, while keys encompass cryptographic keys used for encryption, 
decryption, and authentication. Protocols delineate the rules and procedures governing secure communication between 
entities and certificates authenticate the identities of entities within a cryptographic system. Associated CBOM metadata
includes details such as algorithm versions, key lengths, protocol configurations, and certificate attributes, providing 
comprehensive insights necessary for the management and security of cryptographic assets.

## Algorithm
A cryptographic algorithm is added in the components array of the BOM. The examples below lists the algorithm 
AES-128-GCM and SHA512withRSA.

```json
"components": [
  {
    "type": "cryptographic-asset",
    "name": "AES-128-GCM",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "primitive": "ae",
        "parameterSetIdentifier": "128",
        "mode": "gcm",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "keygen", "encrypt", "decrypt", "tag" ],
        "classicalSecurityLevel": 128,
        "nistQuantumSecurityLevel": 1
      },
      "oid": "2.16.840.1.101.3.4.1.6"
    }
  },
  {
    "name": "SHA512withRSA",
    "type": "cryptographic-asset",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "primitive": "signature",
        "parameterSetIdentifier": "512",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "sign", "verify" ],
        "nistQuantumSecurityLevel": 0
      },
      "oid": "1.2.840.113549.1.1.13"
    }
  }
]
```

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

An example with the QSC Signature algorithm Dilithium5 is listed below.

```json
"components": [
  {
    "name": "Dilithium5",
    "type": "cryptographic-asset",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "primitive": "signature",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": ["keygen", "sign", "verify"],
        "nistQuantumSecurityLevel": 5
      },
      "oid": "1.3.6.1.4.1.2.267.7.8.7"
    }
  }
]
```
<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

## Key
The following example demonstrates how an RSA-2048 public key can be included in a CBOM.

```json
"components": [ {
    "name": "RSA-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/key/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": {
      "assetType": "related-crypto-material",
      "relatedCryptoMaterialProperties": {
        "type": "public-key",
        "id": "2e9ef09e-dfac-4526-96b4-d02f31af1b22",
        "state": "active",
        "size": 2048,
        "algorithmRef": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
        "securedBy": {
          "mechanism": "Software",
          "algorithmRef": "crypto/algorithm/aes-128-gcm@2.16.840.1.101.3.4.1.6"
        },
        "creationDate": "2016-11-21T08:00:00Z",
        "activationDate": "2016-11-21T08:20:00Z"
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  }, 
  {
    "name": "RSA-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "2048",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "cryptoFunctions": [ "encapsulate", "decapsulate" ]
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  }, 
  {
    "name": "AES-128-GCM",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/aes-128-gcm@2.16.840.1.101.3.4.1.6",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "128",
        "primitive": "ae",
        "mode": "gcm",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "cryptoFunctions": [ "keygen", "encrypt", "decrypt" ],
        "classicalSecurityLevel": 128,
        "nistQuantumSecurityLevel": 1
      },
      "oid": "2.16.840.1.101.3.4.1.6"
    }
  } ]
```

## Protocol
A cryptographic protocol is added to the components array of the BOM. The example below lists an instance of the protocol TLS v1.2 with a number of TLS cipher suites.

```json
"components": [
  {
    "name": "TLSv1.2",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/protocol/tls@1.2",
    "cryptoProperties": {
      "assetType": "protocol",
      "protocolProperties": {
        "type": "tls",
        "version": "1.2",
        "cipherSuites": [
          {
            "name": "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
            "algorithms": [
              "crypto/algorithm/ecdh-curve25519@1.3.132.1.12",
              "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
              "crypto/algorithm/aes-128-gcm@2.16.840.1.101.3.4.1.6",
              "crypto/algorithm/sha-384@2.16.840.1.101.3.4.2.9"
            ],
            "identifiers": [ "0xC0", "0x30" ]
          }
        ],
        "cryptoRefArray": [
          "crypto/certificate/google.com@sha256:1e15e0fbd3ce95bde5945633ae96add551341b11e5bae7bba12e98ad84a5beb4"
        ]
      },
      "oid": "1.3.18.0.2.32.104"
    }
  },
  {
    "name": "google.com",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/certificate/google.com@sha256:1e15e0fbd3ce95bde5945633ae96add551341b11e5bae7bba12e98ad84a5beb4",
    "cryptoProperties": {
      "assetType": "certificate",
      "certificateProperties": {
        "subjectName": "CN = www.google.com",
        "issuerName": "C = US, O = Google Trust Services LLC, CN = GTS CA 1C3",
        "notValidBefore": "2016-11-21T08:00:00Z",
        "notValidAfter": "2017-11-22T07:59:59Z",
        "signatureAlgorithmRef": "crypto/algorithm/sha512-rsa@1.2.840.113549.1.1.13",
        "subjectPublicKeyRef": "crypto/key/rsa2048@1.2.840.113549.1.1.1",
        "certificateFormat": "X.509",
        "certificateExtension": "crt"
      }
    }
  },
  {
    "name": "SHA512withRSA",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/sha-512-rsa@1.2.840.113549.1.1.13",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "512",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "digest" ],
        "nistQuantumSecurityLevel": 0
      },
      "oid": "1.2.840.113549.1.1.13"
    }
  },
  {
    "name": "RSA-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/key/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": {
      "assetType": "related-crypto-material",
      "relatedCryptoMaterialProperties": {
        "type": "public-key",
        "id": "2e9ef09e-dfac-4526-96b4-d02f31af1b22",
        "state": "active",
        "size": 2048,
        "algorithmRef": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
        "securedBy": {
          "mechanism": "Software",
          "algorithmRef": "crypto/algorithm/aes-128-gcm@2.16.840.1.101.3.4.1.6"
        },
        "creationDate": "2016-11-21T08:00:00Z",
        "activationDate": "2016-11-21T08:20:00Z"
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  },
  {
    "name": "ECDH",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/ecdh-curve25519@1.3.132.1.12",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "curve": "curve25519",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "keygen" ]
      },
      "oid": "1.3.132.1.12"
    }
  },
  {
    "name": "RSA-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "2048",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "encapsulate", "decapsulate" ]
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  },
  {
    "name": "AES-256-GCM",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/aes-256-gcm@2.16.840.1.101.3.4.1.46",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "256",
        "primitive": "ae",
        "mode": "gcm",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "encrypt", "decrypt" ],
        "classicalSecurityLevel": 128,
        "nistQuantumSecurityLevel": 1
      },
      "oid": "2.16.840.1.101.3.4.1.46"
    }
  },
  {
    "name": "SHA384",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/sha-384@2.16.840.1.101.3.4.2.9",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "384",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "digest" ],
        "nistQuantumSecurityLevel": 2
      },
      "oid": "2.16.840.1.101.3.4.2.9"
    }
  }
]
```

## Certificate 
The following example details an X.509 certificate in a CBOM.

```json
"components": [
  {
    "name": "google.com",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/certificate/google.com@sha256:1e15e0fbd3ce95bde5945633ae96add551341b11e5bae7bba12e98ad84a5beb4",
    "cryptoProperties": {
      "assetType": "certificate",
      "certificateProperties": {
        "subjectName": "CN = www.google.com",
        "issuerName": "C = US, O = Google Trust Services LLC, CN = GTS CA 1C3",
        "notValidBefore": "2016-11-21T08:00:00Z",
        "notValidAfter": "2017-11-22T07:59:59Z",
        "signatureAlgorithmRef": "crypto/algorithm/sha-512-rsa@1.2.840.113549.1.1.13",
        "subjectPublicKeyRef": "crypto/key/rsa-2048@1.2.840.113549.1.1.1",
        "certificateFormat": "X.509",
        "certificateExtension": "crt"
      }
    }
  },
  {
    "name": "SHA512withRSA",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/sha-512-rsa@1.2.840.113549.1.1.13",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "512",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "digest" ],
        "nistQuantumSecurityLevel": 0
      },
      "oid": "1.2.840.113549.1.1.13"
    }
  },
  {
    "name": "RSA-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/key/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": {
      "assetType": "related-crypto-material",
      "relatedCryptoMaterialProperties": {
        "type": "public-key",
        "id": "2e9ef09e-dfac-4526-96b4-d02f31af1b22",
        "state": "active",
        "size": 2048,
        "algorithmRef": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
        "securedBy": {
          "mechanism": "None"
        },
        "creationDate": "2016-11-21T08:00:00Z",
        "activationDate": "2016-11-21T08:20:00Z"
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  },
  {
    "name": "RSA-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "parameterSetIdentifier": "2048",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": [ "encapsulate", "decapsulate" ]
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  }
]
```


<div style="page-break-after: always; visibility: hidden">
\newpage
</div>