# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.  shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# min js to min.js      ==>  uglify *.js >> *.min.js


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# Initial Program
# xrandr --output DP2 --rotate left --right-of VGA1; xrandr --output VGA1 --primary

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias fehg="feh --reload 1 -B black -d -N --geometry 500x500 --auto-zoom"
alias feh="feh -B black -d -N --auto-zoom"
alias fehbgfill="feh --bg-fill"
alias fehscreen="feh --bg-fill ~/Dropbox/Linux/Pictures/wallpaper/chip/intel-chip-wallpaper.jpg"
alias fehscreencd="cd ~/Dropbox/Linux/Pictures/wallpaper/"
alias i3lock="i3lock -i ~/Dropbox/Linux/Pictures/wallpaper/nature/lock/3.png"
# variety:  wallpaper desktop

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#  if [ "$USER" == "xuanqi" ] ; then           # super L =>
#    xmodmap -e "keycode 133= Control_L"        # Super L => backspace
#    xmodmap -e "keycode 37= Super_L"        # Super L => backspace
# fi

if [ "$USER" == "shakir" ] ; then           # laptop
    setxkbmap -option caps:ctrl_modifier
fi

export PATH=~/Software/Scripts/linux-bin:${PATH}
export PATH=~/Software/Franz/:${PATH}
# export LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}
# export LD_LIBRARY_PATH=~/Software/boost/lib/:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/pulse:$LD_LIBRARY_PATH

# Rafael Newest gcc & boost
export PATH=/local/home/rafael/softwares/gcc/bin:${PATH}
export LD_LIBRARY_PATH=/local/home/rafael/softwares/gcc/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/local/home/rafael/softwares/gcc/lib:$LD_LIBRARY_PATH

# export BOOST_ROOT=/home/rafael/softwares/boost/src
# export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH
export PATH=~/Software/cmake-3.15.0-rc3-Linux-x86_64/bin:${PATH}
# export LD_LIBRARY_PATH=~/Software/cmake-3.15.0-rc3-Linux-x86_64/bin:${PATH}
export CMAKE_ROOT="~/Software/cmake-3.15.0-rc3-Linux-x86_64/"

# export LD_LIBRARY_PATH=/usr/local/lib/libglfw3.a:${LD_LIBRARY_PATH}
# export BOOST_ROOT=~/Software/boost/include
# export GLFW_SOURCE_DIR=/home/xuanqi/Downloads/glfw/glfw-3.2.1

# cheat add
export EDITOR=/usr/bin/vim

export PKG_CONFIG_PATH=/usr/bin/
export PKG_CONFIG_PATH=$HOME/Software/Qemu/Qemu-1026/dependent_library/pixman:${PKG_CONFIG_PATH}            # build for Qemu
export PYTHONPATH=/usr/local/lib/python3.5/site-packages/:${PYTHONPATH}
export PYTHON3_EXCUTABLE=/usr/bin/python3.5
export PYTHON_INCLUDE_DIR=/usr/include/python3.5
export PYTHON_LIBRARY=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5.so

# export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:${PYTHONPATH}

# virtualenv and virtualenvwrapper, used for opencv
if [ "$HOST" == "lab" ] ; then           # laptop
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.5
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
    export OPENCV_TEST_DATA_PATH=~/Software/OpenCV/opencv_extra/testdata
fi
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=/usr/lib/jvm/java-8-openjdk-amd64/bin:${PATH}

export PATH=~/Software/selenium:${PATH}             # selenium driver geckodriver

# import sys; sys.path.append('/usr/local/lib/python2.7/site-packages')

#PS1='$ '
#PS1='\[\033[33m\]\w\[\033[36m\]\[\033[0m\]$]]]'

#RED='\[\033[0;36m\]]'
#WHITE='\[\033[1;37m\]]'
#PS1='${RED}\H:\W${WHITE}$ '

#PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "
PS1="\[\033[1;34m\][\H:\W]$\[\033[0m\] "
LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# Unfreeze Ctrl-S, use ctrl-Q quit and begin to work
# http://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
stty -ixon  # change ctrl-s to search

#LICENSE FILE SET
# export XILINXD_LICENSE_FILE="2100@eems05.ece.ust.hk"
# export LM_LICENSE_FILE="2100@eems05.ece.ust.hk"
export LM_LICENSE_FILE="7852@eesur5.ece.ust.hk"     # modelsim

# zip existing.zip --out new.zip -s 50m             => seperate zip to different parts

# Setup Scripts =====
# source ~/.helprc
# bash Soft-Open.sh       # Setup Programs

# echo -e "\033[5 q"
echo -e "\033[6 q"      # not blink, vertical bar, cursor
# echo -e "\033[7 q"      # not blink

# grep =======================================================
#alias grep --color=auto
alias gpnosvn="grep -R --exclude-dir=.svn --exclude='*.o' --color=auto" #grep >=2.5.2    R/r: with/without link file
alias gp="grep -R "
alias gp3="grep -A 1 -B 1 -r --color=auto" #grep in detail
alias gp4="grep -A 2 -B 1 -r --color=auto" #grep in detail 4 lines
alias gp5="grep -A 3 -B 1 -r --color=auto" #grep in detail 5 lines
alias gph="grep -r -i --include \*.h --color=auto"  #grep header file
alias gpc="grep -r -i --include \*.c --include \*.C --color=auto"  #grep c file
alias gpcpp="grep -r -i --include \*.cpp --color=auto"  #grep cpp file
alias gppy="grep -r -i --include \*.py --color=auto"  #grep cpp file
alias gpp="gp 'print' *.py | grep -v '# print'" #grep print

function gptype(){
    grep -r -i --include \*."$1" --color=auto "$2"
}

# useradd XXX; passwd XXX; usermod -aG GROUP username
# sudo adduser -G groupName userName
# view and change group: /etc/group,        or groups
# view user groups, groups username
# userdel username      # remove an account
# sudo usermod -g groupName userName     # add primary group
# sudo usermod -a -G groupName userName     # add secondary group
# view all users: https://askubuntu.com/questions/410244/a-command-to-list-all-users-and-how-to-add-delete-modify-users

