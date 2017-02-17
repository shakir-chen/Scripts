#!/bin/bash

function soft-check() {
    # ps -ef | grep -v "grep" | grep $1
    if [[ ! -n $(ps -ef | grep -v "grep" | grep $1) ]]
    then
        echo "Start" $1 "..."
        if [[ "$1" == "Franz" ]] ; then
            ~/Software/Franz/Franz &
        else
            $1 &
        fi
    else
        echo $1 "exists."
    fi
}

soft-check firefox
soft-check netease-cloud-music
soft-check Franz
