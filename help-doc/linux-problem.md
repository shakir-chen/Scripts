Linux Common Issues
=====================================

#Big Problem (TODO List)
1. GDB how to debug and watch line by line ? (snap serial)
2. GDB debug python
3. Debug Tools, how vim can do better than IDE tools?

4. ?? How to only move files without directory to a new folder ?
5. ?? Optimize Firefox Zotero and Somehow Integrate it with Betterbibtex??
6. ?? how to batch modify file name in the command line(awk,grep,sed)?   e.g. qemu-snap/ qemu-stream ??

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
    + printscreen
    + custom : shift+printscreen

#I. Program Develop in Linux
## Environment
```
python - ipython
bash - shell
IDE Tools - Netbeans, Eclipse
```

## Make
```
make
cmake
```


## Debug
```
gdb
pyclewn
```

## Search
### file name search
```
find
locate
```
### file content search
```
grep
sed
awk
```
### sort
```
sort
xarg
```

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
```
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
lshw        #show hardware information
df -h       #sda sda1 check flash log or not
```

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
```
od      #dump files in octal and other formats
iconv   #character code convert, example, utf8 to latin-1
```

## Network
```
nc      #netcat for tcp/ip swish army knife
ping
```

## Database
```
mysql
sqlite-browser      #view sqlite data
```
1. sqlite:
    ```
    sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
    sudo apt-get install sqlitebrowser
    ```

## Help
```
cheat   #usage info of command, simply form of man command
```
### cheat Installation
```
requirement: python,pip,git
pip install docopt pygments
git clone https://github.com/chrisallenlane/cheat.git
cd cheat
python setup.py install
cheat -v
export EDITOR=/usr/bin/vim #modify in .bashrc
cheat -e find       #add more personal information in ./cheat find
```

##bash recommendation utilities

<http://www.thegeekstuff.com/2010/11/50-linux-commands/?utm_source=feedburner> 
## Language Recommendation
+ python for quick and dirty things
+ c and c++ for efficiency
+ java for real desktop applications

## Batch Rename Under Linux
```
for f in *.png; do mv "$f" "${f#image}"; done       #image0001.png to 0001.png
```

#II. Ubuntu - Installation Guide
## Ubuntu Settings
### 0. Ubuntu - UST Computer Install
1. Hardware Installation
    + Windows EasyBCD
        New NeroGrub Entry
    ```
    title Install Ubuntu 16.04 LTS
    root (hd1,0)
    kernel (hd1,0)/vmlinuz.efi boot=casper iso-scan/filename=/ubuntu-16.04-desktop-amd64.iso ro quiet splash
    initrd (hd1,0)/initrd.lz
    ```
    U-disk : initrd.lz ; vmlinuz.efi ; ubuntu-16.04-desktop-amd64.iso
    C-disk : initrd.lz ; vmlinuz.efi ; ubuntu-16.04-desktop-amd64.iso

    <http://www.cnblogs.com/yzmb/p/ubuntu.html>

2. Better use USB2.0 Flash to install Ubuntu
    simply make an ubuntu installation usb disk

3. USB DISK maker
+ Others - Recommendation
<http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows>
+ Windows RUFU Installation:
<http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows>
+ Linux Startup disk creator - startup -> disk creator
<http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-ubuntu>

### 1. Caps Lock key change to additional CTRL
```
sudo apt-get install gnome-tweak-tool
```
open gnome-tweak-tool, typing, caps behavior -> make as an additional ctrl keys.

```
setxkbmap -option caps:ctrl_modifier
```
<http://askubuntu.com/questions/53038/how-do-i-remap-the-caps-lock-key>

Alt Disable: Keyboard Shortcut - Launchers - Keytoshow Hud -disable

### 2. change default shell
```
chsh -s /bin/bash
```

### 3. window move and resize
RECOMMEND: i3wm
```
wmctrl -d #show desktop
wmctrl -l #list all the windows
wmctrl -i -a <win-id>  #ignore other workspace; activate windows id
wmctrl -r :ACTIVE: -e 0,2000,100,1000,400           #-r specifies a target windows, -e resizes and moves
```
+ -a activate the window
+ -b add move or toggle up
+ -c close
+ -d list all desktops
+ -e resize and move a window that has been specified with a -r action
+ -g change the geometry w,h

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
+ Win Switch to Neighbor Workspace: super + arrow
+ Win Move to other Workspace: None
+ Workspace Switch : ctrl + number
+ Workspace Switch to Neighbor: ctrl + alt + arrow

#### terminal
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
```
sudo dpkg -i xxx.deb
sudo dpkg -r xxx            # may not exact that name xxx
```


### 6. Searching Technique in Linux - find,locate/grep, awk and sed

1. File Search (locate and find)
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

2. Text Search
    ```
    basic regular expressions $.*[\]^, need to put backslash
    in a nutshell, for sed 's/.../.../', $.*/[\]^
    ```
    + awk : pattern scanning and processing language          (input and processing)
    + sed : stream editor for filtering and transforming text (more delete and replace specific reglex)


REF: <http://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script>
<https://www.digitalocean.com/community/tutorials/how-to-use-find-and-locate-to-search-for-files-on-a-linux-vps>
<https://www.digitalocean.com/community/tutorials/how-to-use-find-and-locate-to-search-for-files-on-a-linux-vps>


### 7. Debug in Linux - gdb + vim + pyclewn
+ pyclewn
+ gdb
+ valgrind
+ strace
+ obdjump
+ oprofile
+ cscope
+ cmake

1. valgrind: build dynamic analysis tools - memory managemment and threading bugs
<http://valgrind.org/>
2. strace: monitor interactions between processes and the Linux kernel (useful)
3. objdump -d inspect the machine code, for performance sensitive loops
4. oprofile, hotspots in optimized code
5. cscope: search source code of the programming language C (useless) - find definitions to jump around
6. cmake
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

+ Volume Groups
+ Physical Volumes
+ LVM - Logical Volume Management : More Advanced than traditional method of partition

<https://wiki.ubuntu.com/Lvm>
<http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/>

+ Delete
```
umount /dev/foo/bar
lvremove /dev/foo/bar
```

### 12. Remove Ugly Tabs Interface in Ubuntu Terminal
####Two Ways
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


### 13. File Browser - Connect to server
ssh://username@hostpath

