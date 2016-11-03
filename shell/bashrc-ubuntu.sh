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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

#User Define
# added by Anaconda 2.2.0 installer
#export PATH="/home/rafael/softwares/anaconda/bin:${PATH}"
#export PATH=/home/rafael/softwares/valgrind/valgrind/bin:${PATH}
#export LD_LIBRARY_PATH=/home/rafael/softwares/anaconda/lib:${LD_LIBRARY_PATH}
# added by git Xuanqi
export PATH=~/Linux/bin:${PATH}
export PATH=~/Study/Scripts/linux-bin:${PATH}
export LD_LIBRARY_PATH=~/Linux/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=~/Linux/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}
# cheat add
export EDITOR=/usr/bin/vim

#PS1='$ '
#PS1='\[\033[33m\]\w\[\033[36m\]\[\033[0m\]$]]]'

#RED='\[\033[0;36m\]]'
#WHITE='\[\033[1;37m\]]'
#PS1='${RED}\H:\W${WHITE}$ '

#PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "
PS1="\[\033[1;34m\][\H:\W]$\[\033[0m\] "
LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

#LICENSE FILE SET
export XILINXD_LICENSE_FILE="2100@eems05.ece.ust.hk"
# export LM_LICENSE_FILE="2100@eems05.ece.ust.hk"

# grep
#alias grep --color=auto
alias gp="grep -r --exclude-dir=.svn --color=auto" #grep >=2.5.2
alias gp="grep -r "
alias gp3="grep -A 1 -B 1 -r --color=auto" #grep in detail
alias gp4="grep -A 2 -B 1 -r --color=auto" #grep in detail 4 lines
alias gp5="grep -A 3 -B 1 -r --color=auto" #grep in detail 5 lines
alias gph="grep -r -i --include \*.h --color=auto"  #grep header file
alias gpc="grep -r -i --include \*.c --include \*.C --color=auto"  #grep c file
alias gpcpp="grep -r -i --include \*.cpp --color=auto"  #grep cpp file

# ls
alias l.="ls -d .* --color=tty"
alias ll="ls -l --color=tty"
alias ls="ls --color=tty"
alias vim="vi"
function vimbin(){
    vim $(which $1)
}
alias vimplan="vim ~/plan.txt"
alias vimbashrc="vim ~/.bashrc"

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
alias py="python"

# pdf reader
#alias pdf="acroread"       #centos
# alias pdf="evince"
# function evince() {
    # evince $1 &
# }

# program open in ubuntu
alias open="xdg-open"
# Zotero
# alias zotero="~/Software/Zotero/Zotero_linux-x86_64/zotero &"     #make a bin file

#Set Caps to Control Key
alias setcaps="setxkbmap -option caps:ctrl_modifier"
#xqexit() {
#    exit
#    exit
#}

# ssh
alias sshpassion="ssh-server passion"
alias sshrostam="ssh-server rostam"
alias sshmagic="ssh-server magic"
alias sshyoung="ssh-server young"
alias sshiron="ssh-server iron"

function ssh-server() {
    echo $1

    if [ "$1" = "lab" ]
    then
        echo "here"
        servername="shakir@143.89.135.225 -p 2222"
    elif [ "$1" = "zhehui" ]
    then
        servername="zhehui@rostam.ece.ust.hk"
    else
        servername="xuanqi@"$1".ece.ust.hk"         #passion,rostam,young,magic,young - other four: chirp fantasy sunlight
    fi

    ssh -X $servername
}

function scppassion(){
    scp $1 xuanqi@passion.ece.ust.hk:~/$2
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

#real vncviewer
alias vncopen="cd ~/Software/VNCViewer && ./vncviewer"
alias vncgeom="vncserver -geometry 1080x990"
alias vnckill="vncserver kill :"
alias vncscan="ps -ef | grep Xvnc | grep -v root"          #;or grep -e 'pattern1\|pattern2',and grep -E 'pattern1.*pattern2'

# tmux      --man tmux
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

# svn
alias svnset="svn co --depth immediates svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository svn"       #checkout
alias svnupimm="svn update --set-depth immediates "
alias svnupinf="svn update --set-depth infinity "
alias svnupemp="svn update --set-depth empty "
alias svnrefreshadd="svn add --force * --auto-props --parents --depth infinity -q" #add
alias svnrefreshdel="svn st | grep '^!' | awk '{print $2}' | xargs svn delete --force"       #delete

function svnsubmit(){
    cp -r $1 ~/Research/svn/Discussion/Xuanqi\ Chen/
    cd ~/Research/svn/Discussion/Xuanqi\ Chen/
    svn add $1
    svn commit -m "Submit $1 Refresh"
    svn update
}
#files

#svn ls

# cd
alias cddairy="cd ~/Research/Dairy/latex"

#freemind
alias mindopen="~/Software/freemind/freemind.sh"

alias cattab="cat -e -t -v" #Makefile check tab and space

#dict
function define {
# espeak for the pronunciation audible output and phone alphabet string
    echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"
# dict - the client for the dictionary server
    dict $1
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
alias gitcd="cd ~/Study/Scripts && git status"
alias gits="git status"
alias gita="git add"
alias gitpull="git pull"
alias gitpush="git push origin master"
alias gitcm="git commit -m"
alias gitco="git checkout"
alias gitsb="git show-branch"       #show branch message
alias sourcebashrc="source ~/.bashrc"       #show branch message


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
    mv --backup=t $1 ~/Study/Scripts/linux-bin/
    ln -s ~/Study/Scripts/linux-bin/$1 .
    echo "ln -s ~/Study/Scripts/linux-bin/$1 $filefullpath"
    echo "ln -s ~/Study/Scripts/linux-bin/$1 $filefullpath" >> ~/Study/Scripts/linux-bin/ubuntu-setup.sh
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
alias cdgit="cd ~/Study/Scripts"
alias cddairy="cd ~/Dropbox/Linux/Dairy/latex"

# function set-tab-title() {
  # if [[ -z "$ORIG" ]]; then
      # ORIG=$PS1
    # fi
  # TITLE="\[\e]2;$*\a\]"
  # PS1=${ORIG}${TITLE}
# }

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

#wget
export DOWNLOAD_PATH=~/Downloads
export DAIRY_PATH=~/Dropbox/Linux/Dairy/latex
export TEMPSAVE_PATH=~/Downloads

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
