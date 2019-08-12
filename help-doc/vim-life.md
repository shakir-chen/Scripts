#Linux Vim Life
Library Install Tool
synaptic (graphic of apt-get)

## I. Deep Vim Settings - kvim
```
Plugin:
- YouCompleteMe:                OK              # complete
- ctrlp-funky:                  OK              #
- ctrlp.vim:                    OK              # fuzzy file, buffer, mru, tag, etc finder      :ctrlP  ,p      ,f (recent files)
- vim-multiple-cursors:         OK              # multiple-cursor
- tagbar:                       OK              # tagbar function       :Tagbar
- vim-snippets:                 OK
- ultisnips:                    OK              # automaticall code completion

- nerdtree:                     OK              # tree explorer
- vim-nerdtree-tabs:            OK
- nerdcommenter:                OK              # ,cc       ,cu

---------------git----------------
- vim-gitgutter:                OK              # shows git diff in the gutter (sign column)
- gundo.vim:                    OK              # git mirror
- vim-fugitive:                 OK              # git wrapper

- vim-repeat:                   OK              # ., repeat previous command

- ctrlsf.vim:                   OK              # ctrlsf, search and explore        :CtrlSF

- vim-surround:                 OK              # ysiw" Hello=> "Hello" ;   cs"'    "Hello"=> 'Hello'; ds"  "Hello"=> Hello

====Move====
- vim-easymotion:               OK              # motions on speed: ,,w     ,,fe
- matchit.zip:                  OK              # % match {}  or ()
- quick-scope:                  OK
- vim-quickrun:                 OK
- vim-tmux-navigator:           OK
- vim-signature:                OK              # a 53:     add line tag,   mx  -->  toggle x       ;x  --> move to x

====Show====
----------Color Scheme------------
- vim-colors-solarized:         OK
- molokai:                      OK

- vim-textobj-line:             OK
- vim-textobj-entire:           OK
- vim-textobj-indent:           OK
- vim-textobj-user:             OK
- vim-indent-guides:            OK

- vim-airline:                  OK              # stauts bar/tabline
- vim-airline-themes:           OK

- rainbow_parentheses.vim:      OK              # [[[[[(())]]]]]

- delimitMate:                  OK              # "" ()  {} [] : autocomplete for ", (, {, [
- vim-expand-region:            OK              # = -       ????        visual mode
- vim-ctrlspace:                OK              # space controller
- Scheme-Mode:                  OK

- vim-easy-align:               OK

--------------Syntax--------------
- syntastic:                    OK              # syntastic check, highlight by >>
- python-syntax:                OK
- vim-isort:                    OK              # python imports
- vim-python-pep8-indent:       OK
- javascript-libraries-syntax.vim: OK
- vim-javascript:               OK
- yajs.vim:                     OK              # yet another javascript
- vim-markdown:                 OK
- Vim-Jinja2-Syntax:            OK
- closetag.vim:                 OK              # html,xml      closetag </html>

- vim-trailing-whitespace:      OK              # red mark the last invalid space  
```

normap : <leader>ev          <leader> : ,

Ctag:       quick open header file
ctags --extra=+f -R .
<http://vimawesome.com/>
<http://www.wklken.me/posts/2013/06/11/linux-my-vim.html>

Ctags usage
 + ctags *.c *.h        # make tags for every c,h type files in workspace, result will be saved in tags file
 + ctags -R -f ./.git/tags .       # Recursive in the current folder, except .git folder
 + vim Ctrl+], at certain part will go to the k
 +     :tag or :ta => function_name
 +     :tselect or :ts => show the list
 +     :tnext or :tn -> next tag in that list
 +     :tprev or :tp
 +     :tf or :tfirst
 +     :tl or :tlast
 <https://andrew.stwrt.ca/posts/vim-ctags/>

vim + Ctags + Ctrlp     :CtrlPTag
all save in tags

vim add plug vim.bundles
+   Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
==> :PlugInstall

spell check: lexical spell
<https://linuxhint.com/vim_spell_check/>

