#Big Problem (Todo List)
1. GDB how to debug and watch line by line ? (snap serial)
2. GDB debug python
3. Debug Tools, how vim can do better than IDE tools?

Understand Makefile better
lab-ip-address:143,89.135.225

#Problem History
1st-16th Aug
1. No sound into headphone through SSH (ssh self problem)

2. Windows Ctrl - wmctrl (deeply understand)

3. npm study (javascript etc, long-term)

4. Research Environment Get Familiar (done, ssh+svn+latex)
5. svn **problem** cant commit in ubuntu...!!! (done,update in the end)
6. Ubuntu Dictionary (like lingoes in Windows)
-golden
7. Chinese input in ubuntu (done, fcitx+sogou,logout)
8. freemind in ubuntu (done)
9. paste and copy in/out terminal (done, alternatives)
Way 1
```
--gnome terminal use ctrl-shift-c for copy and ctrl-shift-v for paste
vim insert
```
10. Screen Snap
ubuntu :
i) printscreen
ii) custom : shift+printscreen

# Program Develop in Linux
## Environment
python - ipython
bash - shell
IDE Tools - Netbeans, Eclipse

## Make
make
cmake

## Debug
gdb
pyclewn

## Search
### file name search
find
locate
### file content search
grep
sed
awk
### sort
sort
xarg

## Modify

### Diff two files
```
vimdiff file1 file2 or vim -d file1 file2
commands in vimdiff
dp  diffput:
do  diffget
]c
[c
```
<http://vi.stackexchange.com/questions/625/how-do-i-use-vim-as-a-diff-tool>

## Print
echo
cat
wc
tail        #print last 10 files of a file by default
less        #view huge log files
logsave     #record terminal/program output, add time stamp comparing with tee
whereis
whatis
which
uname       #display important info of system
date        #show date

## OS Resource
```
top
ps
df      #Storage Info
kill    #kill process
watch   #
lsof    #list open files, figure out which processs use a certain file, or display all the files for a single process
strace  #trace all system calls that a program makes to the linux kernal, see when a program opens closes, reads, writes, access files
mount   #mount a file system
```

## Type conversion
od      #dump files in octal and other formats
iconv   #character code convert, example, utf8 to latin-1

## Network
nc      #netcat for tcp/ip swish army knife
ping

## Database
mysql
## Help
cheat   #usage info of command, simply form of man command
### cheat Installation
```
requirement: python,pip,git
pip install docopt pygments
git clone https://github.com/chrisallenlane/cheat.git
cd cheat
python setup.py install
cheat -v
export EDITOR=/usr/bin/nano     #modify in .bashrc
```

##bash recommendation utilities

<http://www.thegeekstuff.com/2010/11/50-linux-commands/?utm_source=feedburner>

## Language Recommendation
java for real desktop applications
python for quick and dirty things
c and c++ for efficiency

# Ubuntu - Installation Guide
## Ubuntu Settings

### 1. Caps Lock key change to additional CTRL
```
sudo apt-get install gnome-tweak-tool
```
open gnome-tweak-tool, typing, caps behavior -> make as an additional ctrl keys.

```
setxkbmap -option caps:ctrl_modifier
```
<http://askubuntu.com/questions/53038/how-do-i-remap-the-caps-lock-key>

### 2. change default shell
```
chsh -s /bin/bash
```

### 3. window move and resize
```
wmctrl -d #show desktop
wmctrl -l #list all the windows
wmctrl -i -a <win-id>  #ignore other workspace; activate windows id
wmctrl -r :ACTIVE: -e 0,2000,100,1000,400           #-r specifies a target windows, -e resizes and moves
```
-a activate the window
-b add move or toggle up
-c close
-d list all desktops
-e resize and move a window that has been specified with a -r action
-g change the geometry w,h

windows resolution information
```
xwininfo
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')
```
<http://unix.stackexchange.com/questions/53150/how-do-i-resize-the-active-window-to-50-with-wmctrl>
Ubuntu Workspace Move: Ctrl+Alt+Arrow

wmctrl has some fatal bug with not exact position of windows move.

xdotool
```
xdotool selectwindow    #get windows id, decimal
wmctrl -l               #get window id, hex
```


### 4. Key-Shortcuts
Win Switch to Neighbor Workspace: super + arrow
Win Move to other Workspace: None
Workspace Switch : ctrl + number
Workspace Switch to Neighbor: ctrl + alt + arrow

