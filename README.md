# SUNDIALS with a Preconditioned Iterative Solver

This repository documents the process of building SUNDIALS and using an advanced, preconditioned iterative linear solver (`SPGMR`), demonstrating the final "PhD-level" task outlined by Professor Venkat Subramanian.

## Status
- [x] SUNDIALS build successful.
- [x] Custom example (`cvKrylovDemo_prec`) created to use the `SPGMR` linear solver.
- [x] Preconditioner successfully attached to the solver.
- [x] **Verification:** The new `cvKrylovDemo_prec` example runs successfully, confirming the use of the preconditioned solver.

## How to Use
1.  Ensure build tools are installed on Linux (`sudo apt install build-essential cmake git`).
2.  Make the build script executable: `chmod +x build.sh`
3.  Run the script: `./build.sh`

The script will clone SUNDIALS, automatically modify an example file, build the project, and create a new executable located at:
`./sundials/build/examples/cvode/serial/cvKrylovDemo_prec`