#!/bin/bash
#PBS -N cpi-ompi-tesla
#PBS -l nodes=tesla01:ppn=2+tesla02:ppn=2

export PATH=/soft2/tesla/openmpi-1.10.7/bin:$PATH
export LD_LIBRARY_PATH=/soft2/tesla/openmpi-1.10.7/lib/
cd $HOME/Z/Z5
mpicc cpi.c -o cpi-tesla
mpiexec -np 4 ./cpi-tesla


