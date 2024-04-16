#!/bin/bash
#PBS -N opMP4thr
#PBS -l nodes=node-2:ppn=8

export OMP_NUM_THREADS=4
cd ~/Z/Z4
gcc -fopenmp myOpenMP.c -o mp
./mp

