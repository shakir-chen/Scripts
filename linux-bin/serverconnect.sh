#!/bin/bash

echo $1
if [ "$1" = "lab" ];
then
    echo "here"
    servername="shakir@143.89.135.225 -p 2222"
else
    servername="xuanqi@"$1".ece.ust.hk"
fi

ssh -X $servername
