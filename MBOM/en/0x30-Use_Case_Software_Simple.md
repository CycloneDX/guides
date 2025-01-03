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

The application can be built by running the following command in the terminal:

```
$ make build
```

which would cause the Makefile's `build` target (task) to be executed which would, in turn, case the dependent `clean` and `hello` targets to be executed in order and result in the creation of an executable file called `hello`.

## MLBOM Representation

