#!/bin/bash

./configure --enable-openmp --enable-mpi --with-g77-wrappers --enable-sse2 --prefix=/opt/nce/packages/global/fftw/3.3.3-gnu --enable-shared --with-pic
# make -j 4
# make install