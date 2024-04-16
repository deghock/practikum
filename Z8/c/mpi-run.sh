#!/bin/bash
#PBS -l nodes=node-2:ppn=8+node-9:ppn=8+node-13:ppn=8+node-25:ppn=8
#PBS -N mpi-run-out

cd $HOME/Z/Z8/c

export FFTW_INC_DIR=$HOME/FFTW-T1/include
export FFTW_LIB_DIR=$HOME/FFTW-T1/lib
export LD_LIBRARY_PATH=$HOME/FFTW-T1/lib:$LD_LIBRARY_PATH
export PATH=$HOME/OPENMPI/bin:$PATH

for i in 1 4 8
do
  echo $i proc:
  mpirun -npernode $i fftw_test_3d_mpi_double 256 16
  echo -------------------------------------------
done

