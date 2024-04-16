#!/bin/bash
#PBS -N compile-info
#PBS -l nodes=node-13:ppn=4

cd $HOME/Z/Z8/c

export FFTW_INC_DIR=$HOME/FFTW-T1/include
export FFTW_LIB_DIR=$HOME/FFTW-T1/lib
export LD_LIBRARY_PATH=$HOME/FFTW-T1/lib:$LD_LIBRARY_PATH
export PATH=$HOME/OPENMPI/bin:$PATH

mpicc -o fftw_test_3d_mpi_double fftw_test_3d_mpi.c -I$FFTW_INC_DIR  -L$FFTW_LIB_DIR -lfftw3_mpi -lfftw3
echo "mpi:"
ldd fftw_test_3d_mpi_double
echo ---------------------------------------------------

gcc -o fftw_test_3d_mt_double fftw_test_3d_multithread.c -I$FFTW_INC_DIR -L$FFTW_LIB_DIR -lfftw3_threads -lfftw3
echo "multithreads(gcc):"
ldd fftw_test_3d_mt_double
echo --------------------------------------------------

gcc -Wall -o fftw_test_3d_serial_double fftw_test_3d_serial.c -I$FFTW_INC_DIR -L$FFTW_LIB_DIR -lfftw3
echo "serial(gcc):"
ldd fftw_test_3d_serial_double