### 14. compress and uncompress
```
zip Filename.zip  File1, File2, File3
zip -r Folder.zip  Folder1, Foler2, Folder3
tar -xzvf filename.tar.gz
tar -czvf filename.tar.gz Files
```

### 15. Split Screen
+ Multiple Screen => Ubuntu Multiple Screen
+ Screen Split    => gtile
+ Terminal Split  => tmux
+ Firefox Split   => tile tab / tile view

gTile : (some error)
```
git clone https://github.com/lundal/vibou.gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou       # install in share/gnome-shell/extensions/ folder
killall -3 gnome-shell  # restart gnome, or use (alt+F2) + r + Enter
```
xtile : http://www.giuspen.com/x-tile/#downl
ERROR:NameError: global name 'appindicator' is not defined
sudo apt-get install python-appindicator
xtile-not so good as imagine, even not better then may self moving program

Think Shortcuts Integration with all of them

## III. Core Software Installation
| Type | 0 |1 |2 |3 | 4| 5| 6|
|----|----|----|----|----|----|----|----|
| GUI | Firefox | Thunderbird | Zotero | Dropbox | Franz | Zathura | Sogou |
|     | Freemind| Goldendict  | yEd| calmav | | | |
| Editor | vim | Emacs | Latex | WPS | | | |
| Develop| gdb | pygwen | cmake | pdb | Qt| Jupyter | |
| Version | git | svn | | | | |
| OpenTool | cuda | opencv| caffe| | | | |

<!-- | | | | | | | | | -->

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

#### Tips:
1. Go to definitions using g
    ```
    gd  go to local declaration ;    gD go to global declaration
    g*  search for the word under the cursor(like *, g* on 'rain' will find rainbow)
    g#  same as g*,but in backward direction
    gg  first line
    G   bottom line
    gf  go to the file
    g]  go to a tag
    ,zz call togglefold function and fold all
    zm  fold the function area
    zr  unfold the function area
    \   search result(use CtrlSF) and show in the left pane
    ,q  :q      #, map to <leader> key(\)
    ,y  copy selected area to clipboard
    :register see the register
    "ay copy to register a
    ,cc/,cu quick comment
    /   search
    ```

    <http://vim.wikia.com/wiki/Go_to_definition_using_g>

    Best Reference: Vim Command Wiki

Gramma/Language Check
LanguageTool => work for plain text
<http://tex.stackexchange.com/questions/6333/grammar-checking-tool-for-use-with-latex>

2. print or
:hardcopy > file
:hardcopy > file.pdf
:Tohtml     # but seem ugly

3. Install Plugin using Vundle
Plugin Management : ~/.vim/vimrc.bundles
+ install vundle (done)
    ```
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
+ update vimrc, or .vim/vimrc.bundles
    ```
    " @.vim/vimrc.bundles, gmarik/Vundle.vim is the half part of github.com/gmarik/Vundle.vim
    Plugin 'gmarik/Vundle.vim
    ```
+ :PluginStatus, and find an error, then use PluginInstall SchemeMode

<http://www.adamwadeharris.com/how-to-switch-from-vundle-to-vim-plug/>

4. filetype detect
```
:set filetype=scheme
```
better, auto detect:
```

```
autocmd BufRead,BufNewFile *.ctl set filetype=scheme
```

<https://github.com/rust-lang/rust.vim/issues/46>

5. highlight tools
```
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
```

#### English - Check Tools
1. Download:vim-plugin
    <http://www.vim.org/scripts/script.php?script_id=3223>
2. download languagetool
    Test LanguageTool from command line
    command-line:
    java -jar languagetool.jar
    java -jar languagetool-commandline.jar -l xx <filename>

3. specify the location of the file languagetool-commandline.jar in your $HOME/.vimrc file.
    Example:
      let g:languagetool_jar='$HOME/languagetool/languagetool-standalone/target/LanguageTool-3.3-SNAPSHOT/LanguageTool-3.3-SNAPSHOT/languagetool-commandline.jar'
4. Usage
    :LanguageToolCheck
    :lopen      #open the location-list window
    :lne        #jump to next error

    aspell (not update for long time)
    aspell -t -c file.tex

Execute selected text as vim commands ==> :@"   try: echo @"
<http://stackoverflow.com/questions/4268532/vim-how-to-execute-selected-text-as-vim-commands>

Best Vimscripts Tutorials
<http://learnvimscriptthehardway.stevelosh.com/chapters/49.html>

#### Frequent Plugins
1. Ctags usage
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

2. mark usage (vim contains)
    + help m      # in help motion text
    + m<a-zA-Z> : set a mark in current line
    + g'<a..>   : jump to maker a
    + '<a..>    : jump to maker a

3. plugin help general => ?
    + :PluginStatus

#### VIM Error
1. -xclipboard not enabled
sudo apt-get install vim-gtk
if not succeed
    which vim, check if it is installed in /usr/bin
    if vim @ /usr/local/bin/
        rm it /usr/local/bin/ and /usr/local/share/

### 2. Quick SSH Connect(store password and session)
Generate a public key locally and send it to server

```
cd ~
mkdir .ssh
chmod 700 .ssh
ssh-keygen     #enter keyfile:rsa_id  next phrase:psw #i3_rsa_id i3rsaid #$servername-xuanqi $servernamexuanqi
ssh-copy-id -i myrsaid.pub user@host
ssh user@host
```
__Tips__: SSH copy files between local machine and server - use scp
```
scp /path/to/file username@host:path/to/destination
scp username@host:/path/to/file path/to/destination
```

#### 2.1 Remote GUI program shown in Ubuntu
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

Ref: <http://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion>

<http://www.linuxfromscratch.org/blfs/edguide/chapter03.html>

<http://stackoverflow.com/questions/20273160/when-doing-a-subversion-commit-this-line-and-those-below-will-be-ignored>

<http://beerpla.net/2008/07/23/how-to-check-if-the-local-svn-revision-is-up-to-date/>