terminal
```
Navigation
Ctrl + A ;Beginining or Home Key
Ctrl + E ;End or End Key
Alt + F  ;Move cursor forward one word on the current line
Alt + B  ;Move cursor backward one word on the current line

Edit
--Delete
Ctrl + K ;Clear all after line
Ctrl + U ;Clear all before line
Ctrl + W ;Delete the word before the cursor

Ctrl + L ;Clear all the pane
Ctrl + H ;Delete one character, backspace
--Swap
Ctrl + T ;Swap the last two characters before the cursor
Esc + T  ;Swap the last two words before the cursor

Ctrl + R ;Search
Ctrl + C ;kill whatever your are running
Ctrl + D ;Exit the current shell

Ctrl + Z ;Puts whatever you are running into a suspended background process. fg restores it.

Tab      ;Auto-complete files and folder names
```

<http://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/>
<http://www.makeuseof.com/tag/save-time-linux-terminal-20-shortcuts/>

```
cd -        #cd last file
!cd         #! + command, excute last that type command
cd !$       # !$ means last parameter
xxx && xxx  # && combinator for two commands
```
<http://lifehacker.com/5743814/become-a-command-line-ninja-with-these-time-saving-shortcuts>

### 5. deb file install and remove
sudo dpkg -i xxx.deb
sudo dpkg -r xxx


### 6. Searching Technique in Linux - grep, awk and sed

File Search
```
locate -b PN-J.png
locate -S
```

```
find -name "*.PNG"
```
```
 #change suffix name to small case
$ find . -name '*.*' -exec sh -c 'a=$(echo "$0" | sed -r "s/([^.]*)\$/\L\1/"); [ "$a" != "$0" ] && mv "$0" "$a" ' {} \;
```
basic regular expressions $.*[\]^, need to put backslash
in a nutshell, for sed 's/.../.../', $.*/[\]^

Ref:<http://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script>

<https://www.digitalocean.com/community/tutorials/how-to-use-find-and-locate-to-search-for-files-on-a-linux-vps>
<https://www.digitalocean.com/community/tutorials/how-to-use-find-and-locate-to-search-for-files-on-a-linux-vps>


### 7. Debug in Linux - gdb + vim + pyclewn
pyclewn

gdb

Others Recomendation:

valgrind: build dynamic analysis tools - memory managemment and threading bugs
<http://valgrind.org/>
strace: monitor interactions between processes and the Linux kernel (useful)
objdump -d inspect the machine code, for performance sensitive loops
oprofile, hotspots in optimized code

cscope: search source code of the programming language C (useless) - find definitions to jump around

cmake
<http://stackoverflow.com/questions/17228/what-tools-do-you-use-to-develop-c-applications-on-linux>

### 10. SourceCode Understanding Workflow

Software Recomendation in linux
<https://wiki.installgentoo.com/index.php/List_of_recommended_GNU/Linux_software>

### 11. Dual System Partition Size Rearrangement

Try at Personal PC before
```
sudo apt-get install gparted
```
<http://askubuntu.com/questions/386177/difference-between-emacs-and-emacs-lucid-packages>

### 12. Remove Ugly Tabs in Ubuntu Terminal

Two Ways
1. directly change system configuration
```
>sudo vim /usr/share/themes/Ambiance/gtk-3.0/apps/gnome-terminal.css
# change in the end
TerminalNotebook.notebook tab .button {
background-color: transparent;
padding: 0px;     /*modify here, tab Padding Width*/
}
```
2. under ~/.config
```
>vim ~/.config/gtk-3.0/gtk.css

@define-color bg-grey #222;
@define-color active-grey #333;
@define-color border-grey #555;

TerminalWindow .notebook {
    border: 0;
    padding: 0;
    color: #eee;
    background-color: shade(@active-grey, 1);
}

TerminalWindow .notebook tab:active {
    border: 1px solid @border-grey;
    background-color: shade(@active-grey, 1);
}
TerminalWindow .notebook tab {
    background-color: shade(@bg-grey, 1);
}
```
<https://ubuntu4questions.wordpress.com/2015/01/18/remove-ugly-fat-bazel-from-gnome-terminal-with-multiple-tabs/>
<http://askubuntu.com/questions/221291/remove-ugly-fat-bazel-from-gnome-terminal-with-multiple-tabs>

### Ubuntu Office Print
IPP Device URI: https://eems04.ee.ust.hk/printers/esl080/.printer
Make and Model: HP LaserJet 9050 Postscript (recommended)

Failed, don't know the reason   - Could send an Email to the ITSC
<http://itsc.ust.hk/kb/article.php?id=567>

### File Browser - Connect to server
ssh://username@hostpath


## Core Software Installation

