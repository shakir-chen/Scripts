#!/bin/bash


echo "20 threads"
./dijkstra_pthread -n 20 -i ../input/input2.txt
sleep 4
echo "10 threads"
./dijkstra_pthread -n 10 -i ../input/input2.txt
sleep 4
echo "5 threads"
./dijkstra_pthread -n 5 -i ../input/input2.txt
sleep 4
echo "4 threads"
./dijkstra_pthread -n 4 -i ../input/input2.txt
sleep 4

echo "3 threads"
./dijkstra_pthread -n 3 -i ../input/input2.txt
sleep 4

echo "2 threads"
./dijkstra_pthread -n 2 -i ../input/input2.txt
sleep 4

echo "1 thread"
./dijkstra_pthread -n 1 -i ../input/input2.txt