### 3. Other tools
+ PDF Reader-> evince
+ Microsoft Office -> Libreoffice
+ dropbox
+ TortoiseSVN -> SVN (<http://svnbook.red-bean.com/en/1.4/svn.ref.svn.html>)
+ mobi reader -> calibre

### 4. Freemind in ubuntu
install linux binary 2.6MB <http://freemind.sourceforge.net/wiki/index.php/Download>

alias mindopen="~/Software/freemind/freeMind.sh"

wget http://ftp.us.debian.org/debian/pool/main/f/freemind/freemind_0.9.0+dfsg-2_all.deb
<https://packages.debian.org/wheezy/all/freemind/download/>

Java Virtual Machine Issue; apt-get install openjdk-8-jre

 freemind depends on libjgoodies-forms-java; however:
  Package libjgoodies-forms-java is not installed.
 freemind depends on libjibx1.1-java | libjibx-java (>= 1.1); however:
  Package libjibx1.1-java is not installed.
  Package libjibx-java is not installed.
 freemind depends on libjibx1.1-java | libjibx-java (<< 1.2); however:
  Package libjibx1.1-java is not installed.
  Package libjibx-java is not installed.
 freemind depends on simplyhtml (>> 0.13); however:
  Package simplyhtml is not installed.

Big Issues Now: libjibx1.1 has updated to libjibx1.2 ; but freemind doesn't support libjibx1.2
Package libjibx1.1-java is not installed.

ant dist    # one common see instruction
<http://jotm.objectweb.org/current/test/doc/tests/node4.html>

/home/xuanqi/Software/freemind/freemind-mmx/freemind/build.xml:101: Unable to find a javac compiler;
com.sun.tools.javac.Main is not on the classpath.
Perhaps JAVA_HOME does not point to the JDK.
It is currently set to "/usr/lib/jvm/java-8-openjdk-amd64/jre"

<http://stackoverflow.com/questions/8400637/unable-to-find-a-javac-compiler>
jdk
```
sudo apt-get install openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk/bink
```
<http://stackoverflow.com/questions/14788345/how-to-install-jdk-on-ubuntu-linux>

### 5. Git
Quick Github Repo commit
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

+ Basic Branch and Merging Concept Here<https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging>
    ```
    git checkout XXX-discasrd-file
    ```
+ gitssh build
    1. add .ssh/id_rsa.pub to github
    2. Verification :>ssh -T git@github.com
    <https://help.github.com/articles/testing-your-ssh-connection/>

#### git server
```
$ git clone --bare my_project my_project.git
```

git on server - git-upload-pack command not found problem
    ```
    >cd /etc/ssh/sshd_config
    PermitUserEnvironment yes
    >/etc/init.d/sshd restart

    Test on local-PC
    >ssh username@hostserver "which git-upload-pack"
    ```
<http://stackoverflow.com/questions/11128464/git-upload-pack-command-not-found>
Git Guide Setup Guide : <https://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server>

git on server - git-upload-pack command not found problem
```
>cd /etc/ssh/sshd_config
PermitUserEnvironment yes
>/etc/init.d/sshd restart

Test on local-PC
>ssh username@hostserver "which git-upload-pack"
```
<http://stackoverflow.com/questions/11128464/git-upload-pack-command-not-found>
Git Guide Setup Guide : <https://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server>

### 6. package install guide
```
apt-cache show package          //description of package
apt-cache search package          //a short summary of all the texlive
apt-get install xxx
```
### 7. texlive choose and install
```
sudo apt-get install texlive-latex-base
```

Better Choice
```
sudo apt-get install texlive
sudo apt-get install texlive-latex-extra --no-install-recommends            #for a smaller extra package
```
Latex error: psboxit.sty not found
Listing not work
```
mkdir /usr/share/texlive/texmf-dist/tex/latex/psboxit           # the exact name, like unicode-math
wget -O psboxit.sty https://www.ctan.org/tex-archive/macros/latex209/contrib/misc/psboxit.sty
sudo mktexlsr #or: sudo texhash

apt-cache search psboxit    # no result
apt-cache show texlive-latex-extra | grep psboxit    # no result
```

[htpb]: h here, t top, b bottom, p page

+ pdf open tools - zathura: this pdfware is quite simple but powerful.
+ Evince: Annotation and highlight is in the left side with a tiny icon.

Error:
1. citet (author?)[4] problem
```tex
\usepackage[square,sort,comma,numbers]{natbib}
\bibliographystyle{plainnat}
```

### 8. tmux
navigate in terminal(tmux): ctrl-b + [ or ctrl-b+pageup/pagedown

Tips:

1. .tmux.conf and .tmux file
2. rename session
    + ctrl+B,: -> rename-session [-t current-name] [new-name]
    + if no name, just rename-session new-name
    + example: Jade Profiling Snap-Proj
3. Error-nested TMUX, unset $TMUX : solutions - unset TMUX
4. rearrange panes: ctrl-b + space or ctrl-b +meta+1-5

### 9. Temperature Monitor
```
sudo apt-get install lm-sensors
sudo sensors-detect
#sudo service kmod start
sensors
```

### 10. Account in Ubuntu
+ Add

    ```
    sudo adduser newuser #example newuser-> silly
    ```
+ Delete

    ```
    sudo userdel newuser #example newuser-> silly
    sudo rm -rf /home/newuser
    ```

### 11. connectable computer (ssh + ftp)
#### ssh
```
sudo apt-get install openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo chmod a-w /etc/ssh/sshd_config.original
vim sshd_config
    Port 2222
    PubkeyAuthentication yes
    Banner /etc/issue.net

sudo iptables -L

```

```
sudo apt-get install openssh-server
ps -A |grep sshd            #check sshd runs or not
ssh -v localhost            #check locally
sudo service ssh restart    #restart
```
<https://help.ubuntu.com/lts/serverguide/openssh-server.html>

#### Error:
1. Connection Time Out
    ```bash
    nc -v -z 127.0.0.1 2222     #network connection test localhost:2222
    sudo /etc/init.d/ssh restart
    ```
2. Permission Denied
    + Check password
    + unlock account
    ```
    usermod -U $usernmame
    ```
    <http://askubuntu.com/questions/315377/ssh-error-permission-denied-please-try-again>
    + check ip address
    ifconfig : inet addr:       # Get IP Address

    ssh username@localhost -p 2222  # silly sillyisafatpig


#### Personal Homepage - ftp
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
binary                          #if put meets bugs
```

<https://www.howtoforge.com/tutorial/how-to-use-ftp-on-the-linux-shell/>

### 13. Thunderbird
1. addon google calendar
    school-settings :
    server-settings incoming IMAP outlook.office365.com port:993 ssl/tls
                    outgoing smtp outlook.office365.com port:587 starttls

    TAC-settings:
        eetac@ust.hk password:Jjycjs2014
        IMAP: cas2013.exchange.ust.hk Port:993 ssl/tls Authentication:normal password
        SMTP: cas2013.exchange.ust.hk Port:587 STARTTLS  Authentication:normal password

2. Muttators
    + Muttators for Thunderbird = Vimperator for Firefox
    + Muttator => <http://www.vimperator.org/muttator>,download and Thunderbird install it from file
    + Muttator CheatSheat=> <https://gist.github.com/kartoch/5955822>
    + Tips:
        + gt - goto new tabs
        + gi - goto inbox
        + w - watch the structure;

3. Remove:
    Go to menu: Edit, Account Settings...
    Select account name on the left
    Either make any changes here (on the right) or Remove Account from the drop-down menu opened by clicking the Account Actions button at the bottom left




### 14. Dropbox
<https://www.dropbox.com/install>

1. Use .deb file

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
2. Then better to compile from the source

    ```
    No package 'libnautilus-extension' found
    sudo apt-get install libnautilus-extension-dev
    sudo apt-get install python-gtk2-dev
    sudo apt-get install python-docutils-dev
    ```

### 14. Wechat
1. terminal wechat (unstable, but interesting)
    ```
    npm install -g node-wechat-terminal
    wechat-terminal
    \h
    node problem solution: sudo ln -s /usr/bin/nodejs /usr/bin/node
    ```
    Because Debian renames node to node.js

    <https://www.npmjs.com/package/node-wechat-terminal>

2. Franz
    <http://meetfranz.com/>

## 15. Evince Use Guide
+ Create own custom shortcuts
+ Enable /desktop/gnome/interface/can_change_accels flag in gconf

<https://help.gnome.org/users/evince/stable/shortcuts.html.en>

## 16. Sogou Pingyin Installation
Alternative : google pinyin (sudo apt-get install fcitx-googlepinyin, im-config)

+ Language Input Two Ways
    1. ibus
    2. fcitx (recommend)

```
sudo apt-get install fcitx
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
+ English Input hidden Problem
```
choose keyboad input method
keyboad settings
tick out use show hidden words(ctrl+alt+h)
```
+ Experience Conclusion:
    0. Install Languae Support - use fcitx
    1. Install Sogou Pinyin for linux (deb)
    2. language support: keyboard input system - fcitx (no need to make chinese effect)
        logout
    3. fcitx configure - input method - "+" icon - tick out "Only Show Current Language" - search "Sogou"

+ 2nd Experience:
Settings:
    + input method Global Config - Trigger Input Method (Ctrl + Space)
    + Extra key for trigger input method (disabled)
    + Enable Hotkey to scroll between Input Method
    + Scroll betweeen input Method (Ctrl_shift) -> fcitx configure - input method - "+" icon - tick out "Only Show Current Language" - search "Sogou"

Fcitx-> Global Config -> Trigger Input Method: super+space

<http://www.pinyinjoe.com/linux/ubuntu-10-chinese-input-pinyin-chewing.htm>
<http://www.cnblogs.com/youxia/p/linux009.html>

#### Error:
1. No such key 'Gtk/IMModule' in schema 'org.gnome.settings-daemon.plugins.xsettings' as specified in override file '/usr/share/glib-2.0/schemas/50_sogoupinyin.gschema.override'; ignoring override for this key.

    Answer:  sudo apt-get -f install.  No use, just ignore this one.

    if you want to remove unnecssary input
    sudo apt-get remove fcitx-sunpinying

### 17. dictionary (goldendict)
+ dcit(Terminal) + goldendict (GUI)
+ Commandline Interface: dict
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
+ sudo apt-get install goldendict

<http://askubuntu.com/questions/170775/offline-dictionary-with-pronunciation-and-usages>
GoldenDict -- Recommend
stardict

<http://kdr2.com/resource/stardict.html>

<http://download.huzheng.org/babylon/bidirectional/>

terminal version - scdv
```
sudo mkdir /sur/share/stardict/dic/
sudo apt-get install scdv
sudo tar -xvjf stardict-xfardic-gnu-linux-2.4.2.tar.bz2 -C /usr/share/stardict/dic/
```
<https://flossstuff.wordpress.com/2012/01/23/sdcv-command-line-based-dictionary-for-linux/>

Sometimes due to the long definition of a particular word text scrolls down too fast for you
to read, advanced users can set SDCV_PAGER environment variable to /usr/bin/less. Now, less
will be used to display to the dictionary’s article. You may consider adding this to your
.bashrc file. Check out manpage for sdcv for more information.

### 18. Message Box
zenity

notify-send 'hello' 'message'

ubuntu shortcuts overlay (can't change)
<http://askubuntu.com/questions/126834/can-i-modify-unity-keyboard-shortcut-overlay>

i3wm : release
<https://www.reddit.com/r/i3wm/comments/4taxyh/bind_action_to_key_press_and_release/>

<https://mralphaville.wordpress.com/2014/08/13/i3-window-manager/>

### 19. Zotero
Follow my own instruction guide.
Use Dropbox for Syncronization

Profile:
1. General - tick out - take snapshots when creating item from web pages
2. Sync - tickout Sync full-text content
3. Advanced-Files and Folders - ~/Dorpbox/Paper

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

Ref:MIT <http://libguides.mit.edu/c.php?g=176000&p=1159208>

### 20. Visio Alternatives(Only Win)
+ Diagram - yEd , Dia Diagram
+ inkscape - use svg as its native file format            + openclipart(additional clip art graphics)         (how to rotate canvas? --wrong question, ask how to change page orientation instead, File-Document properties )
+ Libreoffice-draw (not so good)

Ask Question in Academia
<http://academia.stackexchange.com/questions/1095/software-to-draw-illustrative-figures-in-papers>
OmniGraffle(Mac,not free) > Xfig ; Tikz/PGF nice flexible diagrams
Inkscape

Final Decision : use yEd for quick drag and still use visio

### 21. Web Development (Firefox)
Plugins
+ vimperator
    + debug
        + gf - switch to source code vision
        + ctrl+shift+c  - inspect element
    + ;I : select picture in a new tab, y copy, d close
    + tips
+ keyconfig: cancel combined key
    + Ctrl-H for history   ==> delete
    + Ctrl-B for bookmarks ==> left
    + Ctrl-F for find      ==> right
    + integerate them with terminal shortcuts

<http://forums.mozillazine.org/viewtopic.php?t=72994>

<http://kb.mozillazine.org/Keyconfig_extension>

<http://kb.mozillazine.org/Keyconfig_extension:_Thunderbird>

### 22. Emacs
+ emacs : without suffix is the GTK+ version
+ emacs-nox : without X server support
+ emacs-lucid : emacs with a Lucid user interface == lloks like old emacs, not use GTK+

```
sudo apt-get install emacs24        #113 MB
emacs -nw           #emacs no-windows-system
```
```
Exit : C-x C-c
```

<http://askubuntu.com/questions/386177/difference-between-emacs-and-emacs-lucid-packages>

### 23. wine - Windows Software Support (not reconmmend)
installation
```
sudo dpkg --add-architecture i386       #enable 32bit
sudo add-apt-repository ppa:wine/wine-builds
sudo apt-get update         #BUG-GPG error
sudo apt-get install --install-recommends winehq-devel
```

#### GPG error
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

### 23. Netease Cloud Music
```
sudo dpkg -i xxx.deb
sudo apt-get -f install     #if meet some error, dpkg -i to install deb package will not install dependency automatically
```
sudo dpkg -r xxx.deb        # dpkg remove first

dpkg: dependency problems prevent configuration of netease-cloud-music:
```
netease-cloud-music depends on libqt5x11extras5 (>= 5.1.0); however:
Package libqt5x11extras5 is not installed.
netease-cloud-music depends on gstreamer1.0-plugins-bad; however:
Package gstreamer1.0-plugins-bad is not installed.
netease-cloud-music depends on gstreamer1.0-plugins-ugly; however:
Package gstreamer1.0-plugins-ugly is not installed.
netease-cloud-music depends on libqt5libqgtk2; however:
Package libqt5libqgtk2 is not installed.
```
```
dpkg: dependency problems prevent configuration of netease-cloud-music:
 netease-cloud-music depends on libqt5x11extras5 (>= 5.1.0); however:
  Package libqt5x11extras5 is not installed.
 netease-cloud-music depends on gstreamer1.0-plugins-bad; however:
  Package gstreamer1.0-plugins-bad is not installed.
 netease-cloud-music depends on gstreamer1.0-plugins-ugly; however:
  Package gstreamer1.0-plugins-ugly is not installed.
 netease-cloud-music depends on libqt5multimedia5-plugins; however:
  Package libqt5multimedia5-plugins is not installed.
 netease-cloud-music depends on libqt5multimediawidgets5; however:
  Package libqt5multimediawidgets5 is not installed.
 netease-cloud-music depends on libqt5libqgtk2; however:
  Package libqt5libqgtk2 is not installed.
```

### 24. PDF Tool Introduction
pdf split - pdftk
or just use evince print to the documents

Really Wonderful Pdftool : (better than evince) - qpdfview
need: pdf-tab/editor/vim-like/firefox enable

### 25. Xilinx ISE Installation (Driver Failed, not recommend)
<http://www.ohio.edu/people/starzykj/webcad/EE4143/Xilinx-ISE.html>
```
tar -xvzf Xilinx_ISE_DS_14.7_1015_1-1.tar
sudo ./xsetup

# finish installation from the IDE Prompt

cd .../14.4/ISE_DS
chmod u+x *.csh *.sh
/path_to_the_installation_dir/14.4/ISE_DS/settings64.sh         #Set IDE Environment

#run Xilinx Tool
/path_to_the_installation_dir/14.4/ISE_DS/ISE/bin/lin64/ise
/path_to_the_installation_dir/14.4/ISE_DS/ISE/bin/lin64/coregen
/path_to_the_installation_dir/14.4/ISE_DS/EDK/bin/lin64/xps
/path_to_the_installation_dir/14.4/ISE_DS/EDK/bin/lin64/xsdk
```

<http://stackoverflow.com/questions/15119734/how-to-launch-xilinx-ise-web-pack-under-ubuntu>

Key - 2100@eems05.ece.ust.hk

KeySettings
```
vim ~/.bashrc
export LM_LICENSE_FILE="2100@eems05.ece.ust.hk"
```

Install Xilinx USB Cable
```
cd /<Install Path>/Xilinx/<Version Number>/ISE_DS/common/bin/lin64/digilent
sudo ./install_digilent.sh
```
<http://elinux.org/Install_Xilinx_USB_cable_drivers_for_Ubuntu>

No Use here due to install windrvr6 => not support for newest Ubuntu Kernel even I change its name

#### Error

1. linux_common.h:28:4: error: #error "This kernel is too recent: not supported by this file"
    error "This kernel is too recent: not supported by this file"

    <http://www.xilinx.com/support/answers/22648.html>
    ubuntu not supported: from <http://www.xilinx.com/support/answers/29310.html>

### 26. VNC Viewer
login to the server
vncviewer 143.89.44.164:3 or vncviewer rostam:3

### 27. mount and umount
```
fdisk -l
mount -t ntfs /dev/sda2 /mnt/OS
umount /mnt/OS
```

iso
sudo mount -t iso9660 -o ro,exec cpu2006-1.2.iso /mnt
sudo umount /mnt

### 28. girp filename.md
pip install grip

### 29. Automatcially Save When Copy Image to VIM
1. command-line: get a URL inforamtion
wget http://virtualization.com/wp-content/uploads/2008/03/virtualization-kvm-ubuntu.png     #wget + URL
Local File?? Clipboard File??

2. URL Information Extraction
clipboard : xsel, xclip
```
ls -al | xclip
xclip filename.txt
xclip -o
wget $(xclip -o)        #get the Newest URL Infortmation
```
<https://www.howtoforge.com/command-line-copy-and-paste-with-xclip-debian-ubuntu>

3. URL Information Extraction

```
xclip -selection clipboard -t image/png -o > "`date '+%Y-%m-%d_%T'`.png"            #Could not use Image URL
wget Image_URL      #Only Useful Mouse Copy
```
Target not find Error: You must input the correct image type at once


4. Inspec Firefox Pictures
Vimperator :
```
;Iyd            #;I select picture in a new tab, y copy, d close
;c              # open menu tab to select copy
```
<http://superuser.com/questions/11173/copy-image-location-in-vimperator>
imageextender.js for .vimperator/plugin would be better. ;m find images, ;M save Image

<https://vimpr.github.io/plugins-en.html>

### 30. fbi : Terminal Way to show picture
sudo apt-get install fbi
sudo fbi -T 2 filename.png          # show picture in ppty terminal 2

### 31. pdb
py3.5 -m pdb filename.py            # this will support name complete

### 31. pdb
====
Another Three Application Environment
1. screenshot and add
    use copy
    ```
    xclip -selection clipboard -t image/png -o > "`date '+%Y-%m-%d_%T'`.png"            #always png type
    ```
    use save
    ```
    cp file $TEMPSAVE_PATH
    ```
2. clipboard picutre add
    xclip -selection clipboard -t image/png -o > "`date '+%Y-%m-%d_%T'`.png"

3. local file picture copy and move
    cp file $TEMPSAVE_PATH

### 32. Type - Klavro

### 33. Yum
Determine Path that a yum pakcage installed: rpm -ql package-name

### 34. Synergy
ubuntu 1.6.2
windows 1.6.2-baidu
ipad - isyerngyclient (jailbreak, cyber)
air display

windows: duet display - ipad mac + windows (fully external)
ubuntu: ipad use vnc, ubuntu and ubuntu use synergy
<http://www.adityavaidya.com/2015/03/ipad-as-2nd-monitor-now-on-linux.html>
<https://www.reddit.com/r/Ubuntu/comments/4lqzpq/ipad_as_second_display_on_ubuntu/>
<http://askubuntu.com/questions/28608/how-do-you-use-an-android-tablet-as-a-second-display>

i3wm with ipad
<https://rob.salmond.ca/tablet-as-external-monitor-with-i3wm/>

x11vnc
<http://askubuntu.com/questions/229989/how-to-setup-x11vnc-to-access-with-graphical-login-screen>
tightvnc is a desktop application, i feel really bad
ubuntu: vnc4server
```
sudo apt install xfce4 xfce4-goodies tightvncserver
vncserver                   #pwd:fullname
vncserver -kill:1           #first stop vnc server on 5901(5900+X)

cp ~/.vnc/xstartup ~/.vnc/xstartup.bak
vim ~/.vnc/xstartup         #automatically create after vncserver
    #~/.vnc/xstartup
    #!/bin/bash
    xrdb $HOME/.Xresources          # X-Desktop GUI read from .Xresources
    startxfce4 &                    # launch Xfce
chmod u+x ~/.vnc/xstartup
vncserver
ssh -L 5901:127.0.0.1:5901 -N -f -l username server_ip_address #Test from vnc client
#creating vnc server file
vim /etc/systemd/system/vncserver@.service
    #/etc/systemd/system/vncserver@.service 
    [Unit]
    Description=Start TightVNC server at startup
    After=syslog.target network.target

    [Service]
    Type=forking
    User=*YOURNAME*
    PAMName=login
    PIDFile=/home/*YOURNAME*/.vnc/%H:%i.pid
    ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
    ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
    ExecStop=/usr/bin/vncserver -kill :%i

    [Install]
    WantedBy=multi-user.target
sudo systemctl daemon-reload        # system aware new unit file
sudo systemctl enable vncserver@1.service
sudo systemctl start vncserver@1
sudo systemctl status vncserver@1           # check vnc status
```

<https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-16-04>
ipad:vnc viewer ()

Error : port cannot contact :  10.89.145.70::5901 instead of 10.89.145.70::5902

### 35. Change Default Program
Select File -> Properties -> Open with -> set as default

### 36. No sound in PC Ubuntu's Headphone
pavucontrol
<http://askubuntu.com/questions/132440/headphone-jack-not-working>

download oem
<https://code.launchpad.net/~ubuntu-audio-dev/+archive/ubuntu/alsa-daily/+packages>

pacmd list-sources #see all devices
<http://askubuntu.com/questions/769593/16-04-headphones-detected-but-not-switched-on-automatically-after-startup>
finally , use gnome-alsamixer and click autodetect headphone

### 37. U disk Recovery from install a OS system
windows: cmd; diskpart; list disk; select disk 1(attention, must select right disk); clean; in disk manager: new volumn

### 38. Locally install Vimperator

https://support.mozilla.org/t5/Problems-with-add-ons-plugins-or/Add-on-signing-in-Firefox/ta-p/30262

What are my options if I want to use an unsigned add-on? (advanced users)
Firefox ESR version 45, as well as the Developer Edition and Nightly versions of Firefox, will allow you to override the setting to enforce the add-on signing requirement by changing the preference xpinstall.signatures.required to false in the Firefox Configuration Editor (about:config page). There are also special unbranded versions of Firefox that allow this override. See the MozillaWiki article, Add-ons/Extension Signing for more information.

vimperator update
Install Unverified Addons
1. Address Bar => about:config => I accept the risk
2. xpinstall.signatures.required to false

Windows seems unable to install (just wait firefox verification)
Ref:<https://support.mozilla.org/t5/Manage-preferences-and-add-ons/Configuration-Editor-for-Firefox/ta-p/35030>

firefox accelarator:
1. about:config -> browser.cache.disk.enable : false ; browser.cache.memory.enable : true ;
2. right click to create new perference/integer, browser.cache.memory.capacity 100,000 kB
3. about:cache
<http://lifehacker.com/5687850/speed-up-firefox-by-moving-your-cache-to-ram-no-ram-disk-required>

### 39. Qt Install
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
chmod +x qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run

sudo apt-get install build-essenstial #Install Compiler
sudo apt-get install libfontconfig1 #Install OpenGL
sudo apt-get install libglu1-mesa-dev -y

set file assocition with pro files
```
//.local/share/applications/Qt-Creator.desktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=QtCreator
Comment=QtCreator
NoDsiplay=true
Exec=(Install folder of QT)/Tools/QtCreator/bin/qtcreator %f
Icon=(Install folder of QT)/5.4/Src/qtdoc/doc/images/landing/icon_QtCreator_78x78px.png
Name[en_US]=Qt-Creator
```
<https://wiki.qt.io/Install_Qt_5_on_Ubuntu>
Error:
qmake: No such file or directory
sudo apt-get install qt4-qmake libqt4-dev

### 40. System Information Show
Linux Version: uname -or ; lsb_release -irc

### 41. Markdown File Viewer
grip    # pip install grip
pandoc # universal type convert

### 42. ipython Jupyter
pip install jupyter
cd workdir
ipython notebook #or jupyter notebook

new python3

then you can input command online

### 43. WPS
install deb package, for rpm, alien rpm to deb and then install
dpkg -i xxx.deb

not good as image
<http://wps-community.org/downloads>

### 44. Suspend
pm-suspend: system is saved in RAM, power-needed, 3-5s
pm-hibernate: system is saved in disk, no power, 15-45s
pm-suspend-hybrid:

### 45. PC Info : lshw, i-nex, cpu-g
lshw
sudo lshw |less
sudo lshw -html > mypcinfo.html

i-nex NOT WORK:
$ sudo add-apt-repository ppa:nemh/gambas3
$ sudo add-apt-repository ppa:i-nex-development-team/stable
$ sudo apt-get update
$ sudo apt-get install i-nex
<https://www.unixmen.com/install-nex-0-6-2-ubuntu-linux-mint-elementary-os/>

### 46. antivirus program: calmav
sudo apt-get install clamav

calmscan -v * # current path files
calmscan -r /       # check all files displaying the name of each file
calmscan -r -bell -i / # only report infected file


Error:
1. LibClamAV Error: cli_loaddbdir(): No supported database files found in /var/lib/clamav
sudo freshclam
2.ERROR: /var/log/clamav/freshclam.log is locked by another process
ERROR: Problem with internal logger (UpdateLogFile = /var/log/clamav/freshclam.log).

sudo dpkg-reconfigure clamav-freshclam

<http://askubuntu.com/questions/250290/how-do-i-scan-for-viruses-with-clamav>
### 47. Host Email
sudo apt-get install mailutils      # and settings

### 48. Github Flavoured Markdown to HTML
npm install markdown-to-html -g
```
github-markdown $mdname -h -s "./css/github.css" > $htmlname     # --flavour 'gfm' has some error
```
<https://github.com/cwjohan/markdown-to-html>


Errors:
1. /usr/bin/env: ‘node’: No such file or directory
sudo ln -s nodejs node

2. seems no colors
<https://www.npmjs.com/package/markdown-to-html>

II. markdown-styles
<https://github.com/mixu/markdown-styles>

<https://www.chainsawonatireswing.com/2012/02/01/how-to-highlight-code-on-a-webpage-when-youre-using-markdown-to-create-that-webpage/?from=@>


math wiki
<https://github.com/cben/mathdown/wiki/math-in-markdown>

may be true:
<https://github.com/goessner/mdmath>

### 49. Caffe Install

<http://caffe.berkeleyvision.org/installation.html>
Test:
<http://christopher5106.github.io/deep/learning/2015/09/04/Deep-learning-tutorial-on-Caffe-Technology.html>

### 50. tty
ctrl+alt+F1~7

### 51. xrandr
reset display resolusion
xrandr -s 1920x1080
xrandr -s 0

### 52. get mouse position
xdotool getmouselocation

### 53. without git pop-up windows
unset SSH_ASKPASS
unset GIT_ASKPASS

### 54. fast compile latex
1. pdflatex -draftmode XX.tex
or pdflatex -interaction=batchmode XX.tex
2. split and compile partly , includeonly
<http://tex.stackexchange.com/questions/8791/speeding-up-latex-compilation>
<http://hilbertastronaut.blogspot.hk/2008/12/making-latex-builds-faster.html>

### 55. image operation
imagemagick is really a cool tools !
```
convert +append *.png out.png       # combine, vertically use -append
```
feh, eog is also good

### 56. meep - FDTD simulator from MIT
simple:
```
sudo apt-get install libcr-dev mpich2 mpich-doc     #install mpich
sudo apt-get install meep-mpich2 h5utils                   #meep
```

### 57. change process priority
niceness or nice value: -20 to 19
```
top NI
ps -o pid,comm,nice -p XXX          # show niceness value
nice -n 10 apt-get upgrade          # set niceness for apt-get command
renice 10 -p XXX                    # reset niceness for existing process
                                    # only root can apply negative nice values
vim /etc/security/limits.conf
[username] hard priority 1          # pariticular priority
```
<https://www.nixtutor.com/linux/changing-priority-on-linux-processes/>

### 58. opengl
$ sudo apt-get install build-essential      # install essential build environment
$ sudo apt-get install libgl1-mesa-dev      # install OpenGL Utilities
$ sudo apt-get install libglu1-mesa-dev     # install OpenGL Utility Toolkit, enhence opengl windows
$ sudo apt-get install freeglut3-dev         # if cannot install libglut-dev
<http://www.linuxidc.com/Linux/2012-05/60771.htm>
Tutorial
<https://learnopengl.com/#!Introduction>
<https://en.wikibooks.org/wiki/OpenGL_Programming>

### 59. Chinese Ubuntu update source

```
sudo vi /etc/apt/sources.list

    deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse

    ## test
    deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse

    # sourcecode
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse

    ## test sourcecode
    deb-src http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse

    # Canonical 合作伙伴和附加
    deb http://archive.canonical.com/ubuntu/ xenial partner
    deb http://extras.ubuntu.com/ubuntu/ xenial main

sudo apt-get update
```

### 58. guile (scheme, used in MIT MEEP)
<https://www.gnu.org/software/guile/download/>

### 59. Build Tools
+ Autotools
    - Autoconf (mostly): scans existing tree
    - Automake : provide short template to determine built-program;
    - Libtool : very cool tool for simplifying the building and installation of shared libraries
    - CMAKE

+ GNU coding standards
<http://stackoverflow.com/questions/719057/why-use-build-tools-like-autotools-when-we-can-just-write-our-own-makefiles>

### 60. Develp Tools (pkg-config, locale)
1. pkg-config
pkg-config --list-all | grep ltdl       #shows nothing

To see where pkg-config search ===
pkg-config --variable pc_path pkg-config

```
pkg-config --cflags --libs x
cc `pkg-config --cflags --libs x` -o myapp myapp.c
```
pkg-config --cflags --libs QtGui #

Deeply understand compile library
```
gcc -o output example.c -lGL -lGLU -lglut       # guess GL is a package
pkg-config --list-all | grep gl         # list gl ...

pkg-config --cflags --libs gl           # cflags,  library
```
CFLAGS -I/xx/xx/include, header fine
library, LDFLAG, libary .so
<https://people.freedesktop.org/~dbn/pkg-config-guide.html>

 XXX-dev vs. XXX : XXX-dev most often contain the header related to a library's interface
dpkg -L freeglut3-dev   # show you freeglut3's path
<http://stackoverflow.com/questions/1157192/what-do-the-dev-packages-in-the-linux-package-repositories-actually-contain>

 A library is only visible to pkg-config if an appropriate configuration file (with extension .pc) is put in the directory /usr/lib/pkgconfig (or some other standard location where pkg-config looks, such as /usr/local/lib/pkgconfig). If the authors (or packagers) of the library did not create such a file, the library will not be seen by pkg-config.
 Apparently the authors of freeglut3 have not created a .pc file. In Debian and its derivatives (including Ubuntu), the .pc file is usually included with the -dev packacge. This list of freeglut3-dev files does not contain a .pc file, so this library is not visible to pkg-config. Likewise, the file lists for libglu1-mesa-dev and other GL/GLU packages do not include .pc files. 

<https://ubuntuforums.org/showthread.php?t=832003>

then add .pc file will fix the answer
pc file missing report : <https://gist.github.com/darealshinji/5391d9cbd211193c6a88d95cd55cf1a8>

<https://people.freedesktop.org/~dbn/pkg-config-guide.html>

Question: don't show PKG_CONFIG_PATH
    pkg-config --variable pc_init pkg-config

pkg-config --variable pc_path pkg-config            # T-T not pc_init
Finally, pkg-config (version 0.24 or later), but mine is 0.21
<http://askubuntu.com/questions/210210/pkg-config-path-environment-variable>


2. locale

### 61. Mount USB
```
df -h           # show filesytem
lsblk
sudo mkdir /media/usb
sudo mount -t vfat /dev/sdb1 /media/usb
sudo umount /media/usb or sudo umount /dev/sdb1
```

### 62. Host
```
sudo cp ~/Software/Scripts/ip-host/hosts-ipv6 /etc/hosts
sudo /etc/init.d/ssh restart
# no inid.d
service ssh restart         # or restart ssh
/etc/init.d/sshd $ACTION
```
<https://superuser.com/questions/214799/no-etc-init-d-sshd-file-ubuntu-ec2>

### 63. change host
```
vim /etc/host/source.list
```
### 64. pdf cropper
online => search pdf cropper            # very slow and inconvinient
python tool => pypdf2                   # batch processing, but not interactively
ubuntu tools => briss                   # java <https://onetransistor.blogspot.hk/2016/01/pdf-crop-linux-software.html>, pdf-trim, pdf-crop

### 65. install unrar on centos
yum install unrar, cannot find unrar
then download .rpm package and unpack it.

really good rpm websit : rpmfind.net
<ftp://rpmfind.net/linux/dag/redhat/el7/en/x86_64/dag/RPMS/unrar-5.0.3-1.el7.rf.x86_64.rpm>

ref:
<http://www.linuxquestions.org/questions/linux-newbie-8/how-to-unrar-on-linux-671981/>

## 66. urxvt blink
just input like bellow, which is set by xterm not urxvt
```
echo -e "\033[5 q"]"
```
https://bbs.archlinux.org/viewtopic.php?id=177281


urxvt underscore problem
change the fontsize from 14 to 13
<https://bbs.archlinux.org/viewtopic.php?id=125749>
urxvt -fc "xft:Font Awesome"
urxvt -fc "xft:DejaVu Sans Mono:style=Book:antialias=false:size=8"
urxvt -fc "xft:Microsoft Yahei:style=Book:antialias=false:size=8"

## 67. Know how much size
du -sh *
<http://www.kavoir.com/2009/09/linux-check-how-much-disk-storage-each-directory-takes-up-disk-usage-command-du.html>

## 68. Bluetooth - PC
```
bluetoothctl

list
devices
trust FC:A8:9A:A3:50:7A
pair FC:A8:9A:A3:50:7A
connect FC:A8:9A:A3:50:7A

```

<https://gist.github.com/nickboldt/a38627408d32fcf7c365>

how to setup a Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)
<https://askubuntu.com/questions/779442/how-to-setup-a-cambridge-silicon-radio-ltd-bluetooth-dongle-hci-mode>

<https://askubuntu.com/questions/763939/bluetoothctl-what-is-a-bluetooth-agent>

## 69. Ctrl+Semicolon(;)
fictx, clipboard
an addon in fcitx named Clipboard. To disable it, simply open Fcitx Configuration -> Addon -> Clipboard, then either disable it or change its trigger key. Addon -> Clipboard

urxvt cannot paste long text: use ctrl+alt+v

## 70. Harddriver lifetime
sudo apt-get install smartmontools
sudo smartctl --all /dev/sda | grep Power_On_Hours

#### ERROR
1.TIFF4 depency:
    The only way:
    ```
    conda remove libtiff
    ```
<https://github.com/Russell91/apollocaffe/issues/11>

2. ipython2 - "import caffe" ImpportError: No module named skimage.io
    ```
    pip install scikit-image --upgrade
    ```

3. ipython3 - "import caffe"
    ImportError: dynamic module does not define module export function (PyInit__caffe)

    Caffe cannot support python3

4. import caffe error:
    Intel MKL FATAL ERROR: Cannot load libmkl_avx2.so or libmkl_def.so.
    ```
    conda install nomkl numpy scipy scikit-learn numexpr
    conda remove mkl mkl-service
    ```
<https://github.com/BVLC/caffe/issues/3884>

5. import caffe no module named \_caffe
    ```
    make pycaffe
    ```

#IV. Hardware Help
## 1. Lab Printer Help
Ubuntu Add Printer:
Printers -> Add -> Network Printer -> Find Network Printer -> Choose Kyocera FS-2100DN (143.89.135.11) -> Connections( LPD network printer via DNS-SD) -> Forward, Forward -> Ubuntu will choose to use 1st cassete
### Ubuntu Office Print
IPP Device URI: https://eems04.ee.ust.hk/printers/esl080/.printer
Make and Model: HP LaserJet 9050 Postscript (recommended)

Failed, don't know the reason   - Could send an Email to the ITSC
<http://itsc.ust.hk/kb/article.php?id=567>

### Lab Cancel A Print Task
Cancel a print task: when it comes "load papers in a cassete", press red button (stop and show pause Filename || figure) => press pack and okay button and click yes. Delete unwanted task then.

#V. Bug
## 1. Bash: Bad Substitute Error
bash xxx.sh instead of sh xxx.sh


