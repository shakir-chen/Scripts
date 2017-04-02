#!/bin/bash

HOST='ihome.ust.hk'
USER='xchenbr'
# PASSWD='remotepasswd'

ftp -n -v $HOST << EOT
ascii
user $USER
prompt
ls -la
bye

EOT


