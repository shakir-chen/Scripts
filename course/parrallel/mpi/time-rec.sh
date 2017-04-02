#!/bin/bash

# START=$(date +%s.%N)
# # do something
# # start your script work here
# sleep 0.1s;

# ./dijikstra_s ../input/input1.txt
# # your logic ends here
# END=$(date +%s.%N)
# DIFF=$(( $END - $START - 0.1))
# echo "It took $DIFF seconds"

start=$(date +%s.%N); \
# ./dijikstra_s ../input/input1.txt \
# ./dijikstra_mpi ../input/input2.txt \
mpiexec -n 10 ./dijikstra_mpi ../input/input2.txt
# sleep 0.1s; \
dur=$(echo "$(date +%s.%N) - $start" | bc); \
printf "Execution time: %.6f seconds\n" $dur
