#!/bin/sh 
echo $(($(cat /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input) / 1000))
