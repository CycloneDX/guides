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

TODO

### Tasks

TODO

### Workflow

TOD

### Formula

TODO

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