# ls =======================================================
alias l.="ls -d .* --color=tty"
alias ll="ls -l --color=tty"
alias lsf="ls -p --color=tt | grep -v / | tr '\r\n' '\t'"        # list only file, tr translate or delete, tr -d
alias lshf="ls -pa --color=tty | grep -v /"     # list include hidden file
alias lsd="ls -p --color=tty | grep /"     # list include hidden file
alias lshd="ls -pa --color=tty | grep /"     # list include hidden file
alias ls="ls --color=tty"
alias lsusbpower="lsusb  -v |egrep '^Bus|MaxPower'"
alias llmb="ll --block-size=M"
alias lsmem="sudo dmidecode -t 17"
alias lsmemsize="cat /proc/meminfo"     # free -m, vmstate, top

alias usbmount="sudo mount /dev/sdb1/ /media/usb"       # lsblk
alias usbumount="sudo umount /dev/sdb1/"

# vim =======================================================
alias vim="vi"
alias vimplan="vim ~/plan.txt"
alias vimbashrc="vim ~/.bashrc"
alias vimhelprc="vim ~/.helprc"
alias vimmakefile="vim Makefile"                # no ouput:  &>/dev/null
alias vimbus="vim ~/Dropbox/Linux/notes/business.md"
alias vimos="vimfind os"
alias vimlife="vimfind vim-life"
alias vimtext="vimfind text-tips"
alias vimproblem="vimfind linux-problem"
alias vimpy="vimfind python"
# alias vimjava="vimfind java"
alias vimjade="vim ~/svn/Discussion/Xuanqi\ Chen/Tools/Jade/JADE-Dairy.md"
alias vimbuild="vimfind build-compile"
alias vimcv="vimfind cv"        # opencv
alias vimsnipptpy="vim ~/.vim/UltiSnips/python.snippets"        # opencv
alias vimsnipptmd="vim ~/.vim/UltiSnips/mkd.snippets"        # opencv
alias vimstylempl="vim ~/.config/matplotlib/stylelib/xuanqi-seaborn.mplstyle"
alias vimi3config="vim ~/.i3/config"
alias vimzathurarc="vim /etc/zathurarc"

alias makenoout="make &>/dev/null"

function vimfind(){
    if [ -f ~/Software/Scripts/help-doc/$1.md ]; then
       vim ~/Software/Scripts/help-doc/$1.md
    elif [ -f ~/Documents/Blog/Homepage/Homepage-V5/blog/md/$1.md ]; then
        echo "find one"
       vim ~/Documents/Blog/Homepage/Homepage-V5/blog/md/$1.md
    else
       echo "-------github---------"
       ls ~/Software/Scripts/help-doc/
       echo "-------blog---------"
       ls ~/Documents/Blog/Homepage/Homepage-V5/blog/md
       read -p "file not find, change one?  " read_flag
       vimfind $read_flag
    fi
}

function vimbin(){
    vim $(which $1)
}
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
alias volumeup="pactl set-sink-volume 1 +10%"
alias volumedown="pactl set-sink-volume 1 -10%"

alias makee="make edit"
alias makeo="make open"
alias makeh="make help"
alias maker="make run"
alias makec="make clean"
alias maketee="make 2>&1| tee maketee.log"
alias xpropwm="xprop | grep WM_CLASS"
alias xpropls="xprop -notype -root"         # xwininfo


alias ctagsr="ctags --extra=+f -R ."

# program open in ubuntu
# alias open="xdg-open"
alias openfolder="nautilus --browser --no-desktop"
# gsettings set org.gnome.desktop.background show-desktop-icons false       ## directly way, no-desktop by default
function open(){
    if [[ -d $1 ]]; then
        echo "This is directory"
        vifm $1     #nautilus $1
    else
        xdg-open $1 &
    fi
}

# vicd()
# {
    # local dst="$(command vifm --choose-dir -)"
    # if [ -z "$dst" ]; then
        # echo 'Directory picking cancelled/failed'
    # return 1
    # fi
    # cd "$dst"
# }
alias ustvpn="/usr/local/pulse/PulseClient.sh -h remote.ust.hk -u xchenbr -r HKUST"
# alias ustvpncheck="/usr/local/pulse/PulseClient.sh -S"
alias ustvpncheck="ps -ef |grep 'pulseclient'"
alias vpn="/usr/local/pulse/PulseClient.sh"
alias vpnui="/usr/local/pulse/pulseUi"
alias ustsftp="sftp xchenbr@sftp.student.ust.hk"        # start vpn first
alias vpnportopen="sudo firewall-cmd --zone=public --add-port=5900/tcp"     # server vpn opening, 5900-5904

#cheat-github
alias cheatls="cheat -l"
alias cheatedit="cheat -e"

# tar
alias tarc="tar -cvzf"
alias tarx="tar -xvzf"      # tar.bz2 use -jxf

# clear
alias cl="clear"

# mkdir
alias mkd="mkdir"

# compiler
alias ftn="gfortran"

# python
alias py="python3.5"
alias py3.5="python3.5"
alias py2.7="python2.7"
alias ipythoni="ipython3 -i ~/Software/Scripts/pdb/ipython_init.py"

# alias mp3split="mptsplit input.mp3 [00:00:20-00:00:58] -o output.mp3"


# pdf reader
alias pdfcrop="java -jar ~/Software/briss/briss-0.9/briss-0.9.jar"       #centos, trim
# pdfcut in.pdf 7       pdfcut in.pdf 7-end
# pdfunite input_list output.pdf                join multiple pdf
function pdfcut() {
    pdftk "$1" cat "$2" output cut-"$2".pdf 
}
# png trim
function pngtrim() {
    convert "$1" -trim "$1"
}

function pdfcompress() {
PDFNAME=$(echo $1 | sed -r "s/\.pdf/_c.pdf/g")
echo "$1 ==> $PDFNAME"
# /screen 72dpi, /printer 300dpi, /ebook 150dpi, /default lager
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$PDFNAME $1
}

#alias pdf="acroread"       #centos
# alias pdf="evince"
# function evince() {
    # evince $1 &
# }

# Zotero
alias zotero="~/Software/Zotero/Zotero_linux-x86_64/zotero &"     #make a bin file

#Set Caps to Control Key
# https://askubuntu.com/questions/296155/how-can-i-remap-keyboard-keys
alias setcaps="setxkbmap -option caps:ctrl_modifier"
alias setcapsnone="setxkbmap -option caps:none" #use for hhkb

alias setwinctrl="setxkbmap -option ctrl:lctrl_meta;setxkbmap -option altwin:meta_win;setxkbmap -option altwin:ctrl_win"
# alias setwinctrl="setxkbmap -option altwin:ctrl_win"

