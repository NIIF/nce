Test MKL enabled Numpy:

    cd
    mkdir numpy_test
    cd numpy_test
    cp $NCE_PACKAGES/numpy/test/sge* .
    module load python numpy
    qsub sge.batch.sh
    diff StdOut $NCE_PACKAGES/numpy/test/StdOut
