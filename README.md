# Intel 64-bit Assembly Functions Library

This repository contains a collection of assembly language functions written for the Intel 64 architecture. These functions are optimized for performance and provide low-level access to system resources.

## Features

- **Optimized Performance:** The assembly language functions are carefully crafted to leverage the full potential of the Intel 64 architecture, providing high-performance computation.
- **Modular Design:** Each function is designed to be modular and easily integrable into your projects, allowing you to utilize specific functionalities without unnecessary overhead.
- **Static Library Compilation:** Included Makefile allows for easy compilation of the library into a static library (`libasm.a`), simplifying integration into your projects.
- **Unit Testing:** The Makefile also includes a target to compile a unit test (`main.c`) to thoroughly test the functionality of the assembly library.

## Usage

### Compilation

To compile the static library `libasm.a`, simply execute:

```bash
make
```

This will generate the static library `libasm.a` that you can link with your projects.

### Unit Testing

To compile the unit test `main.c` for testing the assembly library, execute:

```bash
make test
```

This will compile `main.c` along with the `libasm.a` library to create an executable for unit testing.