# alias setscreen="xrandr --output DP2 --rotate left --right-of VGA1; xrandr --output VGA1 --primary"
# alias setscreen="xrandr --output DP1 --rotate left --left-of VGA1; xrandr --output VGA1 --primary"
alias setscreen="xrandr --output DP1 --rotate right --right-of VGA1; xrandr --output VGA1 --primary"
# hhkb mapping, (last line): Fn, alt, space, alt, win
# https://wiki.archlinux.org/index.php/xmodmap
# alias hhkb="xmodmap -e 'keycode 51 = BackSpace'"        #  => backspace
# alias hhkb2="xmodmap -e 'keycode 49 = Escape'"      # ~ => ESC
function hhkb(){
    xmodmap -e "keycode 51 = BackSpace"        # \ => backspace
    xmodmap -e "keycode 22 = backslash bar"    # backspace => \|
    xmodmap -e "keycode 49 = Escape"           # ~ => ESC
    # xmodmap -e "keycode 105= Super_R"          # control_R => Super_R
    # xmodmap -e "keycode 133= Super_R"          # Super_L => Fn
    xmodmap -e "keycode 9 = grave asciitilde"          # Ctrl_L => ~`
}
function hhkbreset(){
    xmodmap -e "keycode 51 = backslash bar"        # backspace => \
    xmodmap -e "keycode 22 = BackSpace"      # backspace => \|
    xmodmap -e "keycode 49 = grave asciitilde"      # 51 => ~ 
    # xmodmap -e "keycode 105= Control_R"          # control_R => Super_R
    xmodmap -e "keycode 9 = Escape"          # Super_L => Fn
}

alias xrandrinit="xrandr --output VIRTUAL1 --off"
alias xrandrmodipad="xrandr --newmode '808x1080_60.00' 72.45 808 856 944 1080 1080 1081 1084 1118 -HSync +Vsync; xrandr --addmode VIRTUAL1 '808x1080_60.00'"
alias xrandrviripad="xrandr --output VIRTUAL1 --mode 808x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal"
# alias xrandrmodipad="xrandr --newmode '1536x2048_60.00' 270.55 1536 1664 1832 2128 2048 2049 2052 2119 -HSync +Vsync"
# alias xrandrviripad="xrandr --addmode VIRTUAL1 '1536x2048_60.00'; xrandr --output VIRTUAL1 --rotate left --mode 1536x2048_60.00 --left-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal"

alias xrandrmodiphone="xrandr --newmode '752x1334_60.00' 84.85 752 808 888 1024 1334 1335 1338 1381 -HSync +Vsync"
alias xrandrviriphone="xrandr --output VIRTUAL2 --mode 752x1334_60.00 --left-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal"

alias xrandrdellhori="xrandr --output DP1 --rotate normal"
# alias xrandrdellvert="xrandr --output DP1 --rotate left"
alias xrandrdellvert="xrandr --output DP1 --rotate right"
# alias xrandrflip="xrandr --output DP1 --rotate right"
alias xrandrflip="xrandr --output eDP1 --rotate inverted"

# vnc
alias vncstart="x11vnc -usepw"
alias vncipad="x11vnc -clip 808x1080+1921+0"
alias vnciphone="x11vnc -clip 752x1334+0+0"
# alias vncipad="x11vnc -clip 1536x2048+0+0"
# alias vncipad="x11vnc -clip 1536x2048+1921+0"

# function yEd(){
   # cd ~/Software/yEd
    # ./yEd
# }
alias yEd="cd ~/Software/yEd && ./yEd &"            #Program-Flow-Diagram
# function yEd() {
    # CURRENTPWD=$(pwd)
    # cd ~/Software/yEd
    # ./yEd
    # cd $CURRENTPWD
# }
function sshadd() {
    eval `ssh-agent -s`
    echo "hello"
    find ~/.ssh/i3_rsa_id -exec ssh-add {} \;
    # ssh-add .ssh/passion_xuanqi
}

# use expect: <https://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-password-prompt>

# apt-get
alias aptget="sudo apt-get install"
alias aptcache="apt-cache show"

# export SSH_CHECK_VALUE=0
function sshcheck(){
    if [ "$USER" == "shakir" ] ; then
        return
    fi
    licenseinfo=$(ssh-add -l | grep 'no identities')
    # if [[ "$licenseinfo" == "" ]];then        # bash
    if [ ! -z "$licenseinfo" ];then       #shell
    # For it will print "SSH-client no identities" Info
        # echo "No SSH License Add"
        eval `ssh-agent -s`
        find ~/.ssh/i3_rsa_id -exec ssh-add {} \;
    fi
}

# sh
alias sh="bash"
# open and close touchpad
function xinputclosetp(){
    num=$(xinput | grep -i TouchPad | grep -oP 'id=\K\d+')
    xinput --disable $num
}
function xinputopentp(){
    num=$(xinput | grep -i TouchPad | grep -oP 'id=\K\d+')
    xinput --enable $num
}

# ssh
alias sshpassion="ssh-server passion"
alias sshfantasy="ssh-server fantasy"
alias sshvirtualdesktop="ssh xchenbr@acf2013.ece.ust.hk"
alias sshrostam="ssh-server rostam"
alias sshmagic="ssh-server magic"
alias sshyoung="ssh-server young"
alias sshiron="ssh-server iron"
alias sshlab="ssh-server lab"
alias sshstd="ssh-server std"
alias sshcs="ssh-server cs"
alias sshdaisy="ssh-server daisy "
alias sshfei="ssh-server fei"
alias sshhpc="ssh-server hpc"

function sshcopyid(){
    cd ~/.ssh
    ssh-copy-id -i i3_rsa_id.pub xuanqi@$1.ece.ust.hk
}

function ssh-server() {
    sshcheck
    echo $1

    if [ "$1" = "lab" ]
    then
        echo "here"
        # servername="xuanqi@143.89.135.212 -p 2222"
        servername="xuanqi@143.89.131.95 -p 2222"
        # ssh -XfC -c blowfish-cbc $servername
    elif [ "$1" = "zhehui" ]
    then
        servername="zhehui@rostam.ece.ust.hk"
    elif [ "$1" = "cs" ]
    then
        servername="xchenbr@csl2wk10.cse.ust.hk"
    elif [ "$1" = "ece" ]
    then
        servername="xchenbr@acf2013.ece.ust.hk"
    elif [ "$1" = "std" ]
    then
        servername="std01@143.89.131.91"
    elif [ "$1" = "daisy" ]
    then
        servername="daisy@143.89.135.219 -p 2222"
    elif [ "$1" = "fei" ]
    then
        servername="cecilia@219.223.173.91 -p 2222"
    elif [ "$1" = "hpc" ]
    then
        servername="ztianab@hpc2.ust.hk"            #Name + Year+Date, Name First Character Big Case
    else
        servername="xuanqi@"$1".ece.ust.hk"         #passion,rostam,young,magic,iron - other four: chirp fantasy sunlight
    fi

    ssh -X $servername
    # ssh -XfC -c blowfish-cbc $servername # default cypher as blowfish,fast; -X X forwarding; -f puts ssh session into background; C use compression
}
#http://www.vanemery.com/Linux/XoverSSH/X-over-SSH2.html
function scplab(){
    scp -P 2222 $1 xuanqi@143.89.131.95:~/
}
function scppassion(){
    scp $1 xuanqi@passion.ece.ust.hk:~/$2
}