### 1. vim
Compile Problem
```
checking for tgetent()... configure: error
      You need to install a terminal library; for example ncurses.
      Or specify the name of the library with --with-tlib.
apt-get install ncurses-dev

apt-get install python-dev
```
the best way in ubuntu to install vim:
```
sudo apt-get upgrade vim
```
install kvim

vim tool recommendation: <http://vimawesome.com/>

Problem: vim exit will show "Thanks for flying vim"
```
let &titleold=substitute(getcwd(), $HOME, "~", "")  #in vim, add in the .vimrc
```
PlugIn Deep Study
Tagbar      <F9>
CtrlP       ,p  or ,f
vim-easymotion  ,,+w jump   ,,+fe find'e' and jump to that position
Youcompletme    ,gd jump to declaration place
multiple-cursor ctrl+m begin to select ; ctrl + p  up cease ; ctrl +x skip; esc

<http://www.wklken.me/posts/2013/06/11/linux-my-vim.html#_6>

Tips:
1. Go to definitions using g
```
gd go to local declaration ;    gD go to global declaration
g* search for the word under the cursor(like *, g* on 'rain' will find rainbow)
g# same as g*,but in backward direction
gg first line
G  bottom line
gf go to the file
g] go to a tag
```

<http://vim.wikia.com/wiki/Go_to_definition_using_g>

Best Reference: Vim Command Wiki



### 2. Quick SSH Connect(store password and session)
Generate a public key locally and send it to server

```
cd ~
mkdir .ssh
chmod 700 .ssh
ssh-keygen     #enter keyfile:rsa_id  next phrase:psw
ssh-copy-id -i myrsaid.pub user@host
ssh user@host
```


__Tips__: SSH copy files between local machine and server - use scp
```
scp /path/to/file username@host:path/to/destination
scp username@host:/path/to/file path/to/destination
```

2.1 Remote GUI program shown in Ubuntu
Really compatible and easy to implement
```
ssh -X username@host
```
Put into ~/Linux/bin/serverconnect.sh and chmod 750 serverconnect.sh

2.2 SVN Alternatives
TortoiseSVN is only for windows

Tortoise SVN Alternatives - just use svn
Integer with nautilus tool:rabbit
or just live in the command line:
```
sudo apt-get install subversion
```

```
svn checkout --depth immediates ssh+svn://xuanqi@young.ece.ust.hk/home/svn_repository SVN           #only download the first folders names
svn update --set-depth infinity Group\ discussion           #infinity, immediates, empty
```
```
svn ls          #check svn-repo's files
svn add xxx_files
svn ci -m "COMMIT MEssage"      # otherwise, will be ignored
```
```
svn status -v xxx_files         #check file status
svn status -u xxx-files         # check updates
```

Bug Fix >> Status against revision

**problem** cant commit in ubuntu...
```
svn add xxx
svn commit -m "description"
svn update
```
like windows after commit, update first and maybe wait for some seconds to see the changes)

echo $?     #echo erros

Ref<http://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion>
<http://www.linuxfromscratch.org/blfs/edguide/chapter03.html>
<http://stackoverflow.com/questions/20273160/when-doing-a-subversion-commit-this-line-and-those-below-will-be-ignored>
<http://beerpla.net/2008/07/23/how-to-check-if-the-local-svn-revision-is-up-to-date/>


