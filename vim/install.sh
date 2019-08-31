#!/bin/bash

curdir=$(pwd)
echo $curdir

ln -s $curdir/UltiSnips ~/.vim/UltiSnips
ln -s $curdir/vimrc ~/.vim/vimrc
ln -s $curdir/vimrc.bundles ~/.vim/vimrc.bundles
