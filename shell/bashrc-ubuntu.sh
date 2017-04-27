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

if [ "$USER" == "shakir" ] ; then
    setxkbmap -option caps:ctrl_modifier
fi

#User Define
# added by Anaconda 2.2.0 installer
#export PATH="/home/rafael/softwares/anaconda/bin:${PATH}"
#export PATH=/home/rafael/softwares/valgrind/valgrind/bin:${PATH}
#export LD_LIBRARY_PATH=/home/rafael/softwares/anaconda/lib:${LD_LIBRARY_PATH}
# added by git Xuanqi
export PATH=~/Linux/bin:${PATH}
export PATH=~/Software/Scripts/linux-bin:${PATH}
export PATH=~/Software/Franz/:${PATH}
export LD_LIBRARY_PATH=~/Linux/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=~/Linux/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=~/Software/boost/lib/:${LD_LIBRARY_PATH}
export BOOST_ROOT=~/Software/boost/include
# cheat add
export EDITOR=/usr/bin/vim

export PKG_CONFIG_PATH=/usr/bin/
export PYTHONPATH=/usr/local/lib/python3.5/site-packages/:${PYTHONPATH}
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:${PYTHONPATH}
# virtualenv and virtualenvwrapper, used for opencv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.5
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
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
export XILINXD_LICENSE_FILE="2100@eems05.ece.ust.hk"
# export LM_LICENSE_FILE="2100@eems05.ece.ust.hk"

# Setup Scripts =====
# source ~/.helprc
# bash Soft-Open.sh       # Setup Programs

# grep =======================================================
#alias grep --color=auto
alias gp="grep -r --exclude-dir=.svn --color=auto" #grep >=2.5.2
alias gp="grep -r "
alias gp3="grep -A 1 -B 1 -r --color=auto" #grep in detail
alias gp4="grep -A 2 -B 1 -r --color=auto" #grep in detail 4 lines
alias gp5="grep -A 3 -B 1 -r --color=auto" #grep in detail 5 lines
alias gph="grep -r -i --include \*.h --color=auto"  #grep header file
alias gpc="grep -r -i --include \*.c --include \*.C --color=auto"  #grep c file
alias gpcpp="grep -r -i --include \*.cpp --color=auto"  #grep cpp file

# ls =======================================================
alias l.="ls -d .* --color=tty"
alias ll="ls -l --color=tty"
alias lsf="ls -p --color=tt | grep -v / | tr '\r\n' '\t'"        # list only file, tr translate or delete, tr -d
alias lshf="ls -pa --color=tty | grep -v /"     # list include hidden file
alias lsd="ls -p --color=tty | grep /"     # list include hidden file
alias lshd="ls -pa --color=tty | grep /"     # list include hidden file
alias ls="ls --color=tty"

# vim =======================================================
alias vim="vi"
alias vimplan="vim ~/plan.txt"
alias vimbashrc="vim ~/.bashrc"
alias vimhelprc="vim ~/.helprc"
alias vimmakefile="vim Makefile"
alias vimbus="vim ~/Dropbox/Linux/notes/business.md"
alias vimos="vimfind os"
alias vimlife="vimfind vim-life"
alias vimtext="vimfind text-tips"
alias vimproblem="vimfind linux-problem"
alias vimpy="vimfind python"
alias vimbuild="vimfind build-compile"
alias vimcv="vimfind cv"        # opencv
function vimfind(){
    if [ -f ~/Software/Scripts/help-doc/$1.md ]; then
       vim ~/Software/Scripts/help-doc/$1.md
    else
       ls ~/Software/Scripts/help-doc/
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
alias maker="make run"
alias xpropwm="xprop | grep WM_CLASS"

# program open in ubuntu
# alias open="xdg-open"
alias openfolder="nautilus --browser --no-desktop"
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

# tar
alias tarc="tar -cvzf"
alias tarx="tar -xvzf"

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

# pdf reader
#alias pdf="acroread"       #centos
# alias pdf="evince"
# function evince() {
    # evince $1 &
# }

# Zotero
alias zotero="~/Software/Zotero/Zotero_linux-x86_64/zotero &"     #make a bin file

#Set Caps to Control Key
alias setcaps="setxkbmap -option caps:ctrl_modifier"
alias setcapsnone="setxkbmap -option caps:none" #use for hhkb
# alias setscreen="xrandr --output DP2 --rotate left --right-of VGA1; xrandr --output VGA1 --primary"
alias setscreen="xrandr --output DP2 --rotate left --right-of VGA1; xrandr --output VGA1 --primary"

alias xrandrinit="xrandr --output VIRTUAL1 --off"
alias xrandrmodipad="xrandr --newmode '808x1080_60.00' 72.45 808 856 944 1080 1080 1081 1084 1118 -HSync +Vsync; xrandr --addmode VIRTUAL1 '808x1080_60.00'"
alias xrandrviripad="xrandr --output VIRTUAL1 --mode 808x1080_60.00 --right-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal"
# alias xrandrmodipad="xrandr --newmode '1536x2048_60.00' 270.55 1536 1664 1832 2128 2048 2049 2052 2119 -HSync +Vsync"
# alias xrandrviripad="xrandr --addmode VIRTUAL1 '1536x2048_60.00'; xrandr --output VIRTUAL1 --rotate left --mode 1536x2048_60.00 --left-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal"

alias xrandrmodiphone="xrandr --newmode '752x1334_60.00' 84.85 752 808 888 1024 1334 1335 1338 1381 -HSync +Vsync"
alias xrandrviriphone="xrandr --output VIRTUAL2 --mode 752x1334_60.00 --left-of eDP1 --output eDP1 --mode 1920x1080 --primary --pos 0x0 --rotate normal"

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
    num=$(xinput | grep TouchPad | grep -oP 'id=\K\d+')
    xinput --disable $num
}
function xinputopentp(){
    num=$(xinput | grep TouchPad | grep -oP 'id=\K\d+')
    xinput --enable $num
}

