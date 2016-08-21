#!/bin/bash

for f in *.*
do
    n=$(expr index "$f" "/ ")
    if [[ $n != 0 ]]
    then
        mv "$f" "${f// /}"
        echo "$f" "->" "${f// /}"
    fi
done

for f in */
do
    n=$(expr index "$f" "\ ")
    if [[ $n != 0 ]]
    then
        mv "$f" "${f// /_}"
        echo "$f" "->" "${f// /_}"
    fi
done
