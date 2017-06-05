#!/bin/bash

cd ~
rm .tmux.conf
ln -s ~/Software/Scripts/tmux/$1 .tmux.conf
