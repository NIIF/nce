#!/bin/bash
#$ -N NUMPY
#$ -l h_cpu=00:30:00
#$ -pe openmp 24
#$ -q test.q
#$ -l exclusive=true
#$ -o StdOut
#$ -e ErrOut
#$ -cwd -V

# submit: qsub sge.batch.sh

cd $NCE_SCRATCH
echo "Threads: $OMP_NUM_THREADS"
python $NCE_PACKAGES/numpy/test/test.py
