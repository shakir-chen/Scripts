#!/bin/bash


A_TARGET=dijikstra_mpi
mpiexec -n $1 ./$A_TARGET ../input/input2.txt

# diff output.txt output.txt-right
# diff output.txt output2.txt