# ssh
alias sshpassion="ssh-server passion"
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

function scppassion(){
    scp $1 xuanqi@passion.ece.ust.hk:~/$2
}
function scpstd(){
    scp $1 std01@143.89.131.91:~/$2
}

function scpcs(){
    scp $1 xchenbr@csl2wk10.cse.ust.hk:~/$2
}
#ssh functions
function scpxq {
   scp $1 xuanqi@$2.ece.ust.hk:$3
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
        # servername="xuanqi@"$1".ece.ust.hk"         #passion,rostam,young,magic - other four: chirp iron fanta
    # fi
    # ssh -X $servername
# }

#logout
alias logout="gnome-session-quit"

# pwd
alias pwdxclip="echo -n $(pwd) |xclip -selection clipboard"
# = pwd | xargs echo -n | xclip -selection clipboard

#real vncviewer
alias vncopen="cd ~/Software/VNCViewer && ./vncviewer"
alias vncgeom="vncserver -geometry 1080x990"
alias vnckill="vncserver kill :"
alias vncscan="ps -ef | grep Xvnc | grep -v root"          #;or grep -e 'pattern1\|pattern2',and grep -E 'pattern1.*pattern2'
alias xvnckill="x11vnc -clear-all"

# tmux  --man tmux
alias tmuxsource="tmux start-server \; source-file ~/.tmux.conf"
alias tmuxks="tmux kill-session -t "    #kill session
alias tmuxkw="tmux kill-session -w "    #kill window
alias tmuxkp="tmux kill-pane -t "       #kill pane
alias tmuxls="tmux list-sessions"
alias tmuxlw="tmux list-windows"
alias tmuxlp="tmux list-panes"
alias tmuxsh="tmux splitw -h"           #split horizontally
alias tmuxsv="tmux splitw -v"           #split vertically
alias tmuxa="tmux attach-session -t "               #attach to the first one

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


# synergy
alias synergysetup="synergy --config ~/_synergy.conf"
# alias ="synergy --config ~/_synergy.conf"
# svn
alias svn="sshcheck; svn"
alias svnset="svn co --depth immediates svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository svn"       #checkout
alias svnupimm="svn update --set-depth immediates "
alias svnupinf="svn update --set-depth infinity "
alias svnupemp="svn update --set-depth empty "
alias svnrefreshadd="svn add --force * --auto-props --parents --depth infinity -q" #add
# alias svnrefreshdel="svn st | grep '^!' | awk '{print $2}' | xargs svn delete --force"       #delete
alias svnrefreshdel="svn st | grep '^!' | sed -e 's/!\s\+//' | xargs svn delete --force"       #delete
# alias svnrefreshdelinfo="svn st | grep '^!' | awk '{print $2}'"       #delete
alias svnrefreshdelinfo="svn st | grep '^!' | sed -e 's/!\s\+//'"       #delete

function svnsubmit(){
    cp -r $1 ~/Research/svn/Discussion/Xuanqi\ Chen/
    cd ~/Research/svn/Discussion/Xuanqi\ Chen/
    svn add $1
    svn commit -m "Submit $1 Refresh"
    svn update
}
#files

#svn ls

# shadowsocks
alias sockset="sslocal -c /etc/shadowsocks.json "

# cd
alias cddairy="cd ~/Research/Dairy/latex"

#freemind
alias mindopen="~/Software/freemind/freemind.sh"

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
alias gitcd="cd ~/Software/Scripts && git status"
alias gits="git status"
alias gita="git add"
alias gitpull="sshcheck; git pull"
# alias gitpush="git push origin master"
alias gitcm="git commit -m"
alias gitco="git checkout"
alias gitsb="git show-branch"       #show branch message
alias sourcebashrc="source ~/.bashrc"       #show branch message

function gitpush(){
    sshcheck
    git push origin master
}

#ftp
alias ftpi="ftp ihome.ust.hk"
# ftp > lcd - change local cd; mput upload multiple file; mget download multiple; bin - binary transfer

#nautilus
alias nautilus="nautilus --no-desktop"
#Franz
alias franz="~/Software/Franz/Franz &"

#Foxit Reader
alias foxit="~/Linux/opt/foxitsoftware/foxitreader/FoxitReader"

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

# grip
function griphub(){
    grip -b --user="shakir-chen" --quiet $1 localhost:3700
}
alias gripquick="grip -b --quiet"

#cd Frequent Path
alias cdcosmic="cd ~/Benchmark/COSMIC-generation-flow"
alias cdsnap="cd ~/Research/Benchmark/APEX/SNAP/WorkSpace"
alias cdqemu="cd ~/Software/Qemu"
alias cdjade="cd ~/Research/Jade"
alias cdspec="cd ~/Research/Benchmark/SPEC"
alias cdgit="cd ~/Software/Scripts"
alias cddairy="cd ~/Dropbox/Linux/Dairy/latex"
alias cdblog="cd ~/Documents/Blog/"
alias cdoeil="cd ~/Research/OEIL/OEIL-c/OEILv4.0-cpp/"
alias cdsvn="cd ~/svn/Discussion/Xuanqi\ Chen/"
alias cdcourse="cd ~/Dropbox/1_Course"
alias cdbook="cd ~/Dropbox/1_Course/Good_Books"
alias cdzotero="cd ~/.mozilla/firefox/iezs8krl.default/zotero"
alias cdfdtd="cd ~/Research/FDTD/"
alias cdft="cd ~/svn/Discussion/Xuanqi\ Chen/FT2000"
# alias cdpaper="~/Dropbox/Linux/Dairy/working_paper/device_modeling"
alias cdpaper="cd ~/svn/Discussion/Xuanqi\ Chen/Paper/BOSEM"
# alias dirsx="dirs | sed -r 's/\s/\\ /' | xclip"
function dirsx(){
    DIR=$(dirs | sed -r 's/\s/\\ /')
    echo $DIR | xclip
}



# autojump
. /usr/share/autojump/autojump.sh
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
            mv ${@:2:10} ~/Trash/Force;;
        "-rf") argnum=2
            mv ${@:2:10} ~/Trash/Force;;
        "-r") argnum=2
            mv ${@:2:10} ~/Trash/Force;;
        "-s") /bin/rm ${@:2:10} ;;
        *) argnum=1
            mv ${@:1:10} ~/Trash/Normal;;
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

