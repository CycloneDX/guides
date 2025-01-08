## Use Case: Simple software application

This example shows how a simple `helloworld` application's build process can be captured by an MLBOM. 

### Workflow overview

#### Application source code

The application itself is composed a single "C" source file, `helloworld.c`, which contains the following code:

```
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```

#### Application Makefile

The application is built using the GCC compiler using the following `Makefile`:

```
CC = gcc
CFLAGS = -Wall

build: clean hello

hello: helloworld.c
    $(CC) $(CFLAGS) -o hello helloworld.c

clean:
    rm -f hello
```

#### Build process

The application can be built by manually running the following command in a terminal/shell of a suitable operating system:

```
$ make build
```

which would cause the Makefile's `build` target (task) to be executed which would, in turn, case the dependent `clean` and `hello` targets to be executed in order and result in the creation of an executable file called `hello`.

### Assumptions

When representing the manufacturing process in CycloneDX format, this example assumes:

* The formulation represents a local, manual build process that is executed on a single machine of source code already cloned from a GitHub repository.
* All referenced "tools" are already installed on the local system.
* For readability, component `name` values will use "short" names. For example, `helloworld.c` will be used instead of a best practice name `CycloneDX/MBOM-examples/simple-application-makefile/helloworld.c`; however, the corresponding `bom-ref` values will be based on the GitHub repository URL and commit hash to preserve uniqueness of identity.
* We will not attempt to encode the non-essential components for the Software Bill-of-Materials (SBOM) which is better show in other guides. For example use case, the "include" (header) file `stdio.h` is not represented.

## MBOM Representation

For effectively conveying the essential representation of the build process using the CycloneDX Formulation objects, this example will initially focus on capturing only the key build artifacts, tools, and information.  Then, we will show how additional information can be added to encode a more complete picture of the entire manufacturing process.

### Components

This section defines the essential `component` objects referenced in building the simple application.

#### Source components

- `helloworld.c`:
    </br>
    ```
    {
      "bom-ref": "file://github.com/CycloneDX/MBOM-examples/simple-application-makefile/helloworld.c",
      "type": "file",
      "name": "helloworld.c",
      "version": "1.0",
      "hashes": [
        {
          "alg": "SHA-256",
          "content": "..."
        }
      ]
    }
    ```

#### Build components

- `Makefile`
    </br>
    ```
    {
      "bom-ref": "file://github.com/CycloneDX/MBOM-examples/simple-application-makefile/Makefile",
      "type": "file",
      "name": "Makefile",
      "version": "1.0",
      "hashes": [
        {
          "alg": "SHA-256",
          "content": "..."
        }
      ]
    }
    ```

- `gcc` - GCC compiler
    </br>
    ```
    {
      "bom-ref": "file://Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/gcc",
      "type": "application",
      "name": "gcc",
      "version": "16.0.0 (clang-1600.0.26.4)"
    }
    ```

- `make` utility
    </br>
    ```
    {
      "bom-ref": "file://Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/make",
      "type": "application",
      "name": "GNU Make",
      "version": "3.81"
    }
    ```

### Trigger

In this example, the "trigger" event that starts the build process is a person manually executing the following command in a Bash command prompt:

```
make build
```

This would be the event would be represented as follows:

```
{
  "bom-ref": "urn:cdx:mbom:trigger:uuid:1a9b2c8d-9957-0414-0067-081678660a66",
  "uid": "1a9b2c8d-9957-0414-0067-081678660a66",
  "type": "manual",
  "name": "make trigger",
  "description": "Bash, command-line build trigger"
}
```

**Note**: *The `event` object is not shown in the `trigger` above as there is currently no clear method to represent a "human" resource as a `source` (or `target`). A proposal for this has been made for future versions of the core CycloneDX specification.*

### Tasks

In this example, there is only one logical "task"; that is, the build process initiated by the `make build` command step. This task itself can be represented as:

```
{
  "bom-ref": "urn:cdx:mbom:task:uuid:86bed8ad-f4b3-4e6c-913b-0912fce0d5a0",
  "uid": "86bed8ad-f4b3-4e6c-913b-0912fce0d5a0",
  "taskTypes": ["clean", "build"],
  "name": "make build task",
  "description": "A task that captures 'make build' step.",
  ...
}
```

As you can see we provide the two logical `taskType` values of `clean` and `build` to represent the logical steps the `make` command would perform as a result of resolving the target dependencies within the `Makefile`.

#### Adding steps to the task

The single command-line, build `step` can be added to the task:

```
{
  "bom-ref": "urn:cdx:mbom:task:uuid:86bed8ad-f4b3-4e6c-913b-0912fce0d5a0",
  "uid": "86bed8ad-f4b3-4e6c-913b-0912fce0d5a0",
  "name": "make build task",
  ...
  "steps": [
    {
      "name": "run make build",
      "commands": [ 
        {
          "executed": "make build"
        }
      ]
    }
  ]
}
```

The `trigger` defined previously can be added to the task as follows:

```
{
  "bom-ref": "urn:cdx:mbom:task:uuid:86bed8ad-f4b3-4e6c-913b-0912fce0d5a0",
  "uid": "86bed8ad-f4b3-4e6c-913b-0912fce0d5a0",
  "name": "make build task",
  ...
  "trigger": {
    "bom-ref": "urn:cdx:mbom:trigger:uuid:1a9b2c8d-9957-0414-0067-081678660a66",
    "uid": "1a9b2c8d-9957-0414-0067-081678660a66",
    "type": "manual",
    "name": "make trigger",
    "description": "Bash, command-line build trigger",
  },
  ...
}
```

### Workflow

In this example, the workflow represents the single `task` execution as follows:

```

```

### Formula

This `workflow` can then be packaged into a `formula` using the following syntax:

```

```

and placed under the CycloneDX BOM's `formulation` key:

```

```

---

## Advanced representation of the build process

For many security and compliance use cases, it is necessary to represent the runtime topology (i.e., the build or manufacturing platform) of a software application and allowing independent verification the process is repeatable.  This section shows how to add some of this information to the MBOM for this example. 

### Runtime topology

This section will show how to represent the runtime topology for the simple application's build process which includes a Bash shell running on a Mac OS X machine.

- `Bash` shell
    </br>
    ```
    {
      "bom-ref": "file://bin/bash",
      "type": "platform",
      "name": "GNU bash",
      "version": "3.2.57(1)-release (arm64-apple-darwin23)"
    }
    ```

- `OS X` operating system
    </br>
    ```
    {
      "bom-ref": "device://macosx@14.6.1+23G93",
      "type": "operating-system",
      "name": "macOS",
      "version": "14.6.1+23G93"
    }
    ```

### Hardware

- `Mac OS X` machine

  TODO
    </br>
    ```
    {
      "bom-ref": "TODO",
      "type": "device",
      "name": "GNU bash",
      "version": "TODO"
    }
    ```
