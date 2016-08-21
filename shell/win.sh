#active
wmctrl -a firefox   #windows name or the name contain the words
wmctrl -xa firefox   #windows name or the name contain the words

#sticky
wmctrl -i -r Firefox -b add,sticky  # id or name, sticky means that windows will still here when workspace changes

#rename
wmctrl -r :SELECT: -T $1

#info
wmctrl -p -G -l     #p for pid; G for geometry
wmctrl -m           #information about window manager and environment

#wmctrl -r:ACTIVE: -b toggle,fullscreen
wmctrl -r:ACTIVE: -b toggle,$1        #fullscreen, hidden, skip_taskbar, below, above, 

