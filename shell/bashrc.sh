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
export LD_LIBRARY_PATH=/home/xuanqi/Linux/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/home/xuanqi/Linux/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib/:${LD_LIBRARY_PATH}



#PS1='$ '


#PS1='\[\033[33m\]\w\[\033[36m\]\[\033[0m\]$]]]'

#RED='\[\033[0;36m\]]'
#WHITE='\[\033[1;37m\]]'
#PS1='${RED}\H:\W${WHITE}$ '

#PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\] "
PS1="\[\033[1;34m\][\H:\W]$\[\033[0m\] "

# grep
#alias grep --color=auto
alias gp="grep -r "

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
alias pdf="acroread"

#xqexit() {
#    exit
#    exit
#}

# tmux      --man tmux
alias tmuxsource="tmux start-server \; source ~/.tmux.conf"
alias tmuxks="tmux kill-session -t "
alias tmuxkw="tmux kill-session -w "
alias tmuxkp="tmux kill-pane -t "
alias tmuxls="tmux list-sessions"
alias tmuxlw="tmux list-windows"
alias tmuxlp="tmux list-panes"
alias tmuxsh="tmux splitw -h"
alias tmuxsv="tmux splitw -v"