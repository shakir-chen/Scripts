#!/bin/sh

if [ -d "/sys/devices/platform/coretemp.0/hwmon/hwmon0" ]; then
    echo $(($(cat /sys/devices/platform/coretemp.0/hwmon/hwmon0/temp1_input) / 1000))
else
    echo $(($(cat /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input) / 1000))
fi
