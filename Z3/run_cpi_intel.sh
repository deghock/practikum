#!/bin/bash
#PBS -N cpi-intel
#PBS -l nodes=node-2:ppn=3+node-9:ppn=3

source /usr/local/ipsxece/ipsxece_2018_u3/bin/compilervars.sh intel64 
source /usr/local/ipsxece/ipsxece_2018_u3/mkl/bin/mklvars.sh intel64
source /usr/local/ipsxece/ipsxece_2018_u3/impi/2018.3.222/bin64/mpivars.sh
cd $HOME/Z/Z3
mpicc cpi.c -o cpi-intel
mpirun ./cpi-intel
