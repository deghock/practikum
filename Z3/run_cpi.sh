#!/bin/bash
#PBS -N cpi-mpich
#PBS -l nodes=node-2:ppn=3+node-9:ppn=3

export LD_LIBRARY_PATH=/usr/local/mpich2/lib/
cd $HOME/Z/Z3
/usr/local/mpich2/bin/mpicc cpi.c -o cpi-mpich
/usr/local/mpich2/bin/mpirun ./cpi-mpich 
