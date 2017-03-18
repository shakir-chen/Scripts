#!/bin/bash

# xrandr  --output VIRTUAL1 --mode 848x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal
# xrandr  --output VIRTUAL1 --mode 848x1080 --rate 60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal

# gtf 848 1080 60 ## copy info after modeline

# xrandr --newmode "848x1080_60.00"  76.20  848 904 992 1136  1080 1081 1084 1118  -HSync +Vsync
# xrandr --addmode VIRTUAL1 848x1080_60.00
# xrandr  --output VIRTUAL1 --mode 848x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal
# x11vnc -clip 848x1921+0

# H_RESO=808 #Height RESOLUSION  ipad
# V_RESO=1080    #Vertical RESOLUSION
H_RESO=1536    #Height RESOLUSION
V_RESO=2048    #Vertical RESOLUSION
SIZE=$H_RESO"x"$V_RESO
FREQ=60.00
MODESIZE=$SIZE"_"$FREQ

echo $MODESIZE

MODEPRAM=$(gtf $H_RESO $V_RESO $FREQ | grep "Modeline" | sed 's/\s\+Modeline//')
echo $MODEPRAM


# xrandr --newmode "808x1080_60.00" 72.45 808 856 944 1080 1080 1081 1084 1118 -HSync +Vsync

# xrandr --newmode "1536x2048_60.00" 270.55 1536 1664 1832 2128 2048 2049 2052 2119 -HSync +Vsync
# xrandr --addmode VIRTUAL1 "1536x2048_60.00"
xrandr  --output VIRTUAL1 --mode 1536x2048_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal

# xrandr --newmode "808x1080_60.00" 72.45 808 856 944 1080 1080 1081 1084 1118 -HSync +Vsync
# xrandr --addmode VIRTUAL1 $MODESIZE
# xrandr  --output VIRTUAL1 --mode $MODESIZE --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal

# x11vnc -clip $SIZE"+1921+0"
# x11vnc -clip 808x1080+1921+0


# H_RESO=752 #Height RESOLUSION   iphone
# V_RESO=1334 #Vertical RESOLUSION
# SIZE=$H_RESO"x"$V_RESO
# FREQ=60.00
# MODESIZE=$SIZE"_"$FREQ
# MODEPRAM=$(gtf $H_RESO $V_RESO $FREQ | grep "Modeline" | sed 's/\s\+Modeline//')
# echo $MODEPRAM

# xrandr --newmode "752x1334_60.00" 84.85 752 808 888 1024 1334 1335 1338 1381 -HSync +Vsync
# xrandr --addmode VIRTUAL1 $MODESIZE
# xrandr --output VIRTUAL1 --mode $MODESIZE --left-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal
# x11vnc -clip 752x1334+1921+0