zg      add to spell
zug     undo zg
set spellfile="~/.vim/spell/vim.bundles"
<https://superuser.com/questions/133208/how-to-make-vim-spellcheck-remember-a-new-word>

## II. Firefox - vimperator
ctrl+i: external editor; save and copy all the message back to the blank

search engine: google translator; google scholar search

1. firefox addon to go with vimpeartor
<https://superuser.com/questions/11089/firefox-addons-to-go-with-vimperator>
hard to implement
addons of grammarly: <https://app.grammarly.com/>


Tips: Speedup Firefox
1. http cache
2. <https://support.mozilla.org/en-US/questions/1146203>


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

i3wm useful commands:
1. i3-input : input, get input
2. i3-msg : move and workspace switch
get_workspace
i3-msg -t get tree # Dump the layout tree

i3-msg 'workspace 6.bdsl; exec zathura'     # open pdf in workspace 6
i3-msg workspace "6.bdsl"                   # focus workspace 6
3. i3-nagbar : see XY point

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

sudo apt-get install i3
sudo apt-get install i3status
sudo apt-get install conky
sudo apt-get install Font Awesome

setxkbmap
xorg-xbacklight

font-install : <http://askubuntu.com/questions/3697/how-do-i-install-fonts>
<https://github.com/FortAwesome/Font-Awesome>
Font Awesome CheatSheet<http://fontawesome.io/cheatsheet/>
```
apt-get install ttf-fontname
# if no such font, download
mv fontname.ttf /usr/share/fonts/ # FontAwesome.otf ; fontawesome-webfont.ttf
fc-cache -f -v
fc-list | grep "Source"         # check add or not
```

Great Example In Github
git clone https://github.com/jannispinter/i3wm-config.git .i3
<https://github.com/jannispinter/i3wm-config>

### 5. Determine The Class Name
```
xprop | grep WM_CLASS   # and then click that processor
```
yEd : "sun-awt-X11-XFramePeer", "com-install4j-runtime-launcher-Launcher"

for_window [class="Zotero" instance="Toplevel"] floating enable
for_window [class="Zotero" instance="Toplevel"] floating enable move right 330px, move down 70px

move window
i3-msg move absolute position 0px 0px
i3-msg move right 330px, move down 70px

i3-msg [class=feh instance=feh] move position 0px 0px

<https://i3wm.org/docs/userguide.html>[6.5 moveing containers]

restart i3wm-config: mod+shift+r
### 6. Dmenu no locale support Fixed
test: demu_run
```
export LANG="en_GB.utf8" # dmenu 

edit /etc/default/locale:
LANG="en_US"
LANGUAGE="en_US:en"

edit ~/.pam_environme
LANG=en_US
LANGUAGE=en_US
```
Error: demu_run not login export $PATH in .bashrc or .bash_profile
If I'm not mistaken, dmenu's environment could be non-interactive (depending on your login method). Try putting the line in ~/.profile.
```
vim ~/.profile
rm ~/.cache/dmenu_run
```

<https://bbs.archlinux.org/viewtopic.php?id=157187>

### 7. Volume
alias volumedown="pactl set-sink-volume 1 -10%"
alias volumeup="pactl set-sink-volume 1 +10%"

### 8. Set Floating Window as default
xpropwm
WM_CLASS(STRING) = "file_progress", "Nautilus"
for_window [class="Nautilus" instance="file_progress"] floating enable

### ==============================
### Useful Shortcuts
### ==============================
mod+space : focus float or not
mod+shift+space : toggle float
mod + s/w/e: stack/window side by side/toggle layout


### 9. Add weather and email notify to concky
<http://kumarcode.com/Adding-Weather-and-Gmail-info-to-my-i3-Status/>

america rss only, 10001 is the zip code
<https://alert.accuweather.com/accualert/index#>
(done, better application for curl and rss)

### 10. Ubuntu Gnome like Helper
key: release
bindcode $mod+25 workspace back_and_forth
bindsym --release $mod+w workspace back_and_forth
<https://www.reddit.com/r/i3wm/comments/4taxyh/bind_action_to_key_press_and_release/>
<https://i3wm.org/docs/userguide.html> keyboard-bindings

