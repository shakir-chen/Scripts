#!/bin/bash

# xrandr  --output VIRTUAL1 --mode 848x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal
# xrandr  --output VIRTUAL1 --mode 848x1080 --rate 60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal

# gtf 848 1080 60 ## copy info after modeline

# xrandr --newmode "848x1080_60.00"  76.20  848 904 992 1136  1080 1081 1084 1118  -HSync +Vsync
# xrandr --addmode VIRTUAL1 848x1080_60.00
# xrandr  --output VIRTUAL1 --mode 848x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal
# x11vnc -clip 848+1921+0

xrandr --newmode "832x1080_60.00"  75.13  832 888 976 1120  1080 1081 1084 1118  -HSync +Vsync
xrandr --addmode VIRTUAL1 832x1080_60.00
xrandr  --output VIRTUAL1 --mode 832x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal
x11vnc -clip 832+1921+0
