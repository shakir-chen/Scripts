# added by Anaconda 2.2.0 installer
#export PATH="/home/rafael/softwares/anaconda/bin:${PATH}"
#export PATH=/home/rafael/softwares/valgrind/valgrind/bin:${PATH}
#export LD_LIBRARY_PATH=/home/rafael/softwares/anaconda/lib:${LD_LIBRARY_PATH}

############# added by Rafeal ################################################

export LD_LIBRARY_PATH=/opt/gcc-4.6.2/lib64
# NEW EMACS
export PATH=/home/rafael/softwares/emacs/bin:${PATH}

export PATH=/opt/gcc-4.6.2/bin:${PATH}
export PATH=/opt/Python-2.7.4/bin:${PATH}
export PATH=/opt/scons/bin:${PATH}
export PATH=/opt/swig/bin:${PATH}
export PATH=/local/home/rafael/softwares/autoconf/bin:${PATH}
export PATH=/local/home/rafael/softwares/automake/bin:${PATH}
export PATH=/local/home/rafael/softwares/libtool/bin:${PATH}
export PATH=${PATH}:/local/home/rafael/softwares/helm-master/bin
export PATH=${PATH}:/local/home/rafael/softwares/cmake/bin
#export PATH=/local/home/rafael/softwares/flex/bin:${PATH}
export PATH=/lcoal/home/rafael/softwares/bison/bin:${PATH}
export PATH=/local/home/rafael/softwares/libiconv/bin:${PATH}
export PATH=/local/home/rafael/softwares/doxygen/doxygen-1.8.10/bin:${PATH}
export PATH=/local/home/rafael/softwares/tar-1.22/bin:${PATH}
export PATH=/local/home/rafael/softwares/lzip-1.17/bin:${PATH}
export PATH=/local/home/rafael/softwares/gmp-6.0.0:${PATH}
export PATH=/local/home/rafael/softwares/gcc/bin:${PATH}
#export PATH=/local/home/rafael/softwares/gccfloat/gccfloat/bin:${PATH}
export PATH=/local/home/rafael/softwares/binutils/bin:${PATH}
export PATH=/local/home/rafael/softwares/ninja/ninja-master:${PATH}
export PATH=${PATH}:/local/home/rafael/softwares/mercurial-3.5
export PATH=${PATH}:/local/home/rafael/softwares/global/bin
export PATH=${PATH}:/local/home/rafael/softwares/bear/Bear-master/bear
export PATH=/home/rafael/softwares/gdb-7.9/bin:${PATH}
export PATH=/home/rafael/softwares/swig/bin:${PATH}
export PATH=/local/home/rafael/softwares/mipsCc/bin:${PATH}
export PATH=/local/home/rafael/gem5Packages/Alpha_fullsystem/alphaev67-unknown-linux-gnu/bin:${PATH}
export PATH=/home/rafael/softwares/sparc/opt/crosstool/gcc-3.4.5-glibc-2.3.5/sparc64-unknown-linux-gnu/bin:${PATH}
export PATH=/local/home/rafael/softwares/graphviz/bin:${PATH}
export PATH=/local/home/rafael/softwares/dramsim/DRAMSim2-master/bin:${PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/local/home/rafael/softwares/bear/Bear-master/libear
export LD_LIBRARY_PATH=/local/home/rafael/softwares/gmp-6.0.0/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/local/home/rafael/softwares/mpfr-3.1.3/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/local/home/rafael/softwares/mpc-1.0.2/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/local/home/rafael/softwares/gcc/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/local/home/rafael/softwares/gcc/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/local/home/rafael/softwares/llvm/libcxx-3.6.2.src/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/home/rafael/softwares/llvm/libcpp/lib:${LD_LIBRARY_PATH}

export PATH=/local/home/rafael/softwares/llvm/build/bin:${PATH}

# added by git Xuanqi
export PATH=/home/xuanqi/Linux/bin:${PATH}
export PATH=/home/xuanqi/Study/Scripts/linux-bin:${PATH}
export LD_LIBRARY_PATH=/home/xuanqi/Linux/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/home/xuanqi/Linux/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}

# Qemu in Passion -xuanqi
export PKG_CONFIG_PATH=/home/xuanqi/Software/Qemu/dependent_library/lib/pkgconfig/

#PS1='$ '

#PS1='\[\033[33m\]\w\[\033[36m\]\[\033[0m\]$]]]'

#RED='\[\033[0;36m\]]'
#WHITE='\[\033[1;37m\]]'
#PS1='${RED}\H:\W${WHITE}$ '

#PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "

PS1="\[\033[1;34m\][\H:\W]$\[\033[0m\] "
LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# grep
#alias grep --color=auto
alias gp="grep -r --color=auto"
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
alias vi="vim"

# clear
alias cl="clear"

# mkdir
alias mkd="mkdir"

# compiler
alias ftn="gfortran"

# python
alias py="python"

# pdf reader
alias pdf="acroread" #evince ill

#xqexit() {
#    exit
#    exit
#}

#logout
alias logout="gnome-session-quit"

#real vncviewer
alias vncviwer="cd ~/Software/VNCViewer && ./vncviewer"
alias vncgeom="vncserver -geometry 1920x1080"
alias vnckill="vncserver kill :"
alias vncscan="ps -ef | grep Xvnc | grep -v root"          #;or grep -e 'pattern1\|pattern2',and grep -E 'pattern1.*pattern2'
alias vncclean="rm *.pid *.log"
alias vncdeepkill="cd /tmp/.X11-unix/"

# tmux      --man tmux
# unset $TMUX
alias tmuxsource="tmux start-server \; source ~/.tmux.conf"
alias tmuxks="tmux kill-session -t "
alias tmuxkw="tmux kill-session -w "
alias tmuxkp="tmux kill-pane -t "
alias tmuxls="tmux list-sessions"
alias tmuxlw="tmux list-windows"
alias tmuxlp="tmux list-panes"
alias tmuxsh="tmux splitw -h"
alias tmuxsv="tmux splitw -v"
alias tmuxa="tmux attach-session -t"

#svn
alias svnset="svn co --depth immediates svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository svn"       #checkout
alias svnupimm="svn up --set-depth immediates"      #update
alias svnupinf="svn up --set-depth infinity"
alias svnupemp="svn up --set-depth empty"
#exclude, files

#xqconf
alias xqconf="./configure -prefix=/home/xuanqi/Linux"

#ssh functions
function scpxq {
   scp $1 xuanqi@$2.ece.ust.hk:$3
}
#git
alias gitcd="cd ~/Study/Scripts && git status"
alias gits="git status"
alias gita="git add"
alias gitpull="git pull"
alias gitpush="git push origin master"
alias gitcm="git commit -m"
alias gitco="git checkout"
alias gitsb="git show-branch"
alias sourcebashrc="source ~/.bashrc"