function scpmagic(){
    scp -r $1 xuanqi@magic.ece.ust.hk:~/$2
}

function scpstd(){
    scp $1 std01@143.89.131.91:~/$2
}

function scpcs(){
    scp $1 xchenbr@csl2wk10.cse.ust.hk:~/$2
}
#ssh functions
function scpxq() {
   scp $1 xuanqi@$2.ece.ust.hk:$3
}

function scpxqlabget() {
   scp -r -P 2222 xuanqi@143.89.131.95:~/$1 $2
}

function scpxqlab(){
   scp -r -P 2222 $1 xuanqi@143.89.131.95:~
}
function scpxqlabput {
   scp -r -P 2222 $1 xuanqi@143.89.131.95:~/$2
}

# function connect() {
    # if [[ -z "$ORIG" ]]; then
      # ORIG=$PS1
    # fi
    # TITLE="\[\e]2;$1\a\]"
    # PS1=${ORIG}${TITLE}

    # if [ "$1" = "lab" ]
    # then
        # echo "here"
        # servername="shakir@143.89.135.225 -p 2222"
    # elif [ "$1" = "zhehui" ]
    # then
        # servername="zhehui@rostam.ece.ust.hk"
    # else
        # servername="xuanqi@"$1".ece.ust.hk"         #passion,rostam,young,magic - other four: chirp iron fantasy
    # fi
    # ssh -X $servername
# }

#logout
alias logout="gnome-session-quit"

# pwd
alias pwdxclip="echo -n $(pwd) |xclip -selection clipboard"
# = pwd | xargs echo -n | xclip -selection clipboard

#real vncviewer
alias vncserver="/bin/vncserver"
alias vncopen="cd ~/Software/VNCViewer && ./vncviewer"
alias vncgeom="vncserver -geometry 1080x990"
alias vnckill="vncserver kill :"
alias vncscan="ps -ef | grep Xvnc | grep -v root"          #;or grep -e 'pattern1\|pattern2',and grep -E 'pattern1.*pattern2'
alias xvnckill="x11vnc -clear-all"

alias dush="du -sh *"       # check all file storage
alias onedriveresync="onedrive --resync -v"       # check all file storage

# tmux  --man tmux
alias tmuxsource="tmux start-server \; source-file ~/.tmux.conf"
alias tmuxks="tmux kill-session -t "    #kill session
alias tmuxkw="tmux kill-window -t "    #kill window
alias tmuxkp="tmux kill-pane -t "       #kill pane
alias tmuxls="tmux list-sessions"
alias tmuxlw="tmux list-windows"
alias tmuxlp="tmux list-panes"
alias tmuxsh="tmux splitw -h"           #split horizontally
alias tmuxsv="tmux splitw -v"           #split vertically
alias tmuxa="tmux attach-session -t "               #attach to the first one
#detach session: C-a d

tmuxsk() {
    cmdarg=${@:2} # all arg, from the second
    tmux send-keys -t "$1" "$cmdarg" Enter
}

tmuxskinit() {
    SERV=(passion young rostam magic iron)
    NUM=$(($(tmux list-panes | wc -l)-2))   #init-0
    for ((i=0; i<=$NUM; i++))
    do
        tmuxsk $((i+1)) "ssh"${SERV[i]}
    done
}

tmuxskall() {
    NUM=$(($(tmux list-panes | wc -l)-2))   #init-0
    for ((i=0; i<=$NUM; i++))
    do
        tmuxsk $((i+1)) "$@"
    done
}

alias eyescreen="redshift -l 22.3964:114.1095 -t 6500:5000 -b 1.0:0.8 &" # protect eyes, https://www.maketecheasier.com/protect-eyes-redshift-linux/
alias xclipwc="xclip -o | wc -w"        # word count
# if test "$SSH_AUTH_SOCK" ; then         # for tmux
    # ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
# fi

# synergy
alias synergysetup="synergy --config ~/_synergy.conf"
alias synergyclab="synergyc -f 10.89.134.149 &"
# svn
alias svn="sshcheck; svn"

# alias svnset="svn co --depth immediates svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository svn"       #checkout
export PATH=~/.config/jade:${PATH}             # selenium driver geckodriver
alias svnset="svn co --depth immediates svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository svn" # svn on virtual server

export JADE_TRUNK_URL="svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/trunk/JADE"
export JADE_HOTSPOT_URL="svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/branches/JADE-hotspot"

alias svnbranchjadehot="svn copy svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/trunk/JADE svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/branches/JADE-hotspot -m 'xuanqi private branch with hotspot'"        ## better into the branches and copy locally
alias svnbranchjadehot_new="svn copy svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/trunk/JADE svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/branches/JADE-v5-hotspot -m 'xuanqi private branch with hotspot_JADE_v5'"        ## better into the branches and copy locally
alias svnbranchjadehotrev_2="svn copy svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/trunk/JADE svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/branches/JADE-pow-hotspot -m 'xuanqi private branch with hotspot'"        ## better into the branches and copy locally
alias svncojadehot="svn co --depth immediates svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/branches/JADE-v5-hotspot JADE-v5-hotspot"
alias svncojadetrunk="svn co --depth immediates svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/trunk/JADE JADE-trunk"

# alias svnmergejadehotfromtrunk="svn merge -r 16845:HEAD $JADE_TRUNK_URL $JADE_HOTSPOT_URL"
alias svnmergejadehotfromtrunk="svn merge $JADE_TRUNK_URL"

