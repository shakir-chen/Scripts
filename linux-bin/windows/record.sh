#!/bin/bash

name=$1
d=$(date +"%y%m%d")
ii=$(expr index $name ".")
let ii=$ii-1
len=$(expr length $name)
#echo $name
#echo $ii
#echo $len
truename=${name:0:ii}
typename=${name:ii:len}
recname=$truename-$d$typename
echo move $name $recname

cp $name $recname
