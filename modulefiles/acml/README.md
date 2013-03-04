## ACML

### Description
ACML provides a free set of thoroughly optimized 
and threaded math routines for HPC, scientific, 
engineering and related compute-intensive applications. 
ACML is ideal for weather modeling, computational fluid 
dynamics, financial analysis, oil and gas applications and more.

ACML consists of the following main components:

 * A full implementation of Level 1, 2 and 3 Basic Linear 
 Algebra Subroutines (BLAS), with key routines optimized for 
 high performance on AMD Opteron™ processors.
 * A full suite of Linear Algebra (LAPACK) routines. 
 As well as taking advantage of the highly-tuned 
 BLAS kernels, a key set of LAPACK routines has been 
 further optimized to achieve considerably higher 
 performance than standard LAPACK implementations.
 * A comprehensive suite of Fast Fourier Transforms 
 (FFTs) in both single-, double-, single-complex and 
 double-complex data types.
 * Random Number Generators in both single- and double-precision.

URL: http://developer.amd.com/tools/cpu-development/amd-core-math-library-acml/

### Usage

    LDFLAGS=$(NCE_LDFLAGS)

### Examples

    module load acml/5.3.0
    cd $AMD_ACML_HOME/open64_64/examples

Edit GNUmakefile

    ACMLDIR := $(AMD_ACML_HOME)/open64_64
    make | tee examples.out

### Performance

    cd $AMD_ACML_HOME/examples/performance

Edit GNUmakefile

    ACMLDIR := $(AMD_ACML_HOME)/open64_64
    make

### FFTW wrappers

    cd $AMD_ACML_HOME/examples/FFTW_wrappers/FFTW{2,3}

Edit GNUmakefile

    ACMLDIR := $(AMD_ACML_HOME)/open64_64
    make
