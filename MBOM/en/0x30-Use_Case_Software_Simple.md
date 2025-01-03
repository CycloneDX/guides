## Use Case: Simple software application

This example shows how a simple `helloworld` application's build process can be captured by an MLBOM. 

The application itself is composed a sing;le "C" source file, `helloworld.c`, which contains the following code:

```
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```

The application is built using the GCC compiler using the following `Makefile`:

```

```