### 3. Other tools
PDF Reader-> evince
Microsoft Office -> Libreoffice
dropbox
TortoiseSVN -> SVN (<http://svnbook.red-bean.com/en/1.4/svn.ref.svn.html>)
mobi reader -> calibre



### 4. Freemind in ubuntu
install linux binary 2.6MB <http://freemind.sourceforge.net/wiki/index.php/Download>
alias mindopen="~/Software/freemind/freeMind.sh"

Java Virtual Machine Issue; apt-get install openjdk-8-jre


### 5. Quick Github Repo commit
```
git status  #check package status
git add
git commit
git push
git pull    #update packages
```

+ withdraw old file in github
```
git checkout XXX-discasrd-file
```
<http://stackoverflow.com/questions/4318161/can-git-pull-all-update-all-my-local-branches>

+ merge

Basic Branch and Merging Concept Here<https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging>
```
git checkout XXX-discasrd-file
```

### 6. package install guide:
```
apt-cache show package          //description of package
apt-cache search package          //a short summary of all the texlive
apt-get install xxx
```

### 7. texlive choose and install
sudo apt-get install texlive-latex-base

Better Choice
```
sudo apt-get install texlive
sudo apt-get install texlive-latex-extra --no-install-recommends            #for a smaller extra package
```
Latex error: psboxit.sty not found
Listing not work
```
mkdir /usr/share/texlive/texmf-dist/tex/latex/psboxit
wget -O psboxit.sty https://www.ctan.org/tex-archive/macros/latex209/contrib/misc/psboxit.sty
sudo mktexlsr #or: sudo texhash

apt-cache search psboxit    # no result
apt-cache show texlive-latex-extra | grep psboxit    # no result
```

tips, pdf open tools - evince; this pdfware is quite simple but powerful. Annotation and highlight is in the left side with a tiny icon.


### 8. tmux
navigate in terminal(tmux): ctrl-b + [ or ctrl-b+pageup/pagedown

tips:
1. .tmux.conf and .tmux file
2. rename session
ctrl+B,: -> rename-session [-t current-name] [new-name]
if no name, just rename-session new-name
example: Jade Profiling Snap-Proj
### 9. Temperature Monitor
```
sudo apt-get install lm-sensors
sudo sensors-detect
#sudo service kmod start
sensors
```
### 10. Account in Ubuntu
Add
```
sudo adduser newuser #example newuser-> silly
```
Delete
```
sudo userdel newuser #example newuser-> silly
sudo rm -rf /home/newuser
```

### 11. connectable computer (-)
```
sudo iptables -L
```
sudo apt-get openssh-server
check ps -A |grep sshd      #check sshd runs or not
ssh -v localhost            #check locally

<https://help.ubuntu.com/lts/serverguide/openssh-server.html>

ifconfig : inet addr:
ssh username@localhost -p 2222  # silly sillyisafatpig

git on server - git-upload-pack command not found problem
```
>cd /etc/ssh/sshd_config
PermitUserEnvironment yes
>/etc/init.d/sshd restart

Test on local-PC
>sshd username@hostserver "which git-upload-pack"
```
<http://stackoverflow.com/questions/11128464/git-upload-pack-command-not-found>
Git Guide Setup Guide : <https://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server>

Personal Homepage - ftp
```
ftp ihome.ust.hk
help
help glob
lcd /home/user/directoryname    #set local files
get file                        #get file from server
mget *.xls                      #get several files, for folder, you need to build a empty folder first
put file                        #upload file
mput *.xls
exit                            #close ftp
```
https://www.howtoforge.com/tutorial/how-to-use-ftp-on-the-linux-shell/



### 12. Thunderbird
addon google calendar
school-settings :
server-settings incoming IMAP outlook.office365.com port:993 ssl/tls
                outgoing smtp outlook.office365.com port:587 starttls

### 13. Dropbox
<https://www.dropbox.com/install>
Use .deb file
```
You might want to run 'apt-get -f install' to correct these:
The following packages have unmet dependencies:
dropbox : Depends: python-gtk2 (>= 2.12) but it is not going to be installed
python-gtk2-dev : Depends: python-gtk2 (>= 2.24.0-4ubuntu1) but it is not going to be installed
Depends: python-gtk2 (< 2.24.0-4ubuntu1.1~) but it is not going to be installed
Depends: libglib2.0-dev (>= 2.8) but it is not going to be installed
Depends: libgtk2.0-dev (>= 2.18.0) but it is not going to be installed
Depends: python-gobject-2-dev (>= 2.21.3) but it is not going to be installed
Recommends: python-gtk2-doc but it is not going to be installed
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).>)
```
Then better to compile from the source
```
No package 'libnautilus-extension' found
sudo apt-get install libnautilus-extension-dev
sudo apt-get install python-gtk2-dev
sudo apt-get install python-docutils-dev
```
Succeed

### 14. Wechat
```
npm install -g node-wechat-terminal
wechat-terminal
\h
node problem solution: sudo ln -s /usr/bin/nodejs /usr/bin/node
```
Because Debian renames node to node.js

<https://www.npmjs.com/package/node-wechat-terminal>

## 15. Evince Use Guide
Create own custom shortcuts
Enable /desktop/gnome/interface/can_change_accels flag in gconf

<https://help.gnome.org/users/evince/stable/shortcuts.html.en>

## 16. Sogou Pingyin Installation
Language Input Two Ways: i) ibus ii) fcitx

```
sudo apt-get install fcit
install sogoupinyin_xxxx.deb
fcitx-autostart
```
iibus
no other chinese option in text entry<http://askubuntu.com/questions/455682/14-04-chinese-ibus-input-no-options>
```
choose input source chinese pinyin
sudo apt-get install ibus-pinyin
ibus-setup
```
English Input hidden Problem
```
choose keyboad input method
keyboad settings
tick out use show hidden words(ctrl+alt+h)
```

