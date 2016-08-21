#!/bin/bash

# windows geometry array
# declare -A wingeometry=(
# ["w1"]="" \
# ["w2"]="" \
# ["w3"]="" \
# ["w4"]="" \

# ["s4"]="" \
# ["s4"]="" \
# ["s4"]="" \
# ["s4"]="" \

# ["p4"]="" \
# ["p4"]="" \
# ["p4"]="" \
# ["p4"]="" \
# )

# resizes the window to full height and 50% width and moves into upper right corner

#define the height in px of the top system-bar:
TOPMARGIN=52        #27
TASKBARHEIGHT=27
RELATIVEHEIGHT=233
RELATIVEHORIZON=1920        #second screen


#sum in px of all horizontal borders:
RIGHTMARGIN=0       #10

# get width of screen and height of screen

# SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
# SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
# SCREEN_WIDTH=$(( $SCREEN_WIDTH+8 ))
# echo $SCREEN_WIDTH

SCREEN1_WIDTH=1920
SCREEN1_HEIGHT=1100     #1080

SCREEN2_WIDTH=1100      #1080
SCREEN2_HEIGHT=1920


# new width and height

# W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
# H=$(( $SCREEN_HEIGHT - 2 * $TOPMARGIN ))

# X, change to move left or right:
if [ "$1" = "1" ]
then
    # moving to the right half of Screen1:
    # X=$(( $SCREEN_WIDTH / 2 ))
    X=0
    Y=$(( $RELATIVEHEIGHT + $TASKBARHEIGHT ))
    W=$(( $SCREEN1_WIDTH / 2 ))
    H=$(( $SCREEN1_HEIGHT - $TASKBARHEIGHT))
elif [ "$1" = "2" ]
then
    # moving to the left half of Screen1:
    X=$(( $SCREEN1_WIDTH / 2 ))
    Y=$(( $RELATIVEHEIGHT + $TASKBARHEIGHT ))   #257 #52
    W=$(( $SCREEN1_WIDTH / 2 ))
    H=$(( $SCREEN1_HEIGHT - $TASKBARHEIGHT ))
elif [ "$1" = "3" ]
then
    # moving to the top half of Screen2:
    X=1920
    Y=$(( $TASKBARHEIGHT ))   #52
    W=$SCREEN2_WIDTH
    H=$(( ($SCREEN2_HEIGHT - $TASKBARHEIGHT) / 2 ))
elif [ "$1" = "4" ]
then
    # moving to the bottom half of Screen2:
    X=1920
    Y=$(( ($SCREEN2_HEIGHT + $TASKBARHEIGHT) / 2 ))
    W=$SCREEN2_WIDTH
    H=$(( ($SCREEN2_HEIGHT - $TASKBARHEIGHT) / 2 ))
fi

echo $X $Y $W $H

# Y=$TOPMARGIN

# wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
# wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H

echo $2
if [ "$2" = "" ]
then
    echo "here"
    wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H
else
    echo "here2"
    wmctrl -xr $2 -e 0,$X,$Y,$W,$H
fi

#wmctrl -r $2 -b remove,maximized_vert,maximized_horz && wmctrl -r $2 -e 0,$X,$Y,$W,$H

# wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H
# wmctrl -xr firefox -e 0,100,100,500,500
# wmctrl -xr firefox -e 0,100,100,1000,500
