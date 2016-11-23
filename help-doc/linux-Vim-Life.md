#Linux Vim Life

## I. Deep Vim Settings - kvim

## II. Firefox - vimperator

## III. Thunderbird - muttator


## IV. Window Manager - i3
wmii move to i3
<https://blog.kaiserapps.com/why_i_moved_to_i_3_from_wmii/>

improve multi-monitor correctly
<https://i3wm.org/>

log-out and use i3 to login
configure-i3
<https://fedoramagazine.org/getting-started-i3-window-manager/>

Beginning:
1. log-out and switch to i3 in the login window, set $mod to Alt
2. $mod + enter => open a terminal
3. $mod + v => split vertical, $mod+h split horizontally
4. $mod + f => full screen
5. $mod + # => create new windows
6. $mod shift + # => move the window
7. $mod shift + q => close a window

vim-binding navigation
$mod + ; right move
$mod + k left move

$mod + d toggle vertical / horizontal layout

```
gedit ~/.config/i3/config       # Mod1 Alt; Mod4 Win
```
Hacker-Greg Kroah-Hartman
<https://usesthis.com/interviews/greg.kh/>


### 1. Know and Rotate Screen: xrandr
```
xrandr -q #output parameter infos
xrandr --output DP2 --rotate normal/left
xrandr --output VGA1 --rotate left
```

### 2. Manual

<https://github.com/t60r/i3-blackarch/blob/master/.i3/config>

<https://i3wm.org/docs/userguide.html>

### 3. Program Appearance Optimization
config:


terminal -> view not show menu

## V. pdfviewer - Zathura
Edit - Mark and Note
:bmark tag-name         #book mark a tag name
:blist XXX              #select the bookmakr
:open filename          #open a filename
:print                  # print the pdffile
:wirte                  # save document
:export                 # export attatchments
:dump                   # write values, descriptions etc

d = dual page; s full-width page; a full-height page;
Navigation : 8G -> goto 8 page; ^o &i move backward and forward through jump-list
        Tab -> Index mode, l expand, L expand all; h collapse,.. ; space and return, goto that page

Show: ^m toggle inputbar ^n toggle statusbar

man zathura
man zathurarc   # learn how to write zathurarc
<https://pwmt.org/projects/zathura/documentation/>
Good for navigation, bookmark and search around.

_Bad for taking note_
?? any solution for that ??

## VI. File Manager - vifm

## VII. Image Viewer - xzgv

## Reference
<http://stackoverflow.com/questions/779348/vim-movement-on-other-programs>
