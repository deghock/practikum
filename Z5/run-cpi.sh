#!/bin/bash
#PBS -N cpi-ompi
#PBS -l nodes=node-9:ppn=2+node-13:ppn=2

export PATH=$HOME/OPENMPI/bin:$PATH
export LD_LIBRARY_PATH=$HOME/OPENMPI/lib/
cd $HOME/Z/Z5
mpicc cpi.c -o cpi-ompi
mpiexec -np 4 ./cpi-ompi


