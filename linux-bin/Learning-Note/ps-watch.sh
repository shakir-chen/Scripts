#!/bin/bash

if [[ -n $(ps -ef | grep zotero | grep -v "grep") ]]
then
    echo "Zotero Exist"
fi