alias svnsetjade="svn co --depth immediates svn+ssh://xchenbr@acf2013.ece.ust.hk/home/ust.hk/svn_repository/Software\ Release/JADE/branches/JADE-hotspot Jade-hotspot" # svn on virtual server
alias sshfeng="ssh jfengah@acf2013.ece.ust.hk" # svn on virtual server Jf7814089jf%
# groups,       sudo usermod -a -G opticsbdsl jfengah@ust.hk, the name should belong to group opticsbdsl
alias svnupimm="svn update --set-depth immediates "
alias svnupinf="svn update --set-depth infinity "
alias svnupemp="svn update --set-depth empty "
alias svnrefreshadd="svn add --force * --auto-props --parents --depth infinity -q" #add
# alias svnrefreshdel="svn st | grep '^!' | awk '{print $2}' | xargs svn delete --force"       #delete
# alias svnrefreshdelinfo="svn st | grep '^!' | awk '{print $2}'"       #delete
alias svnrefreshdelinfo="svn st | grep '^!' | sed -e 's/!\s\+//'"       #delete
alias svngrep="svn ls --depth infinity | grep "
alias svncmdefault="svn commit -m 'up-refresh'"
alias svnconflict="svn resolve --accept=working"       # "C" indicate a tree conflict, renamed by another user
alias svnstatusnoignore="svn status --no-ignore"       # show all unstatus file
alias svnlsignore="svn proplist -v -R . | grep -A1 ignore" #  svn proplist -v -R [TARGET]
alias svndelignore="svn propdel svn:ignore -R"
alias svndiffall="svn diff -r PREV:HEAD"

alias svnsetglobalignore="svn propset svn:global-ignores -R"       # show all unstatus file
# alias svnsetignore="svn propset svn:ignore"       # show all unstatus file

alias vtuview="paraview" #vtu paraview

function svnrefreshM(){
    IFS=$'\n'
    for file in $(svn st | grep '\!M' | sed -e 's/\!M\s\+//')
    do
        echo "svn revert" "$file"
        # svn delete $file
        svn revert $file
    done
}

function svnrefreshdel(){
    IFS=$'\n'
    for file in $(svn st | grep '^!' | sed -e 's/!M\?\s\+//')
    do
        echo "svn delete" "$file"
        svn delete --force $file
    done
}

function svnrevertdel(){
    for file in $(svn st | grep 'D' | sed -e 's/D\?\s\+//')
    do
        echo "revert_file: " "$file"
        svn revert $file
    done

}
function svnrefresh(){
    svn add --force * --auto-props --parents --depth infinity -q
    svnrefreshdel
}

function svnsubmit(){
    cp -r $1 ~/Research/svn/Discussion/Xuanqi\ Chen/
    cd ~/Research/svn/Discussion/Xuanqi\ Chen/
    svn add $1
    svn commit -m "Submit $1 Refresh"
    svn update
}
#files


#svn ls
export LC_CTYPE=en_US.UTF-8


# ffmpeg, png to mp4 (gif)
function ffmpegmp4(){
    ffmpeg -framerate 4 -i Gen_Ring_64_%04d.png -c:v libx264 -r 30 out.mp4
}
# music ffmpeg, mp4 to mp3
function ffmpegmp3(){
    mp3fname=$(echo $1 | sed -r 's/\.\S+/\.mp3/g')
    echo $mp3fname
    ffmpeg -i $1 -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 $mp3fname
    # ffmpeg -i $1 -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 $mp3fname # variable bitrate
}


# shadowsocks
alias sockset="sslocal -c /etc/shadowsocks.json "

# cd
alias cddairy="cd ~/Research/Dairy/latex"

#freemind
alias mindopen="~/Software/freemind/exec/freemind.sh &"

#wings3d
alias wings3d="~/Software/Wings3D/wings-2.1.5/wings &"
alias cattab="cat -e -t -v" #Makefile check tab and space

#dict
export SDCV_PAGER=/usr/bin/less
function define {
# espeak for the pronunciation audible output and phone alphabet string
    echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"
# dict - the client for the dictionary server
    # dict $1
    sdcv $1
}

#self-defined program compile command
alias xqautorun="./compile"

#terminal windows control
alias wmctrlamax="wmctrl -r :ACTIVE: -b toggle,maximized_horz,maximized_vert" #window move control active
alias wmctrla="wmctrl -r :ACTIVE: -b " #window move control active
alias wmctrlae="wmctrl -r :ACTIVE: -e " #window move control active
alias wmctrlat="wmctrl -r :ACTIVE: -b toggle," #window move control active
alias wmctrlar="wmctrl -r :ACTIVE: -b remove," #window move control active
alias wmctrls="wmctrl -r :SELECT: -e " #window move control select

#git
alias gituser="git config --global user.name 'shakir-chen'"
alias gitcd="cd ~/Software/Scripts && git status"
alias gits="git status"
alias gita="git add"
alias gitpull="sshcheck; git pull"
# alias gitpush="git push origin master"
alias gitcm="git commit -m"
alias gitcmdef="git commit -m 'up default'"
alias gitco="git checkout"
alias gitsb="git show-branch"       #show branch message
alias sourcebashrc="source ~/.bashrc"       #show branch message
alias sourcesynopsys="source /local/eelocal/synopsys/syn-vl2016.03-sp5-5/.bashrc"   # show branch message

# git diff FILE; git diff --cached FILE; git diff HEAD FILE;
# https://stackoverflow.com/questions/1587846/how-do-i-show-the-changes-which-have-been-staged

function gitpush(){
    sshcheck
    git push origin master
}

# crontab, crontab -l, crontab -e

#ftp
alias ftplab="ftp 143.89.131.95"
alias ftpi="ftp ihome.ust.hk"
alias gitftppush="git ftp push"
# ftp > lcd - change local cd; mput upload multiple file; mget download multiple; bin - binary transfer

#nautilus
alias nautilus="nautilus --no-desktop"

alias topsave="top  -n  1 -b > top-output.txt"
#Franz
alias franz_loc="~/Software/Franz/Franz &"

#Foxit Reader
alias foxit="~/Linux/opt/foxitsoftware/foxitreader/FoxitReader"

function uglifyjs_one(){
    uglifyjs $1 -c toplevel,sequences=false
}
function uglifyjs_mangle(){
    uglifyjs $1 -c -m --mangle-props
}


#Gnome Terminal Title Change
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

function set-tab-title() {
  if [[ -z "$ORIG" ]]; then
      ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  # PS1=${ORIG}${TITLE}
  PS1=${ORIG}${TITLE}
  # PS1="\[\033[1;34m\][\H:\W]$\[\033[0m\] "
  # PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
}