# flux
alias flux="./Software/flux/xflux -l 114.1 -g 22.3"

# Xilinx-ISE
alias isesource="source /opt/Xilinx/14.7/ISE_DS/settings64.sh"
alias ise="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/ise &"
alias isecoregen="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/coregen &"
alias isexps="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xps &"
alias isexsdk="/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/xsdk &"

# SPEC
alias cdspec="cd /home/xuanqi/Research/Benchmark/SPEC"            #in SPEC mnt directory
alias specinstall="./install.sh -d /home/xuanqi/Research/Benchmark/SPEC"            #in SPEC mnt directory
alias specbuild="runspec --config=Xuanqi-linux64.cfg --action=build --tune=base"
alias specrun=" runspec --config=Xuanqi-linux64.cfg --size=test --noreportable --tune=base --iterations=1"

#xclip
alias xclipscreenshot="xclip -selection clipboard -t image/png -o >"
#wget
export DOWNLOAD_PATH=~/Downloads
export DAIRY_PATH=~/Dropbox/Linux/Dairy/latex
export TEMPSAVE_PATH=~/Downloads

#wget
function wgetpdf(){
    PDFNAME=$(curl -s $1 | grep -oP "http://.*.pdf")
    if [ ! $PDFNAME ]; then
        PDFNAME=$(curl -s $1 | grep -oP '(?<=")\S+.pdf(?=")')
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

#scrot
alias scrots="scrot -s"
alias importh="import helper.png"

#qmake
alias qmakep="qmake -project -o"

#convert, image process
alias convertvertapd="convert -append"
alias converthoriapd="convert +append"


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

#opencv path
export PKG_CONFIG_PATH=/usr/local/opencv/2.4.9/lib/pkgconfig:${PKG_CONFIG_PATH}
export LD_LIBRARY_PATH=/usr/local/opencv/2.4.9/lib:${LD_LIBRARY_PATH}


# export ROS_IP=219.223.173.91
export ROS_IP=localhost
export ROS_MASTER_URI=http://$ROS_IP:11311/

#gdb
ulimit -c unlimited

