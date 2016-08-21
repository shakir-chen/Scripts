#!/bin/bash
#source /c/Program\ Files\ \(x86\)/Mozilla\ Firefox/

#start "/c/Program Files (x86)/Mozilla Firefox/firefox.exe"
cd /c/Program\ Files\ \(x86\)/Mozilla\ Firefox/
#start "/c/Program\ Files\ \(x86\)/Mozilla\ Firefox/firefox.exe"

if [[ $1 = "" ]]
then
    ./firefox.exe &
else
    ./firefox.exe "$1"  &
fi
