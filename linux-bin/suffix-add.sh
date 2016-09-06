#!/bin/bash

d=$1
echo $d

for name in *.txt
do
    # echo $name
    ii=$(expr index $name ".")
    # echo $ii
    ii=$(($ii-1))
    # echo $ii
    len=$(expr length $name)
    # echo $len
    #echo $name
    #echo $ii
    #echo $len
    truename=${name:0:ii}
    # echo $truename
    typename=${name:ii:len}
    # echo $typename
    recname=$truename-$d$typename
    echo copy $name $recname
    mv $name $recname
done
