#!/bin/bash

echo $1

if [ "$1" = "lab" ]
then
    echo "here"
    servername="shakir@143.89.135.225 -p 2222"
elif [ "$1" = "zhehui" ]
then
    servername="zhehui@rostam.ece.ust.hk"
else
    servername="xuanqi@"$1".ece.ust.hk"         #passion,rostam,young,magic - other four: chirp iron fantasy sunlight
fi

ssh -X $servername