Experience Conclusion:
1. Install Sogou Pinyin for linux (deb)
2. language support: keyboard input system - fcitx (no need to make chinese effect)
3. fcitx configure - input method - "+" icon - tick out "Only Show Current Language" - search "Sogou"

Settings: input method Global Config - Trigger Input Method (Ctrl + Tab) ; Extra key for trigger input method (disabled); Enable Hotkey to scroll between Input Method; Scroll betweeen input Method (Ctrl_shift)

<http://www.pinyinjoe.com/linux/ubuntu-10-chinese-input-pinyin-chewing.htm>

### 17. dictionary
dcit + goldendict
Commandline Interface: dict
```
#Installation
sudo apt-get install dict
sudo apt-get install dictd          #install dictionary framework
sudo apt-get install dict-gcid      #English dictionary database
sudo apt-get install dict-wn        #English dictionary database
sudo apt-get install dict-devil     #English dictionary database
sudo apt-get install dict-moby-treasures        #English moby treasures
#Usage
dict -d wn "dictionary"
dict "dictionary"                   #thesaurus
#workaround to include phoneme mnemonics
sudo apt-get install espeak
vim ~/.bashrc
add in bashrc
function define {
    # espeak for the pronunciation audible output and phonetic alphabet string
    echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"
    # dict - the client for the dictionary server
    dict "$1"
}
```
GUI
sudo apt-get install goldendict

<http://askubuntu.com/questions/170775/offline-dictionary-with-pronunciation-and-usages>

### 18. Message Box
zenity

notify-send 'hello' 'message'

### 19. Zotero
Follow my own instruction guide.
Use Dropbox for Syncronization

Better Bibtex-plugins - with vim support
Download .xpi and install to Zotero add-ons <https://github.com/retorquere/zotero-better-bibtex/releases/tag/1.6.72>

1. external curl solution
```
>vim cite
>curl -s http://localhost:23119/better-bibtex/cayw?format=citet
>:q
chmod u+x cite
mv cite ~/Linux/bin

>vim ~/.vimrc
nnoremap zz :r!cite<CR>
```
in vim, I can excute :r!cite or just zz in normal mode

2.

Ref:MIT <http://libguides.mit.edu/c.php?g=176000&p=1159208>



### 20. Visio Alternatives(Only Win)
Diagram - yEd , Dia Diagram
inkscape - use svg as its native file format            + openclipart(additional clip art graphics)
Libreoffice-draw (not so good)


Ask Question in Academia - <http://academia.stackexchange.com/questions/1095/software-to-draw-illustrative-figures-in-papers>
OmniGraffle(Mac,not free) > Xfig ; Tikz/PGF nice flexible diagrams
Inkscape

Final Decision : use inkscape and try to become a deep user

### 21. Web Development
Firefox : vimperator gf - switch to source code vision
          ctrl+shift+c  - inspect element

### 22. Emacs
emacs : without suffix is the GTK+ version
emacs-nox : without X server support
emacs-lucid : emacs with a Lucid user interface == lloks like old emacs, not use GTK+

```
sudo apt-get install emacs24        #113 MB
emacs -nw           #emacs no-windows-system
```
```
Exit : C-x C-c
```

<http://askubuntu.com/questions/386177/difference-between-emacs-and-emacs-lucid-packages>

<<<<<<< HEAD:help-doc/linux-problem.md-laptop

### 23. wine - Windows Software Support
installation
```
sudo dpkg --add-architecture i386       #enable 32bit
sudo add-apt-repository ppa:wine/wine-builds
sudo apt-get update         #BUG-GPG error
sudo apt-get install --install-recommends winehq-devel
```
GPG error
```
sudo add-apt-repository ppa:webupd8team/y-ppa-manager
sudo apt-get update
sudo apt-get install y-ppa manager
y-ppa-manager   -> advanced -> try to import all missing GPG keys and click ok
```
<http://askubuntu.com/questions/13065/how-do-i-fix-the-gpg-error-no-pubkey>
Not so good to use Wine to install Win-Software like Wechat and lingoes, but they can be used.


<https://wiki.winehq.org/Ubuntu>

Another way: install Electronic Wechat on Linux or Franz
I'd like to use Franz, more useful.

<https://www.linuxbabe.com/desktop-linux/install-wechat-linux>
=======

### 23. Netease Cloud Music
```
sudo dpkg -i xxx.deb
sudo apt-get -f install     #if meet some error, dpkg -i to install deb package will not install dependency automatically
```
### 24. PDF Tool Introduction
pdf split - pdftk
or just use evince print to the documents

