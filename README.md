# 1. Project Overview

![CI Windows Preconditioner Build](https://github.com/rlv-iith/sundials-preconditioned-solver/actions/workflows/main.yml/badge.svg)

This repository documents the process of building the SUNDIALS library and implementing an advanced, preconditioned iterative solver (`SPGMR`). This project was built on Windows 11 and represents the successful completion of the most advanced technical requirement outlined by Professor Venkat Subramanian.

---

# 2. Final Status

- [x] **SUNDIALS Build:** The library was successfully compiled on Windows 11.
- [x] **Source Code Modification:** A standard SUNDIALS example was successfully modified to enable the `SPGMR` iterative linear solver.
- [x] **Preconditioner Integration:** The preconditioning functions were successfully attached to the iterative solver.
- [x] **Verification:** The new custom executable, `cvKrylovDemo_prec.exe`, runs correctly, confirming a successful build and modification.

---

# 3. Prerequisites

This project uses a "virtual environment" approach that relies on a compiler set up in a separate project.

1.  **Compiler Setup:** You must first have the `sundials-build-project-Win-11` project folder on your machine.
2.  **Download Compiler:** Follow the instructions in that project's `SETUP-GUIDE.md` to download the MinGW-w64 compiler and place it correctly in the `sundials-win-env` directory.
3.  **Clone SUNDIALS:** This project's `build.bat` script will automatically clone the SUNDIALS source code if it is not already present.

---

# 4. Build Instructions

1.  **Activate Environment:** Open a command prompt in this project's root directory and run the activation script. This will set the `PATH` to find the required compiler and tools.
    ```
    > env.bat
    ```

2.  **Run Build Script:** Once the environment is active, execute the main build script. This will compile both the SUNDIALS library and the custom example program.
    ```
    > build.bat
    ```

---

# 5. Verification

After the build script finishes, the final, custom-built executable can be found at the following location. Running it will produce the output from the preconditioned solver.
.\sundials\build\bin\cvKrylovDemo_prec.exe