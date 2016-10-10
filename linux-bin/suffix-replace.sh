#!/bin/bash
#Remember : run in bash ; otherwise, bad susbtitution error

typename=$1
# echo $typename

for name in *.txt
do
    # echo $name
    ii=$(expr index $name ".")
    # echo $ii
    ii=$(($ii-1))
    # echo $ii
    # len=$(expr length $name)
    # echo $len
    #echo $name
    #echo $ii
    #echo $len
    truename=${name:0:ii}
    # echo $truename
    # typename=${name:ii:len}
    # echo $typename
    recname=$truename.$typename
    echo mv $name $recname
    mv $name $recname
done

