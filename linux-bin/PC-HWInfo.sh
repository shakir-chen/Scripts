#!/bin/bash

cat /proc/cpuinfo | grep "model name" | uniq
cat /proc/cpuinfo | grep "cpu core" | uniq
cat /proc/cpuinfo | grep "cache size" | uniq
cat /proc/meminfo | grep "MemTotal" | uniq
df -h
lsb_release -a | grep Description