#Move and Create a link in script directory
function gitln(){
    filefullpath=$(readlink -f $1)
    mv --backup=t $1 ~/Software/Scripts/linux-bin/
    ln -s ~/Software/Scripts/linux-bin/$1 .
    echo "ln -s ~/Software/Scripts/linux-bin/$1 $filefullpath"
    echo "ln -s ~/Software/Scripts/linux-bin/$1 $filefullpath" >> ~/Software/Scripts/linux-bin/ubuntu-setup.sh
}

#Move and Create a link in script directory
function dropboxln(){
    filefullpath=$(readlink -f $1)
    mv --backup=t $1 ~/Dropbox/Linux/notes/
    ln -s ~/Dropbox/Linux/notes/$1 .
    echo "ln -s ~/Dropbox/Linux/notes/$1 $filefullpath"
    echo "ln -s ~/Dropbox/Linux/notes/$1 $filefullpath" >> ~/Dropbox/Linux/ubuntu-setup.sh
}
alias mvbak="mv --backup=t"

alias urxvtsource="xrdb -merge ~/.Xresources"

# dot & graphvz, dot circo fdp twopi neato
alias dotshow="dot -Tx11"
function dotsave(){
    dot -Tpng $1 > temp.png
}

function jpgtrim(){
for f in *.jpg
do
    echo $f
    convert $file -trim $f
done
}

function imgresize(){
# identify XXX.png to see the image scale
# convert $1 -crop 1007x18+0+10 +repage crop.gif
for f in *.png
    do
        convert $f -crop 1007x18+0+10 +repage $f
    done

}

function gif2png(){
    convert -coalesce $1 out%05d.png
}

function pdf2jpg(){
    newf=${1/.pdf/.jpg}
    echo  $1 "--->" $newf
    # convert -density 300 $f $newf     # backgroud will become black
    # convert -density 300 -background white -alpha remove $1 $newf
    # convert -density 1000 -background white -alpha remove $1 $newf
    convert -density 500 -background white -alpha remove $1 $newf
    # convert -density 150 *.pdf -quality 90 output.png
}

function pdf2jpgall(){
    for f in *.pdf
    do
        # echo $f
        newf=${f/.pdf/.jpg}
        echo  $f "--->" $newf
        # convert -density 300 $f $newf     # backgroud will become black
        convert -density 300 -background white -alpha remove $f $newf
        # convert -density 150 *.pdf -quality 90 output.png
    done
}
function pdfrotate(){
    newf=${1/.pdf/}
    pdftk $1 cat 1-endeast output $newf"_e.pdf"
    # pdftk $1 cat 1-endwest output $1_w.pdf
}

function convertgif(){
    convert -delay 1 -loop 0 $1 o.gif
}

# grip
function griphub(){
    # grip -b --user="shakir-chen" --quiet $1 localhost:3700
    grip -b --user="yaoxin-li" --quiet $1 localhost:3700
}
alias gripquick="grip -b --quiet"           #markdown as github style

#cd Frequent Path
alias cdtac="cd ~/Dropbox/Course/TAC"
alias cdcosmic="cd ~/Benchmark/COSMIC-generation-flow"
alias cdsnap="cd ~/Research/Benchmark/APEX/SNAP/WorkSpace"
alias cdqemu="cd ~/Software/Qemu"
alias cdjade="cd ~/Software/JADE-v5-hotspot"
alias cdjadetrunk="cd ~/svn/Software\ Release/JADE/trunk/JADE"
alias cdspec="cd ~/Research/Benchmark/SPEC"
alias cdgit="cd ~/Software/Scripts"
alias cddairy="cd ~/Dropbox/Linux/Dairy/latex"
alias cdblog="cd ~/Documents/Blog/"
alias cdoeil="cd ~/Research/OEIL/OEIL-c/OEILv4.0-cpp/"
alias cdsvn="cd ~/svn/Discussion/Xuanqi\ Chen/"
alias cdftp="cd /srv/ftp/"
alias cdcourse="cd ~/Dropbox/Course"
alias cdbook="cd ~/Dropbox/Course/Good_Books"
alias cdbosim="cd ~/svn/Discussion/Xuanqi\ Chen/Tools/BOSIM/source"
alias cdhotspot="cd ~/svn/Discussion/Xuanqi\ Chen/Tools/hotspot"
alias cdtool="cd ~/svn/Discussion/Xuanqi\ Chen/Tools/"
alias cdzotero="cd ~/.mozilla/firefox/iezs8krl.default/zotero"
alias cdfdtd="cd ~/Research/FDTD/"
alias cdft="cd ~/svn/Discussion/Xuanqi\ Chen/FT2000"
# alias cdpaper="cd ~/svn/Discussion/Xuanqi\ Chen/Paper/BOSIM"
# alias cdpaper="cd ~/svn/Discussion/Xuanqi\ Chen/Paper/BOSIM-TCAD"
# alias cdcadence="cd /usr/eelocal/cadence"
alias cdpaper="cd ~/svn/Working\ papers/Xuanqi\ Chen/Tuning"
alias cdlatex="cd /usr/share/texlive/texmf-dist/tex/latex/"

alias cdsilly="cd ~/Dropbox/silly"

# alias dirsx="dirs | sed -r 's/\s/\\ /' | xclip"

alias killjade="killapp jade; killapp make; killapp run_examples"
alias checkmem="ps -o pid,user,%mem,command ax | sort -b -k3 -r | grep xuanqi | less"

function killapp(){
    ps -ef | grep $1
    apppid=$(ps -ef | grep $1 | grep -v grep | awk '{print $2}')
    echo "kill ps:" $apppid
    for apppid_ii in $apppid
    do
        # echo $pypid_ii
        kill -9 $apppid_ii
    done
}

function killpy(){
    ps -ef | grep $1 | grep python3.5
    pypid=$(ps -ef | grep python3.5 | grep -v grep | awk '{print $2}')
    echo "kill ps:" $pypid
    for pypid_ii in $pypid
    do
        # echo $pypid_ii
        kill -9 $pypid_ii
    done
    # kill -9 $pypid
}

function renicepy(){
    ps -ef | grep $1 | grep python3. | grep -v grep
    pypid=$(ps -ef | grep $1 | grep python3.5 | grep -v grep | awk '{print $2}')
    echo "renice ps:" $pypid
    sudo renice -n -5 $pypid
}
function lntemp(){
    # http://tldp.org/LDP/abs/html/fto.html
    if [ -h temp ]; then
        rm temp
    fi
    ln -s $1 temp
}

