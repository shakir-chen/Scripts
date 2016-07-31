#if [[ $1 != "" ]]
#then
#    vim $1
#fi
#sh vim.sh $1

#S1='$ '
#cd ~/Desktop

#GLOBIGNORE="DAT*"

PS1='[\[\033[33m\]\W\[\033[36m\]`__git_ps1`\[\033[0m\]]$ '

alias py="python"
alias sc="sh compile.sh"
alias cx=". x.sh"   #Xuanqi cd
alias mx="xsort.sh" # xuanqi Move
alias cl="clear" # xuanqi Move

alias l.="ls -d .*"
alias ll="ls -al"

alias ls="ls --color=tty --ignore='NTUSER*' --ignore='ntuser*'"  #--ignore='ntuser*' "


