#!/bin/bash
# Del folders including $TYPE file


# TYPE=[*.jpg, *. ]
# TYPE=html

TYPEARRAY=(jpg png html)
echo ${TYPEARRAY[*]}

for TYPE in ${TYPEARRAY[*]}
do
    echo $TYPE"================"
    # FOLDER=$(find -name *.$TYPE)
    FOLDER=$(find -name *.$TYPE | sed -r 's/\/\w+.'$TYPE'$//g')
    if [[ ! "$FOLDER" == "" ]]
    then
        echo $FOLDER
        rm -r $FOLDER
    fi
done

