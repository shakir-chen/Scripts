#!/bin/sh 
# echo $((($(cat /sys/class/backlight/intel_backlight/brightness)*100) / $(cat /sys/class/backlight/intel_backlight/max_brightness)))
echo $((($(cat /sys/class/backlight/acpi_video0/brightness)*100) / $(cat /sys/class/backlight/acpi_video0/max_brightness)))