function dirsx(){
    DIR=$(dirs | sed 's/\s/\\ /g')
    # echo $DIR | xclip
    printf "$DIR" | xclip
}

alias openjiaming="open ~/Dropbox/Course/Good_Books/Jia-ming_Liu_PhotonicsDevices.pdf"
alias openshimin="open ~/Dropbox/Course/Good_Books/Physics_of_Semciondutor.pdf"
alias openpower="open ~/Dropbox/Course/Good_Books/FundamentalsofPowerSemiconductorDevices.pdf"
alias wifilsd="nmcli d wifi list" # wifissid
alias wifilsc="nmcli c" # saved wifi connection
alias wific="nmcli c up" # + savedwificonn
alias wifid="nmcli c down" # + savedwificonn
alias wificdef="nmcli c up eduroam" # + savedwificonn
# network
# alias "nm-connection-editor"     # network manager


# autojump
if [ "$HOST" == "lab" ] ; then           # laptop
    source /usr/share/autojump/autojump.sh
fi
# https://www.thinkingmedia.ca/2014/10/how-to-install-autojump-on-ubuntu-14/

# mv tmp
alias mvscreenshot="mv /tmp/latest-screenshot.png "
function mvtmp(){
    mv $1 ~/Dropbox/Linux/tmp
}

# rm
function rm(){
    case $1 in
        "-f") argnum=2
            mv --backup=t ${@:2:10} ~/Trash/Force;;
        "-rf") argnum=2
            mv --backup=t ${@:2:10} ~/Trash/Force;;
        "-r") argnum=2
            mv ${@:2:10} ~/Trash/Force;;
        "-s") /bin/rm ${@:2:10} ;;
        *) argnum=1
            mv --backup=t ${@:1:10} ~/Trash/Normal;;
    esac
}

#ls optimize
alias lst="ls -t"
alias lstt="ls -t | head -1"
alias lst3="ls -t | head -3"
# alias lst3="ls -t | head -3"

# function set-tab-title() {
  # if [[ -z "$ORIG" ]]; then
      # ORIG=$PS1
    # fi
  # TITLE="\[\e]2;$*\a\]"
  # PS1=${ORIG}${TITLE}
# }

# wps(writer) wpp(ppt) et(excel)
alias wps="wps -style gtk"
alias wpp="wpp -style gtk"
alias et="et -style gtk"

# flux
alias flux="./Software/flux/xflux -l 114.1 -g 22.3"

# Xilinx-ISE
alias isesource="source /opt/Xilinx/14.7/ISE_DS/settings64.sh"
alias ise="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/ise &"
alias isecoregen="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/coregen &"
alias isexps="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xps &"
alias isexsdk="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xsdk &"


alias vivadosource="source /opt/Xilinx/Vivado/2018.1/settings64.sh"

# SPEC
alias cdspec="cd /home/xuanqi/Research/Benchmark/SPEC"            #in SPEC mnt directory
alias specinstall="./install.sh -d /home/xuanqi/Research/Benchmark/SPEC"            #in SPEC mnt directory
alias specbuild="runspec --config=Xuanqi-linux64.cfg --action=build --tune=base"
alias specrun=" runspec --config=Xuanqi-linux64.cfg --size=test --noreportable --tune=base --iterations=1"

# peek : record your screen easily
#xclip
alias xclipscreenshot="xclip -selection clipboard -t image/png -o >"
#wget
export DOWNLOAD_PATH=~/Downloads
export DAIRY_PATH=~/Dropbox/Linux/Dairy/latex
export TEMPSAVE_PATH=~/Downloads
export M4PATH=~/texmf/tex/latex/Circuit_macros

#wget
function wgetpdf(){         # sometimes, the pdfprefix html will be different, then you need to customize the web address, not just $1$pdf
    PDFNAME=$(curl -s $1 | grep -oP "http://.*.pdf")
    if [ ! $PDFNAME ]; then
        PDFNAME=$(curl -s $1 | grep -oP '(?<=")\S+.pdf(?=")')
        echo $PDFNAME
        for pdf in $PDFNAME
        do
            pdfhttp=$1$pdf
            echo $pdfhttp
            wget $pdfhttp
        done
    else
        echo $PDFNAME
        wget $PDFNAME
    fi
}
function wgetppt(){         # sometimes, the pdfprefix html will be different, then you need to customize the web address, not just $1$pdf
    PDFNAME=$(curl -s $1 | grep -oP "http://.*.ppt")
    if [ ! $PDFNAME ]; then
        PDFNAME=$(curl -s $1 | grep -oP '(?<=")\S+.ppt(?=")')
        echo $PDFNAME
        for pdf in $PDFNAME
        do
            pdfhttp=$1$pdf
            echo $pdfhttp
            wget $pdfhttp
        done
    else
        echo $PDFNAME
        wget $PDFNAME
    fi
}   # wget a folder: wget -r http

# pdfposter -p1x999a4 testpage-wide.pdf out.pdf
# pdfposter, long pdf => multiple pages <http://manpages.ubuntu.com/manpages/bionic/en/man1/pdfposter.1.html>
#scrot
alias scrots="scrot -s"
alias importh="import helper.png"

#qmake
alias qmakep="qmake -project -o"
alias makejade="./make_example.sh"

#convert, image process
alias convertvertapd="convert -append"
alias converthoriapd="convert +append"
alias convertinfo="file"


function aspectadj(){
for f in *.jpg
do
    echo $f
    newf=${f/.jpg/_p.jpg}
    ./aspectpad -a 1.333 -m p -p white $f $newf
done
}
#kill process
# function freemem(){
    # killapp make
    # killapp jade.exec
# }

# #help-doc
# function helpterm() {
    # echo "Navigation"
    # echo "Ctrl + A ;Beginining or Home Key"
    # echo "Ctrl + E ;End or End Key"
    # echo "Alt + F  ;Move cursor forward one word on the current line"
    # echo "Alt + B  ;Move cursor backward one word on the current line"
    # echo ""
    # echo "Edit"
    # echo "--Delete"
    # echo "Ctrl + K ;Clear all after line"
    # echo "Ctrl + U ;Clear all before line"
    # echo "Ctrl + W ;Delete the word before the cursor"
    # echo ""
    # echo "Ctrl + L ;Clear all the pane"
    # echo "Ctrl + H ;Delete one character, backspace"
    # echo "--Swap"
    # echo "Ctrl + T ;Swap the last two characters before the cursor"
    # echo "Esc + T  ;Swap the last two words before the cursor"
    # echo ""
    # echo "Ctrl + R ;Search"
    # echo "Ctrl + C ;kill whatever your are running"
    # echo "Ctrl + D ;Exit the current shell"
    # echo ""
    # echo "Ctrl + Z ;Puts whatever you are running into a suspended background process. fg restores it."
    # echo ""
    # echo "Tab      ;Auto-complete files and folder names"


