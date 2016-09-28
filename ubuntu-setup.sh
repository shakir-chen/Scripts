#!/bin/bash

if [[ "$1" == "link" ]]
then
    echo "make link"
    ln -s ~/Study/Scripts/mindmap/IT_Stuffs_new.mm ~/
    ln -s ~/Study/Scripts/help-doc/linux-problem.md ~/
    ln -s ~/Study/Scripts/shell/bashrc-ubuntu.sh ~/.bashrc
    ln -s ~/Study/Scripts/vimperator/_vimperatorrc_linux ~/_vimperatorrc
    ln -s ~/Study/Scripts/tmux/tmux-folder ~/.tmux
    ln -s ~/Study/Scripts/tmux/tmux.conf ~/.tmux.conf
fi


if [[ "$1" == "dir" ]]
then
    echo "make dir"
    mkdir ~/Linux
    mkdir ~/Research
    cd ~/Research/
    mkdir Jade
    mkdir OEIL
    mkdir Benchmark
    mkdir Paper
fi