Transparent window : i3wm-compton
opacity-rule=["85:class_g='Terminate'"]
<https://faq.i3wm.org/question/3162/terminal-transparency-in-i3.1.html>
i3wm-compton<https://faq.i3wm.org/question/3279/do-i-need-a-composite-manager-compton.1.html>
compton --config path/to/compton.conf
<https://wiki.archlinux.org/index.php/Compton>

<https://github.com/chjj/compton>

communication between two different terminals
```
who     #pts/1
echo foo > /dev/pts/4
```
<http://irenicus09.deviantart.com/art/Gentoo-Linux-i3-wm-617553604>
<https://github.com/irenicus/dotfiles>


htop(interactive process viewer) and urxvt(light terminal)
tint2(panal,taskbar)
weechat

study later
```
sudo apt-get install rxvt-unicode-256colors
```
<https://github.com/pkkolos/urxvt-scripts>


i3wm with (fontawesome)

<https://www.reddit.com/r/unixporn/comments/34e4z4/urxvt_using_glyphs_with_urxvt/>

i3wm background color and image
```
xsetroot -solid "#333333"
feh --bg-scale ~/Dropbox/Linux/Pictures/wallpaper/horsehead-nebula-dark-nebula-constellation-orion-87646.jpeg
```
<https://wiki.archlinux.org/index.php/Feh#As>

### urxvt with compton
```
exec --no-startup-id compton
~/.config/compton.conf      # opacity-rule = [ "80:class_g = 'URxvt'" ];
compton -cCGfF -b -i 0.75 --vsync opengl # try compton instead xcompmgr
```

very nice
<https://www.reddit.com/r/i3wm/comments/2yytvs/make_terminals_transparent/>


## Error
1. Xresources not loading for urxvt
xrdb -merge ~/.Xresources
<https://bbs.archlinux.org/viewtopic.php?id=126530>

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

### 1. Know and Rotate Screen: xrandr
TODO List:
1. Change Background and Front Color when revert color (done)
2. Figure out how to add tag or something related in zathura

## VI. File Manager - vifm
More Powerful than I thought before.
Vim-Style KeyBinding
<https://vifm.info/manual.shtml#Pane%20manipulation>


### 1. Exit Vifm and leave in the current folder path
vifm-0.8
```
vicd()
{
    local dst="$(command vifm --choose-dir -)"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}
```
vifm()
{
    if [ -f ~/.vifm/lastdir ]; then
        rm ~/.vifm/lastdir
    fi
    # "command" prevents recursive call
    command vifm "$@"
    if [ -f ~/.vifm/lastdir ]; then
        cd `cat ~/.vifm/lastdir`
    fi
}
command! Q :execute '!echo %d > ~/.vifm/lastdir' | quit     #in vifmrc

<http://wiki.vifm.info/index.php?title=How_to_set_shell_working_directory_after_leaving_Vifm>

## VII. Image Viewer - feh
Dependency: libimlib2 (installed already)

feh key

Navigation
n : next
p : previous
q : quit

INFO
d : toggle filename
o : toggle mouse

i : toggle info

Operation
m : menu
s : save
v : fullscreen
w : change windwow size
q/x : quit / close window
<,> : rotate
/ : fit the window size

hjkl


xzgv (worst)



## VIII. Research Managermanet - Zotero
TODO List:
1. succeed to use firefox zotero with betterbibtex, at least show citation-key
2. Fast Move in Firefox Zotero, or better plugin with vimperator

<http://justinwiegand.com/blog/?p=103>

### 0. Basic Settings

--1. Plugin Firefox First
Zotfile : General Settings - Location of Files = Custom Location: /home/xuanqi/Dropbox/Paper
Preference: Advanced - Files and Folders - Linked Attachment Base Directory : /home/xuanqi/Dropbox/Paper
            General : tick out : take snapshots ;
            Sync : Username+psw ; tickout sync full-text content

--2. Install Zotero

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