# }

# DOWNLOAD_PATH=~/Downloads
# DAIRY_PATH=~/Dropbox/Linux/Dairy/latex
# TEMPSAVE_PATH=~/Downloads

# function wgetpath() {
    # if [[ ! (-d $1 || -d $2) ]]; then
        # echo "No Such Directory"
        # return -1
    # fi
    # case $# in
        # "0") echo "Error: Nothing Input"    ;;
        # "1") TEMPSAVE_PATH=$1
            # echo "TEMPSAVE_PATH="$TEMPSAVE_PATH ;;
        # "2")
            # case $1 in
                # "-r")   DAIRY_PATH=$2
                    # echo "DAIRY_PATH="$DAIRY_PATH;;
                # "*")    TEMPSAVE_PATH=$2;;
            # esac ;;
        # "*") echo "Error: Too Many Vars";;
    # esac
# }

# function wgetm() {
    # #wgetm -d filename  -- -r dairy, -d download, default is $(pwd)
    # URL=$(xclip -o)
    # echo $URL
    # if [[ ! "$URL" == "" ]]
    # then
        # if [[ "$#" == "0" ]]
        # then
            # NAME="temp"
        # fi
        # case $# in
            # "0")
                # NAME="temp"
                # wget_path=".";;
            # "1")
                # if [[ "$1" == "-*" ]]
                # then
                    # NAME="temp"
                    # case $1 in
                        # "-d") wget_path=$DOWNLOAD_PATH;;
                        # "-r") wget_path=$DAIRY_PATH;;
                        # "-t") wget_path=$TEMPSAVE_PATH;;
                        # "*") wget_path="."
                              # echo "Input Directory Error";;
                    # esac
                # else
                    # NAME="$1"
                    # wget_path="."
                # fi ;;
            # "2")
                # NAME="$2"
                # case $1 in
                    # "-d") wget_path=$DOWNLOAD_PATH;;
                    # "-r") wget_path=$DAIRY_PATH;;
                    # "-t") wget_path=$TEMPSAVE_PATH;;
                    # "*") wget_path="."
                          # echo "Input Directory Error";;
               # esac ;;
            # *)
               # echo "Input Type Error: should be less than 3 vars";;
        # esac
        # wget $URL -O "temp"
        # TYPE=$(file temp | grep -oP "^\w+: \K\w+")
        # echo "Filetype: $TYPE"
        # case $TYPE in
            # "PNG")
                # mv -v --back=t "temp" $wget_path/$NAME".png";;         # -v enable verbose output
            # "JPEG" | "JPG")
                # mv -v --back=t "temp" $wget_path/$NAME".jpg";;
            # *)
                # echo "not detect type";;
        # esac
    # fi
# }

#kinetic
# source /opt/ros/kinetic/setup.bash
export ROS_PACKAGE_PATH=~/catkin_ws/src:${ROS_PACKAGE_PATH}
export LD_LIBRARY_PATH=/opt/ros/kinetic/lib:${LD_LIBRARY_PATH}

export PKG_CONFIG_PATH=~/Software/zathura/poppler/build:${PKG_CONFIG_PATH}          # poppler pdf, for zathura interation; okular for comments reader

#opencv path
export PKG_CONFIG_PATH=/usr/local/opencv/2.4.9/lib/pkgconfig:${PKG_CONFIG_PATH}
export LD_LIBRARY_PATH=/usr/local/opencv/2.4.9/lib:${LD_LIBRARY_PATH}

# export ROS_IP=219.223.173.91
export ROS_IP=localhost
export ROS_MASTER_URI=http://$ROS_IP:11311/

#gdb
ulimit -c unlimited

# Luceda
# added by Miniconda2 installer
export PATH="/home/shakir/miniconda2/bin:$PATH"
# # export PATH="/home/shakir/Software/wine/wine-3.21:$PATH"
export PATH="/usr/local/bin/:$PATH"
alias vimluceda="vim ~/lucedanotes.md"
alias cdluceda="cd ~/Software/luceda"
alias cdipkiss="cd ~/Software/luceda/ipkiss.eda"
alias sourceipkiss="source activate ipkiss3"
alias docluceda="luceda-doc"
alias vimnote="vim ~/Dropbox/notes_intern.md"
alias cstmount="sudo mount -t iso9660 -o ro,exec cst_linux.iso /mnt"
alias cstrun="/opt/cst/CST_STUDIO_SUITE_2018/cst_design_environment_gui"
export WINEARCH="win64"
# export WINEPATH='/home/shakir/.wine/drive_c/MentorGraphics/Tanner EDA/Tanner Tools v2018.3/x64'
# export WINEDLLPATH='/home/shakir/.wine/drive_c/MentorGraphics/Tanner EDA/Tanner Tools v2018.3/x64'
export WINEDLLPATH="C:\\MentorGraphics\\Tanner EDA\\Tanner Tools v2018.3\\x64\\"
export WINEDLLPATH="C:\\MentorGraphics\\Tanner EDA\\Tanner Tools v2018.3\\x64\\oa\\bin\\x64\\opt:$WINEDLLPATH"

# export WINEPREFIX="C:\\MentorGraphics\\Tanner EDA\\Tanner Tools v2018.3\\x64"
# export WINEPATH="C:\\MentorGraphics\\Tanner EDA\\Tanner Tools v2018.3\\x64"

# export WINEDLLPATH='C:\MentorGraphics\Tanner EDA\Tanner Tools v2018.3\x64\ledit64.exe'
alias winetspice="wine ~/.wine/drive_c/MentorGraphics/Tanner\ EDA/Tanner\ Tools\ v2018.3/x64/tspice64.exe"
alias wineledit="wine ~/.wine/drive_c/MentorGraphics/Tanner\ EDA/Tanner\ Tools\ v2018.3/x64/ledit64.exe"

export TANNER_PATH="/home/shakir/Software/tanner/tanner"
export PATH="${PATH}:/home/shakir/Software/tanner/tanner/bin"

# export WINE="/usr/local/bin/wine"
