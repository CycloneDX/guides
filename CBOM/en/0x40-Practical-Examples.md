# Practical Examples
Examples of assets typically cataloged within a CBOM include algorithms, keys, protocols, and certificates, each with 
associated metadata crucial for effective management and security. Algorithms refer to the mathematical functions 
utilized for encryption, hashing, and digital signatures, while keys encompass cryptographic keys used for encryption, 
decryption, and authentication. Protocols delineate the rules and procedures governing secure communication between 
entities, and certificates authenticate the identities of entities within a cryptographic system. Associated CBOM metadata
includes details such as algorithm versions, key lengths, protocol configurations, and certificate attributes, providing 
comprehensive insights necessary for the management and security of cryptographic assets.

## Algorithm
A cryptographic algorithm is added in the components array of the BOM. The examples below list the algorithm 
AES-128-GCM-128-12 and RSA-PKCS1-1.5-SHA-512-2048.

```json
  "components": [
    {
      "type": "cryptographic-asset",
      "name": "AES-128-GCM-128-12",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "algorithmFamily": "AES",
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
      "name": "RSA-PKCS1-1.5-SHA-512-2048",
      "type": "cryptographic-asset",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "algorithmFamily": "RSASSA-PKCS1",
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
A complete example can be found at [https://cyclonedx.org/shortcut/example/algorithm](https://cyclonedx.org/shortcut/example/algorithm)  

An example with the QSC Signature algorithm ML-DSA-44 is listed below.

```json
"components": [ {
    "name": "ML-DSA-44",
    "type": "cryptographic-asset",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "algorithmFamily": "ML-DSA",
        "primitive": "signature",
        "executionEnvironment": "software-plain-ram",
        "implementationPlatform": "x86_64",
        "certificationLevel": [ "none" ],
        "cryptoFunctions": ["keygen", "sign", "verify"],
        "nistQuantumSecurityLevel": 1
      },
      "oid": "2.16.840.1.101.3.4.3.17"
    }
  } ]
```

An example with a hybrid scheme combining ML-KEM-1024 and ECDH-secp521r1 is listed below. The relation between the combiner `draftietftlshybriddesign13` and the algorithms is expressed as dependency.

```json
  "components": [
    {
      "name": "ECDH-secp521r1",
      "bom-ref": "ecdhsecp521r1",
      "type": "cryptographic-asset",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "algorithmFamily": "ECDH",
          "ellipticCurve": "secg/secp521r1",
          "primitive": "key-agree",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "certificationLevel": [ "none" ],
          "cryptoFunctions": [ "keygen", "keyderive" ],
          "nistQuantumSecurityLevel": 0
        },
        "oid": "1.3.132.0.35"
      }
    },
    {
      "name": "ML-KEM-1024",
      "bom-ref": "mlkem1024",
      "type": "cryptographic-asset",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "algorithmFamily": "ML-KEM",
          "primitive": "kem",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "certificationLevel": [ "none" ],
          "cryptoFunctions": [ "keygen", "keyderive" ],
          "nistQuantumSecurityLevel": 5
        },
        "oid": "2.16.840.1.101.3.4.1.48"
      }
    },
    {
      "name": "draft-ietf-tls-hybrid-design-13",
      "bom-ref": "draftietftlshybriddesign13",
      "type": "cryptographic-asset",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "primitive": "combiner",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "certificationLevel": [ "none" ],
          "cryptoFunctions": [ "keygen", "keyderive" ],
          "nistQuantumSecurityLevel": 0
        },
        "oid": "1.3.101.110"
     }
    }
  ],
  "dependencies": [
    {
      "ref": "draftietftlshybriddesign13",
      "dependsOn": ["mlkem1024", "ecdhsecp521r1"]
    }
  ]
