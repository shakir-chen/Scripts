#!/bin/bash

SVNUPFLAG="N"
case $(ls | grep -c $1) in
    0) echo "no file found in svn repo"
       exit
       ;;
    1) SVNUPFLAG="Y"
       ls | grep $1
       ;;
    *) ls | grep $1
       read -p "more than two files selected, continue or not? [Y/N]" SVNUPFLAG
       ;;
esac


if (( "$SVNUPFLAG" == "N" )) ; then
    exit
else
    echo "add file to local"
    svn ls | grep $1 | while read line
    do
    echo "Add File $line To Local"
        svn update --set-depth empty $line
    done
fi


