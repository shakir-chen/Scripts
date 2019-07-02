#!/bin/bash

i3-msg 'for_window [class="Firefox"] move container to workspace 1'

winid=$(xprop -notype -root _NET_CLIENT_LIST | cut -c 31-)
# echo $winid

for winii in $winid;
do
    echo $winii
    wmclass=$(xprop -id $winii | grep WM_CLASS | cut -c 20-)
    # echo $wmclass
    wmidname=$(echo $wmclass | grep -oP "\S+$")
    wmidname=${wmidname:1:$((${#wmidname}-2))}
    echo $wmidname
    # case $wmidname in
        # "Gnome-terminal")
            # # i3-msg move [con_id=$winii] to workspace 3
            # ;;
    # esac
    # exit
done
# xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null
# xprop | grep WM_CLASS