```

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
        "creationDate": "2024-01-01T00:00:00.000Z",
        "activationDate": "2024-01-02T00:00:00.000Z",
        "updateDate": "2024-01-03T00:00:00.000Z",
        "expirationDate": "2026-01-01T00:00:00.000Z",
        "size": 2048,
        "format": "PKCS#8",
        "securedBy": {
          "mechanism": "Software",
          "algorithmRef": "crypto/algorithm/aes-128-gcm@2.16.840.1.101.3.4.1.6"
        },
        "creationDate": "2016-11-21T08:00:00Z",
        "activationDate": "2016-11-21T08:20:00Z"
      },
      "oid": "1.2.840.113549.1.1.1"
    }
  }, {
    "name": "RSA-PSS-SHA-256-32-2048",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/rsa-2048@1.2.840.113549.1.1.1",
    "cryptoProperties": { ... }
  }, {
    "name": "AES-128-GCM-16-12",
    "type": "cryptographic-asset",
    "bom-ref": "crypto/algorithm/aes-128-gcm@2.16.840.1.101.3.4.1.6",
    "cryptoProperties": { ... }
  } 
]
```
A complete example can be found at [https://cyclonedx.org/shortcut/example/key](https://cyclonedx.org/shortcut/example/key)


## Protocol
The following example lists an instance of the TLS v1.2 protocol with a number of cipher suites.

```json
  "components": [
    {
      "name": "google.com",
      "type": "cryptographic-asset",
      "bom-ref": "c9c7ac91-2115-45e8-ae13-7d0e1dec74be",
      "cryptoProperties": {
        "assetType": "certificate",
        "certificateProperties": {
          "serialNumber": "1234567890ABCDEF",
          "subjectName": "CN = www.google.com",
          "issuerName": "C = US, O = Google Trust Services LLC, CN = GTS CA 1C3",
          "notValidBefore": "2016-11-21T08:00:00Z",
          "notValidAfter": "2017-11-22T07:59:59Z",
          "certificateFormat": "X.509",
          "certificateFileExtension": "crt",
          "fingerprint": {
            "alg": "SHA-256",
            "content": "1e15e0fbd3ce95bde5945633ae96add551341b11e5bae7bba12e98ad84a5beb4"
          },
          "certificateState": [
            {
              "state": "active",
              "reason": "Certificate is currently valid and in use"
            }
          ],
          "creationDate": "2016-11-21T07:30:00Z",
          "activationDate": "2016-11-21T08:00:00Z",
          "relatedCryptographicAssets": [
            {
              "type": "algorithm",
              "ref": "6b00f384-6c39-420f-91eb-94de0f7be569RR"
            },
            {
              "type": "publicKey",
              "ref": "ceb37320-8239-40e8-ab77-8798dbd98773"
            }
          ]
        },
        "oid": "2.5.4.3"
      }
    },
    {
      "name": "SHA512withRSA",
      "type": "cryptographic-asset",
      "bom-ref": "6b00f384-6c39-420f-91eb-94de0f7be569",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "primitive": "signature",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "certificationLevel": [
            "none"
          ],
          "padding": "pkcs1v15",
          "cryptoFunctions": [
            "sign",
            "verify"
          ]
        },
        "oid": "1.2.840.113549.1.1.13"
      }
    },
    {
      "name": "RSA-2048",
      "type": "cryptographic-asset",
      "bom-ref": "ceb37320-8239-40e8-ab77-8798dbd98773",
      "cryptoProperties": {
        "assetType": "related-crypto-material",
        "relatedCryptoMaterialProperties": {
          "type": "public-key",
          "id": "2e9ef09e-dfac-4526-96b4-d02f31af1b22",
          "state": "active",
          "size": 2048,
          "format": "PEM",
          "value": "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA...\n-----END PUBLIC KEY-----",
          "creationDate": "2016-11-21T08:00:00Z",
          "activationDate": "2016-11-21T08:20:00Z",
          "updateDate": "2016-11-21T08:00:00Z",
          "expirationDate": "2017-11-22T07:59:59Z",
          "securedBy": {
            "mechanism": "None"
          },
          "fingerprint": {
            "alg": "SHA-256",
            "content": "a1b2c3d4e5f6789012345678901234567890abcdef1234567890abcdef123456"
          },
          "relatedCryptographicAssets": [
            {
              "type": "algorithm",
              "ref": "a154af0a-0dca-4ed5-b611-2405a3a6ae47"
            }
          ]
        },
        "oid": "1.2.840.113549.1.1.1"
      }
    },
    {
      "name": "RSA-2048",
      "type": "cryptographic-asset",
      "bom-ref": "a154af0a-0dca-4ed5-b611-2405a3a6ae47",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "primitive": "pke",
          "algorithmFamily": "RSAES-OAEP",
          "parameterSetIdentifier": "2048",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "certificationLevel": [
            "none"
          ],
          "padding": "oaep",
          "cryptoFunctions": [
            "encrypt",
            "decrypt"
          ]
        },
        "oid": "1.2.840.113549.1.1.1"
      }
    },
    {
      "name": "TLS 1.3 Protocol",
      "type": "cryptographic-asset",
      "bom-ref": "a3553dc1-f376-43d1-89dc-87bb71981c0c",
      "cryptoProperties": {
        "assetType": "protocol",
        "protocolProperties": {
          "type": "tls",
          "version": "1.3",
          "cipherSuites": [
            {
              "name": "TLS_AES_256_GCM_SHA384",
              "algorithms": [
                "1977d71b-8981-4292-b40d-842a019c2229",
                "422fa336-b401-42b7-89b8-8966aa30bca0"
              ],
              "identifiers": [
                "0x13,0x02"
              ]
            },
            {
              "name": "TLS_CHACHA20_POLY1305_SHA256",
              "algorithms": [
                "1af4fc08-5d0d-436e-8058-eeef921983d0",
                "6af3066b-ab66-4593-975f-d9ba2c623a89"
              ],
              "identifiers": [
                "0x13,0x03"
              ]
            }
          ]
        },
        "oid": "1.3.6.1.5.5.7.3.1"
      }
    }
  ]
```
A complete example can be found at [https://cyclonedx.org/shortcut/example/protocol](https://cyclonedx.org/shortcut/example/protocol)

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>

## Certificate 
The following example details an advanced X.509 certificate in a CBOM.

```json
"components": [
    {
      "name": "revoked-internal-ca.example.com",
      "type": "cryptographic-asset",
      "bom-ref": "840ADC47-55CD-44C6-A306-B37A9149B066",
      "cryptoProperties": {
        "assetType": "certificate",
        "certificateProperties": {
          "serialNumber": "ABCDEF1234567890FEDCBA",
          "subjectName": "CN = internal-ca.example.com, OU = IT Security, O = Example Corp, C = US",
          "issuerName": "CN = Example Root CA, O = Example Corp, C = US",
          "notValidBefore": "2023-01-01T00:00:00Z",
          "notValidAfter": "2025-12-31T23:59:59Z",
          "certificateFormat": "X.509",
          "certificateFileExtension": "pem",
          "fingerprint": {
            "alg": "SHA-256",
            "content": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
          },
          "certificateState": [
            {
              "state": "revoked",
              "reason": "Certificate was compromised due to private key exposure in security incident #2024-001"
            }
          ],
          "creationDate": "2022-12-15T10:00:00Z",
          "activationDate": "2023-01-01T00:00:00Z",
          "revocationDate": "2024-01-10T15:45:30Z",
          "certificateExtensions": [
            {
              "commonExtensionName": "basicConstraints",
              "commonExtensionValue": "CA:TRUE, pathlen:2"
            },
            {
              "commonExtensionName": "keyUsage",
              "commonExtensionValue": "Certificate Sign, CRL Sign, Digital Signature"
            },
            {
              "commonExtensionName": "extendedKeyUsage",
              "commonExtensionValue": "TLS Web Server Authentication, TLS Web Client Authentication"
            },
            {
              "commonExtensionName": "subjectAlternativeName",
              "commonExtensionValue": "DNS:internal-ca.example.com, DNS:ca.internal.example.com, IP:192.168.1.100"
            },
            {
              "commonExtensionName": "authorityKeyIdentifier",
              "commonExtensionValue": "keyid:01:02:03:04:05:06:07:08:09:0A:0B:0C:0D:0E:0F:10:11:12:13:14"
            },
            {
              "commonExtensionName": "subjectKeyIdentifier",
              "commonExtensionValue": "A1:B2:C3:D4:E5:F6:07:08:09:0A:0B:0C:0D:0E:0F:10:11:12:13:14"
            },
            {
              "commonExtensionName": "crlDistributionPoints",
              "commonExtensionValue": "URI:http://crl.example.com/root-ca.crl"
            },
            {
              "commonExtensionName": "authorityInformationAccess",
              "commonExtensionValue": "OCSP - URI:http://ocsp.example.com, CA Issuers - URI:http://certs.example.com/root-ca.crt"
            },
            {
              "commonExtensionName": "certificatePolicies",
              "commonExtensionValue": "Policy: 1.2.3.4.5.6.7.8.1, CPS: http://www.example.com/cps"
            },
            {
              "customExtensionName": "organizationalSecurityLevel",
              "customExtensionValue": "HIGH"
            },
            {
              "customExtensionName": "incidentTrackingId",
              "customExtensionValue": "SEC-2024-001"
            },
            {
              "customExtensionName": "complianceFramework",
              "customExtensionValue": "SOX, PCI-DSS Level 1, ISO 27001"
            }
          ],
          "relatedCryptographicAssets": [
            {
              "type": "algorithm",
              "ref": "2A0DA4D2-BBCA-4515-9BCD-C870A3EA4CE8"
            },
            {
              "type": "publicKey",
              "ref": "ACCAF8BC-5F73-4869-A3FE-1C64E8D96408"
            }
          ]
        },
        "oid": "2.5.4.3"
      }
    },
    {
      "name": "active-server.example.com",
      "type": "cryptographic-asset",
      "bom-ref": "4497B977-4D07-4245-9457-C2CF37FF399A",
      "cryptoProperties": {
        "assetType": "certificate",
        "certificateProperties": {
          "serialNumber": "1122334455667788AABBCCDD",
          "subjectName": "CN = server.example.com, OU = Web Services, O = Example Corp, C = US",
          "issuerName": "CN = Example Intermediate CA, O = Example Corp, C = US",
          "notValidBefore": "2024-01-01T00:00:00Z",
          "notValidAfter": "2025-01-01T23:59:59Z",
          "certificateFormat": "X.509",
          "certificateFileExtension": "crt",
          "fingerprint": {
            "alg": "SHA-256",
            "content": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
          },
          "certificateState": [
            {
              "name": "monitored",
              "description": "Certificate is under enhanced monitoring due to recent security incidents",
              "reason": "Proactive monitoring following organizational security policy updates"
            }
          ],
          "creationDate": "2023-12-20T09:00:00Z",
          "activationDate": "2024-01-01T00:00:00Z",
          "certificateExtensions": [
            {
              "commonExtensionName": "keyUsage",
              "commonExtensionValue": "Digital Signature, Key Encipherment"
            },
            {
              "commonExtensionName": "extendedKeyUsage",
              "commonExtensionValue": "TLS Web Server Authentication"
            },
            {
              "commonExtensionName": "subjectAlternativeName",
              "commonExtensionValue": "DNS:server.example.com, DNS:www.server.example.com, DNS:api.server.example.com"
            },
            {
              "commonExtensionName": "signedCertificateTimestamp",
              "commonExtensionValue": "Log ID: ABCD1234..., Timestamp: 2024-01-01T00:00:00Z, Signature: 3045022100..."
            },
            {
              "customExtensionName": "deploymentEnvironment",
              "customExtensionValue": "PRODUCTION"
            },
            {
              "customExtensionName": "businessCriticality",
              "customExtensionValue": "CRITICAL"
            },
            {
              "customExtensionName": "autoRenewalEnabled",
              "customExtensionValue": "true"
            }
          ],
          "relatedCryptographicAssets": [
            {
              "type": "algorithm",
              "ref": "14478B86-9306-45B5-BA2A-1660B723244C"
            },
            {
              "type": "publicKey",
              "ref": "F1F3D902-0A1B-4C0C-9F6A-F36E041B0B7D"
            }
          ]
        },
        "oid": "2.5.4.3"
      }
    },
    {
      "name": "RSA-SHA256",
      "type": "cryptographic-asset",
      "bom-ref": "2A0DA4D2-BBCA-4515-9BCD-C870A3EA4CE8",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "primitive": "signature",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "padding": "pkcs1v15",
          "cryptoFunctions": ["sign", "verify"]
        },
        "oid": "1.2.840.113549.1.1.11"
      }
    },
    {
      "name": "ECDSA-P256",
      "type": "cryptographic-asset",
      "bom-ref": "14478B86-9306-45B5-BA2A-1660B723244C",
      "cryptoProperties": {
        "assetType": "algorithm",
        "algorithmProperties": {
          "primitive": "signature",
          "curve": "secp256r1",
          "executionEnvironment": "software-plain-ram",
          "implementationPlatform": "x86_64",
          "certificationLevel": ["fips140-3-l1"],
          "cryptoFunctions": ["sign", "verify"]
        },
        "oid": "1.2.840.10045.4.3.2"
      }
    },
    {
      "name": "RSA-4096-Revoked-CA-Key",
      "type": "cryptographic-asset",
      "bom-ref": "ACCAF8BC-5F73-4869-A3FE-1C64E8D96408",
      "cryptoProperties": {
        "assetType": "related-crypto-material",
        "relatedCryptoMaterialProperties": {
          "type": "public-key",
          "id": "revoked-ca-key-2024",
          "state": "compromised",
          "size": 4096,
          "format": "PEM",
          "value": "-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA...\n-----END PUBLIC KEY-----",
          "creationDate": "2022-12-15T10:00:00Z",
          "activationDate": "2023-01-01T00:00:00Z",
          "updateDate": "2024-01-10T15:45:30Z",
          "securedBy": {
            "mechanism": "HSM",
            "algorithmRef": "aes-256-gcm-ref"
          },
          "fingerprint": {
            "alg": "SHA-256",
            "content": "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08"
          },
          "relatedCryptographicAssets": [
            {
              "type": "algorithm",
              "ref": "2A0DA4D2-BBCA-4515-9BCD-C870A3EA4CE8"
            }
          ]
        },
        "oid": "1.2.840.113549.1.1.1"
      }
    },
    {
      "name": "ECDSA-P256-Server-Key",
      "type": "cryptographic-asset",
      "bom-ref": "F1F3D902-0A1B-4C0C-9F6A-F36E041B0B7D",
      "cryptoProperties": {
        "assetType": "related-crypto-material",
        "relatedCryptoMaterialProperties": {
          "type": "public-key",
          "id": "server-key-2024",
          "state": "active",
          "size": 256,
          "format": "PEM",
          "value": "-----BEGIN PUBLIC KEY-----\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE...\n-----END PUBLIC KEY-----",
          "creationDate": "2023-12-20T09:00:00Z",
          "activationDate": "2024-01-01T00:00:00Z",
          "expirationDate": "2025-01-01T23:59:59Z",
          "securedBy": {
            "mechanism": "HSM",
            "algorithmRef": "aes-256-gcm-ref"
          },
          "fingerprint": {
            "alg": "SHA-256",
            "content": "d4e5f67890123456789abcdef0123456789abcdef0123456789abcdef0123456"
          },
          "relatedCryptographicAssets": [
            {
              "type": "algorithm",
              "ref": "14478B86-9306-45B5-BA2A-1660B723244C"
            }
          ]
        },
        "oid": "1.2.840.10045.2.1"
      }
    }
  ]
```

## Cryptographic configuration with CBOM and OBOM

The following example presents an Operations Bill of Materials (OBOM) in which cryptographic assets are configured through an OpenSSL 3 configuration file.

```json
"components": [ 
  {
    "name": "ML-KEM-768",
    "type": "cryptographic-asset",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "algorithmFamily": "ML-DSA",
        "primitive": "kem",
        "executionEnvironment": "software-plain-ram",
        "cryptoFunctions": ["keygen", "encapsulate", "decapsulate"],
        "nistQuantumSecurityLevel": 3
      }
    }
  },
  {
    "name": "x25519",
    "type": "cryptographic-asset",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "algorithmFamily": "ECDH",
        "primitive": "key-agree",
        "executionEnvironment": "software-plain-ram",
        "cryptoFunctions": ["keygen", "keyderive"],
        "nistQuantumSecurityLevel": 0
      }
    }
  },
  {
    "name": "ECDH-P-256",
    "type": "cryptographic-asset",
    "cryptoProperties": {
      "assetType": "algorithm",
      "algorithmProperties": {
        "algorithmFamily": "ECDH",
        "primitive": "key-agree",
        "executionEnvironment": "software-plain-ram",
        "cryptoFunctions": ["keygen", "keyderive"],
        "nistQuantumSecurityLevel": 0
      }
    }
  },
  {
    "name": "openssl-config",
    "type": "data",
    "data": {
      "bom-ref": "config-001",
      "type": "configuration",
      "url": "/etc/openssl/ssl/openssl.cnf",
      "contents": {
        "attachment": {
          "contentType": "text/plain",
          "encoding": "utf8",
          "content": "DEFAULT_GROUPS	= x25519:SecP256r1MLKEM768"
        }
      }
    }
  },
  "dependencies": [
    {
      "ref": "ML-KEM-768",
      "dependsOn": ["openssl-config"]
    },
    {
      "ref": "x25519",
      "dependsOn": ["openssl-config"]
    },
    {
      "ref": "ECDH-P-256",
      "dependsOn": ["openssl-config"]
    }
  ]
]
```

## Hardware BOM with cryptographic assets

The following example describes a Hardware Security Module (HSM) with dependencies to cryptographic assets.

```json
{
    "bomFormat": "CycloneDX",
    "specVersion": "1.7",
    "version": 1,
    "metadata": {
        "timestamp": "2025-08-27T09:21:22.948466Z",
        "component": {
            "type": "device",
            "name": "Hardware Security Module",
            "version": "1.0",
            "bom-ref": "hsm-001"
        }
    },
    "components": [
        {
          "type": "device",
          "bom-ref": "crypto-processor-001",
          "name": "cryptoprocessor",
          "supplier": {
            "name": "CryptoSuperSecure Inc."
          },
          "version": "3.2",
          "description": "Cryptographic Co-processor, Post-Quantum Enabled",
          "properties": [
            {
              "name": "cdx:device:quantity",
              "value": "4"
            },
            {
              "name": "cdx:device:function",
              "value": "coprocessor"
            },
            {
              "name": "cdx:device:location",
              "value": "mainboard"
            },
            {
              "name": "cdx:device:deviceType",
              "value": "smd"
            },
            {
              "name": "cdx:device:lotNumber",
              "value": "1234-4567"              
            }
          ]
        },
        {
          "type": "device",
          "bom-ref": "secure-memory-001",
          "name": "memory",
          "version": "1.0",
          "description": "Secure Memory Module",
          "properties": [
            {
              "name": "cdx:device:quantity",
              "value": "4"
            },
            {
              "name": "cdx:device:function",
              "value": "memory"
            },
            {
              "name": "cdx:device:location",
              "value": "mainboard"
            },
            {
              "name": "cdx:device:deviceType",
              "value": "smd"
            }
          ]
        },
        {
          "type": "device",
          "bom-ref": "tamper-detect-001",
          "name": "tamper",
          "version": "2.1",
          "description": "Tamper Detection Circuit",
          "properties": [
            {
              "name": "cdx:device:quantity",
              "value": "1"
            },
            {
              "name": "cdx:device:function",
              "value": "tamper-detection"
            },
            {
              "name": "cdx:device:location",
              "value": "mainboard"
            },
            {
              "name": "cdx:device:deviceType",
              "value": "smd"
            }
          ]
        },
        {
          "type": "device",
          "bom-ref": "hrng-001",
          "name": "trng",
          "version": "2.1",
          "description": "Hardware true random number generator",
          "properties": [
            {
              "name": "cdx:device:quantity",
              "value": "1"
            },
            {
              "name": "cdx:device:function",
              "value": "trng"
            },
            {
              "name": "cdx:device:location",
              "value": "mainboard"
            },
            {
              "name": "cdx:device:deviceType",
              "value": "smd"
            }
          ]
        },
        {
          "name": "ML-DSA-87",
          "type": "cryptographic-asset",
          "cryptoProperties": {
            "assetType": "algorithm",
            "algorithmProperties": {
              "algorithmFamily": "ML-DSA",
              "primitive": "signature",
              "executionEnvironment": "hardware",
              "implementationPlatform": "other",
              "certificationLevel": [ "fips140-3-l3" ],
              "cryptoFunctions": ["keygen", "sign", "verify"],
              "nistQuantumSecurityLevel": 5
            },
            "oid": "2.16.840.1.101.3.4.3.19"
          }
        },
        {
          "name": "SLH-DSA-SHA2-256s",
          "type": "cryptographic-asset",
          "cryptoProperties": {
            "assetType": "algorithm",
            "algorithmProperties": {
              "algorithmFamily": "SLH-DSA",
              "primitive": "signature",
              "executionEnvironment": "hardware",
              "implementationPlatform": "other",
              "certificationLevel": [ "fips140-3-l3" ],
              "cryptoFunctions": ["keygen", "sign", "verify"],
              "nistQuantumSecurityLevel": 5
            },
            "oid": "2.16.840.1.101.3.4.3.39"
          }
        },
        {
          "name": "AES-256-Wrap-PAD",
          "type": "cryptographic-asset",
          "cryptoProperties": {
            "assetType": "algorithm",
            "algorithmProperties": {
              "algorithmFamily": "AES",
              "primitive": "key-wrap",
              "executionEnvironment": "hardware",
              "implementationPlatform": "other",
              "certificationLevel": [ "fips140-3-l3" ],
              "cryptoFunctions": ["encrypt", "decrypt", "other"],
              "nistQuantumSecurityLevel": 5
            }
          }
        }

    ],
    "dependencies": [
    {
      "ref": "crypto-processor-001",
      "provides": ["ML-DSA-87", "SLH-DSA-SHA2-256s", "AES-256-Wrap-PAD"]
    }
  ]
}
```


A complete example can be found at [https://cyclonedx.org/shortcut/example/cert](https://cyclonedx.org/shortcut/example/cert)

<div style="page-break-after: always; visibility: hidden">
\newpage
</div>