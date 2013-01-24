#!/bin/bash
../configure --shared --cc=gcc \
             --with-netlib-lapack-tarfile=../lapack-3.4.2.tgz \
             --prefix=/opt/nce/packages/global/atlas/3.10.1-gnu \
             -t 24 -m 2200 -Si omp 2 -Fa al -fopenmp


