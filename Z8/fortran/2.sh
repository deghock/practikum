#!/bin/bash
#PBS -N 2out
#PBS -l nodes=node-2:ppn=8

cd $HOME/Z/Z8/fortran

export FFTW_INC_DIR=$HOME/FFTW-T1/include
export FFTW_LIB_DIR=$HOME/FFTW-T1/lib
export LD_LIBRARY_PATH=$HOME/FFTW-T1/lib:$LD_LIBRARY_PATH

make

for i in 2 4 8
do
  echo ----------------------------------------------------------
  ./fftw_test_3d_multithread 256 $i 16
done

make clean
