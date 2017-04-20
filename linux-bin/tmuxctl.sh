#!/bin/bash

#========================================
# Filename: top-control.sh
# Author: CHEN Xuanqi (HKUST)
# Version: V1.0
#========================================

SERV=(passion rostam magic young iron)

tmuxsk() {
    # echo $@     # all arg
    # echo ${@:2}     # all arg, from the second
    cmdarg=${@:2}
    tmux send-keys -t "$1" "$cmdarg" Enter
}

tmuxskinit() {
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


echo "======================================"
echo "=Server Control Program"
echo "=Author: Xuanqi Chen (BDSL & Optics)"
echo "=Version:1.0"
echo ""
echo "======================================"

num=0

while [ $num -le 170 ]
do
    num=$(( num+1 ))
    read -p "$ " grad_cmd
    # echo $grad_cmd
    # declare -a cmd_ar=$(${grad_cmd// /})
    cmd=$(echo $grad_cmd | grep -o "^\S\+" )
    # echo $cmd
    input_str=$(echo $grad_cmd | sed "s/\S\+//" )
    # echo $input_str

    case $cmd in
        "q")        #exit
            exit
            ;;
        "c")
            clear
            ;;
        *)
            # echo "cmd" "$cmd"
            # echo "input_str" "$input_str"
            tmuxskall "$cmd" "$input_str"
            ;;
    esac
    # ./grade.txt
done
