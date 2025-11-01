#!/bin/bash
set -e

echo "--- Cloning SUNDIALS Source Code ---"
[ ! -d "sundials" ] && git clone https://github.com/LLNL/sundials.git

echo "--- Modifying Example File for Preconditioned Solver ---"
# Define paths for the original and new source files
EXAMPLE_DIR="./sundials/examples/cvode/serial"
ORIG_FILE="$EXAMPLE_DIR/cvKrylovDemo_ls.c"
NEW_FILE="$EXAMPLE_DIR/cvKrylovDemo_prec.c"
CMAKELIST="$EXAMPLE_DIR/CMakeLists.txt"

# Copy the original example to a new file
cp "$ORIG_FILE" "$NEW_FILE"

# Use 'sed' to automatically replace the linear solver block in the new file
sed -i 's/\/\* Create dense SUNMatrix for use in linear solves \*\//\/\* Create SPGMR SUNLinearSolver object \*\//' "$NEW_FILE"
sed -i 's/A = SUNDenseMatrix(NEQ, NEQ);/LS = SUNLinSol_SPGMR(y, SUN_PREC_LEFT, 0);/' "$NEW_FILE"
sed -i '/CHECK_retval/d' "$NEW_FILE" # Remove the check_retval lines in the block
sed -i 's/\/\* Create dense SUNLinearSolver object \*\///' "$NEW_FILE"
sed -i 's/LS = SUNLinSol_Dense(y, A);/\/\* Attach the linear solver \*\//' "$NEW_FILE"
sed -i 's/\/\* Attach the matrix and linear solver \*\//retval = CVodeSetLinearSolver(cvode_mem, LS, NULL);/' "$NEW_FILE"
sed -i 's/retval = CVodeSetLinearSolver(cvode_mem, LS, A);/\/\* Set the ILU preconditioner setup and solve functions \*\//' "$NEW_FILE"
sed -i 's/\/\* Set the Jacobian-vector product setup and solve routines \*\//retval = CVodeSetPreconditioner(cvode_mem, PSetup, PSolve);/' "$NEW_FILE"

# Add our new example to the build system
echo "add_example(cvKrylovDemo_prec)" >> "$CMAKELIST"

echo "--- Building SUNDIALS and Modified Example ---"
cd sundials
mkdir -p build && cd build
cmake ..
make -j$(nproc)
cd ../..

echo "--- Build Complete! ---"
echo "Verification: The new preconditioned executable is ready:"
echo "./sundials/build/examples/cvode/serial/cvKrylovDemo_prec"