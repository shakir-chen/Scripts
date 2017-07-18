#!/bin/bash

# file
for f in *.*
do
    n=$(expr index "$f" "/ ")
    if [[ $n != 0 ]]
    then
        mv --backup=t "$f" "${f// /}"
        echo "$f" "->" "${f// /}"
    fi

    n=$(expr index "$f" "/(")
    if [[ $n != 0 ]]
    then
        # echo "$f" "->" "${f// /}"
        newname="${f/\(/_}"         # ( => _
        newname="${newname/\)/}"         # del )
        echo "$f" "->" "$newname"
        mv --backup=t "$f" "$newname"
    fi
done

# directory
for f in */
do
    n=$(expr index "$f" "\ ")
    if [[ $n != 0 ]]
    then
        mv --backup=t "$f" "${f// /_}"
        echo "$f" "->" "${f// /_}"
    fi
done
