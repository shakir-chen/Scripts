#Linux Vim Life

## I. Deep Vim Settings - kvim

## II. Firefox - vimperator
ctrl+i: external editor; save and copy all the message back to the blank

## III. Thunderbird - muttator

Thunderbird: Cheatsheet
Tab : navigate-gt,g0... close: $:tabc
Folder: navigate-gi(goto inbox);ctrl-n/N (next -/unread folder); ctrl-p/P(previous...)
Mail: navigate-hjkl, !(mark),ctrl-s(archieve)
      r(reply), f(forward)
In email: i(insert)
          t (To: blank), s(subject blank), q(quit)
External Editor: can't use(?)
<https://andrewbrookins.com/tech/vim-thunderbird-muttator-extension-external-editor-extension/>

<https://gist.github.com/kartoch/5955822>

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

TODO List:
1. Autolocate Windows in One Place (done)
2. dmenu (done, fixed, by export LANG="en_GB.utf8")
3. Imporove I3 windows Appearence (done, see 4 part)
4. Strengthen Area Info, Sometimes I will forget the active window (not so important)

Printscreen : scrot -s
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

Error
1.ssh-copy-id doesn't work
ssh-add -l: check
eval `ssh-agent -s`     # solve my long-term error with different server ssh-key
ssh-add .ssh/your-key
<http://askubuntu.com/questions/786370/ssh-key-forwarding-not-working-under-i3wm>
<http://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-password-prompt>

### 4. Modify TaskBar
use sudo-apt install // Font Awesome,xorg-xbacklight,setxkbmap seems no need to install

i3
i3status
concky
bash
setxkbmap
xorg-xbacklight
Font Awesome

font-install : <http://askubuntu.com/questions/3697/how-do-i-install-fonts>
```
apt-get install ttf-fontname
# if no such font, download
mv fontname.ttf /usr/share/fonts/
fc-cache -f -v
```

Great Example In Github
git clone https://github.com/jannispinter/i3wm-config.git .i3
<https://github.com/jannispinter/i3wm-config>

### 5. Determine The Class Name
```
xprop | grep WM_CLASS   # and then click that processor
```
yEd : "sun-awt-X11-XFramePeer", "com-install4j-runtime-launcher-Launcher"

### 6. Dmenu no locale support Fixed
```
export LANG="en_GB.utf8" # dmenu 

edit /etc/default/locale:
LANG="en_US"
LANGUAGE="en_US:en"

edit ~/.pam_environme
LANG=en_US
LANGUAGE=en_US
```


## V. pdfviewer - Zathura
Edit - Mark and Note
:bmark tag-name         #book mark a tag name
:bdelmark tag-name      #delete book mark
:blist XXX              #select the bookmakr
:open filename          #open a filename
:print                  # print the pdffile
:wirte                  # save document
:export                 # export attatchments       !!! really fascinating
:dump                   # write values, descriptions etc
:exec                   # run command

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

TODO List:
1. Change Background and Front Color when revert color (done)
2. Figure out how to add tag or something related in zathura

## VI. File Manager - vifm

## VII. Image Viewer - xzgv

## VIII. Research Managermanet - Zotero
TODO List:
1. succeed to use firefox zotero with betterbibtex, at least show citation-key
2. Fast Move in Firefox Zotero, or better plugin with vimperator

<http://justinwiegand.com/blog/?p=103>

### 1. Fantastic with Better Bibtex Drag and Drop
You can drag and drop citations into your LaTeX/Markdown/Orgmode editor, and it will add
a proper \cite{citekey}/[@citekey]/[[zotero://select...][@citekey]. The cite command is
configurable for LaTeX by setting the config option in the Preferences. Do not include
the leading backslash. This feature requires a one-time setup: go to Zotero preferences,
tab Export, under Default Output Format, select "Better BibTeX Quick Copy", and choose
the Quick Copy format under the Citation keys preferences for BBT.]
<https://github.com/retorquere/zotero-better-bibtex/wiki/Citation-Keys>

Firefox seems could not export bibtex quick copy


## Reference
<http://stackoverflow.com/questions/779348/vim-movement-on-other-programs>
<https://wiki.archlinux.org/index.php/List_of_applications/Documents>       #Linux Arch, very comprehensive