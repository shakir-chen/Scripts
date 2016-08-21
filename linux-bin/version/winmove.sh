#!/bin/bash

# resizes the window to full height and 50% width and moves into upper right corner

#define the height in px of the top system-bar:
TOPMARGIN=0         #27

#sum in px of all horizontal borders:
RIGHTMARGIN=0       #10

# get width of screen and height of screen

SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
SCREEN_WIDTH=$(( $SCREEN_WIDTH+8 ))
echo $SCREEN_WIDTH
#SCREEN_WIDTH=1920
#SCREEN_HEIGHT=1080

# new width and height
W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
H=$(( $SCREEN_HEIGHT / 2 - 2 * $TOPMARGIN ))

# X, change to move left or right:
if [ "$1" = "1" ];then
    # moving to the right half of the screen:
    X=$(( $SCREEN_WIDTH / 2 ))
else
    # moving to the left:
    X=0;
fi

Y=$TOPMARGIN

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H

#wmctrl -r $2 -b remove,maximized_vert,maximized_horz && wmctrl -r $2 -e 0,$X,$Y,$W,$H

# wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H
wmctrl -xr Firefox -e 0,100,100,500,500
