#!/bin/bash

#==================================
# Thunderbird Quick Email Generate
#==================================

# echo $(dirs)
# filedirs=$(dirname $1)

addrpre='to='
# echo $addrpre
addr='zhehui@hkust.hk'
# echo $addr
subjpre=',subject='
subj='Experiment Data'
bodypre=',body='
body='Here is the data results'

filedirs=$(readlink -f $1) || filedirs=""           #shell try-catch use || and && logical rules
echo $filedirs

attachpre=",attachment="
attach="'$filedirs'"

content=$addrpre$addr$subjpre$subj$bodypre$body$attachpre$attach
echo $content

thunderbird -compose $content

