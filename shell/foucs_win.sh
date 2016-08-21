#!/bin/bash

if [ "" = "$1" ] ; then
    echo "usage $0 <win index>"
    exit 1;
fi

WIN_ID=`wmctrl -l | cut -d ' ' -f1 | head -n $1 | tail -n 1`

if [ "" = "$WIN_ID" ] ; then
    echo "fail to get win id of index $1"
    exit 1;
fi
wmctrl -i -a $WIN_ID
