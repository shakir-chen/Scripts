#!/bin/bash
#source /c/Program\ Files\ \(x86\)/Mozilla\ Firefox/
#cd /c/Program\ Files\ \(x86\)/Mozilla\ Firefox/

cd /c/Program\ Files\ \(x86\)/Mobatek/MobaXterm\ Personal\ Edition/


if [[ $1 = "" ]]
then
    ./Mobaxterm.exe &
else
    ./Mobaxterm.exe -bookmark "$1"  &
fi


#./Mobaxterm.exe -bookmark "Passion" &
#./Mobaxterm.exe -bookmark "Passion" &

#MobaXterm.exe
