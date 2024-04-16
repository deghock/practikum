#!/bin/bash
#PBS -N run-all
#PBS -l nodes=node-13:ppn=8

cd $HOME/Z/Z8/c

export FFTW_INC_DIR=$HOME/FFTW-T1/include
export FFTW_LIB_DIR=$HOME/FFTW-T1/lib
export LD_LIBRARY_PATH=$HOME/FFTW-T1/lib:$LD_LIBRARY_PATH
export PATH=$HOME/OPENMPI/bin:$PATH

echo serial:
./fftw_test_3d_serial_double 256 16

echo --------------------------------------------------

for i in 2 4 8
do
  echo multithreads with $i :
  ./fftw_test_3d_mt_double 256 $i 8
  echo - - - - - - - 
done

echo ---------------------------------------------------

for N in 2 4 8
do
  echo mpi with $N proc per node:
  mpirun -np $N ./fftw_test_3d_mpi_double 256 16
  echo - - - - - - -
done


