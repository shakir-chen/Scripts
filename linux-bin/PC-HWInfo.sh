#!/bin/bash

cat /proc/cpuinfo | grep "model name" | uniq
cat /proc/cpuinfo | grep "cpu core" | uniq
# cat /proc/cpuinfo | grep "cache size" | uniq
echo "L0        :   " $(cat /sys/devices/system/cpu/cpu0/cache/index0/size)
echo "L1        :   " $(cat /sys/devices/system/cpu/cpu0/cache/index1/size)
echo "L2        :   " $(cat /sys/devices/system/cpu/cpu0/cache/index2/size)
echo "L3        :   " $(cat /sys/devices/system/cpu/cpu0/cache/index3/size)
cat /proc/meminfo | grep "MemTotal" | uniq
df -h
lsb_release -a | grep Description

