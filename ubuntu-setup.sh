#!/bin/bash

if [[ "$1" == "link" ]]
then
    echo "make link"
    echo "=========mindmap link========="
    ln -s ~/Software/Scripts/mindmap/IT_Stuffs_new.mm ~/
    echo "=========Linux Problem========="
    ln -s ~/Software/Scripts/help-doc/linux-problem.md ~/
    echo "=========.bashrc========="
    ln -s ~/Software/Scripts/shell/bashrc-ubuntu.sh ~/.bashrc
    echo "=========_vimperator========="
    ln -s ~/Software/Scripts/vimperator/_vimperatorrc_linux ~/_vimperatorrc
    echo "=========.tmux========="
    ln -s ~/Software/Scripts/tmux/tmux-folder ~/.tmux
    ln -s ~/Software/Scripts/tmux/tmux.conf ~/.tmux.conf
    echo "=========Terminal Tab========="
    ln -s ~/Software/Scripts/gtk/gtk.css ~/.config/gtk-3.0/
    echo "=========Zathura========="
    ln -s ~/Software/Scripts/shell/zathurarc ~/.zathurarc
    echo "=========i3wm========="
    ln -s ~/Software/Scripts/shell/_i3 ~/.i3
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

if [[ "$1" == "software" ]]
then
   echo "============Install git==============="
   sudo apt-get install git
   echo "============Install vim==============="
   sudo apt-get install vim
   echo "============Install tmux==============="
   sudo apt-get install tmux
   sudo apt-get install xclip
   echo "============Install zathura==============="
   sudo apt-get install zathura

   echo "============Install i3wm==============="
   sudo apt-get install i3
   sudo apt-get install i3status
   sudo apt-get install conky


   echo "============Install Python==============="
   sudo apt-get install python-dev
   sudo apt-get install python-pip
   sudo apt-get install python3-pip

   echo "============Install howdoi==============="
   sudo pip install howdoi
   echo "============Install howdoi==============="
   sudo pip install cheat

   echo "============Install scdv dictionary==============="
   sudo apt-get install sdcv

fi

if [[ "$1" == "git" ]]
then
   cd ~/Software/
   echo "============Install Solarized Gnome-Terminal==============="
   if ! [ -d "gnome-terminal-colors-solarized" ] ; then
       git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
       cd gnome-terminal-colors-solarized
       ./install.sh

       cd ~/Software/
       wget https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/fontawesome-webfont.ttf
       sudo mv fontawesome-webfont.ttf /usr/share/fonts
       fc-cache -f -v
   fi
   echo "============Install k-vim==============="
   cd ~/Software/
   if ! [ -d "k-vim" ] ; then
       git clone https://github.com/wklken/k-vim.git
       sudo apt-get install ctags
       sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖
       sudo apt-get install silversearcher-ag
       sudo pip install pyflakes
       sudo pip install pylint
       sudo pip install pep8
       cd k-vim/
       sh -x install.sh
    fi
    echo "============Install Sogou==============="
    cd ~/Software/
    if ! [ -d "Sogou" ] ; then
        mkdir Sogou
       sudo apt-get install fcitx
       firefox http://pinyin.sogou.com/linux/?r=pinyin
       echo "Wait a Key enter....... ....."
       read key
       mv ~/Downloads/sogou*.deb Sogou/
       cd Sogou
       sudo dpkg -i sogou*.deb
       sudo apt-get -f install
       # open lanuage-support, change to fcitx and click fcitx configuaration, click + in input method, add sogou pinying
    fi
    echo "============Install Netease==============="
    cd ~/Software/
    if ! [ -d "Netease" ] ; then
        sudo apt-get install libqt5x11extras5
        sudo apt-get install gstreamer1.0-plugins-bad
        sudo apt-get install gstreamer1.0-plugins-ugly
        sudo apt-get install libqt5multimedia5-plugins
        sudo apt-get install libqt5multimediawidgets5
        sudo apt-get install libqt5libqgtk2

        mkdir Netease
        firefox "http://music.163.com/#/download"
        echo "Wait a Key enter....... ....."
        read key
        mv ~/Downloads/netease*.deb Netease/
        sudo dpkg -i netease*.deb
    fi

    echo "============Install Franz==============="
    cd ~/Software/
    if ! [ -d "Franz" ] ; then
        mkdir Franz
        cd Franz
        wget https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz
        tar -xvzf *.tar
    fi
fi


if [[ "$1" == "dictionary" ]]
then
   echo "============Install Goldendict==============="
   sudo apt-get install goldendict
   cd ~/Software/
   if ! [ -d "Goldendict" ] ; then
        mkdir Goldendict
   fi
   cd Goldendict
   # langdao
   wget http://depot.kdr2.com/resource/stardict/stardict-langdao-ce-gb-2.4.2.tar.bz2
   wget http://depot.kdr2.com/resource/stardict/stardict-langdao-ec-gb-2.4.2.tar.bz2
   # word root
   wget http://depot.kdr2.com/resource/stardict/stardict-zigenzidian-2.4.2.tar.bz2
   # cs professional
   wget http://depot.kdr2.com/resource/stardict/stardict-kdic-computer-gb-2.4.2.tar.bz2
   # chinese poem
   wget stardict-poemstory-2.4.2.tar.bz2
   # Oxford -43M
   wget http://download.huzheng.org/babylon/english/stardict-Oxford_Advanced_Learner_s_Dictionary_7-2.4.2.tar.bz2
   # Concise Oxford -7.6M
   wget http://download.huzheng.org/babylon/english/stardict-Concise_Oxford_English_Dictionary-2.4.2.tar.bz2
   # Collins
   wget http://download.huzheng.org/babylon/english/stardict-babylon-collins4-2.4.2.tar.bz2
   # Cambridge
   wget http://download.huzheng.org/babylon/english/stardict-Cambridge_Advanced_Learner_s_Dictionary-2.4.2.tar.bz2
   # Merriam-Webster -3.6M
   wget http://download.huzheng.org/babylon/english/stardict-Merriam-Webster_Collegiate_Dictionary-2.4.2.tar.bz2
   # Langman - 27M
   wget http://download.huzheng.org/babylon/english/stardict-LDOCE4-2.4.2.tar.bz2
   cd ~/Software/Goldendict
   for dictf in *.tar.bz2
   do
       echo "======Unzip=="$dictf"==========="
       tar -xvjSf $dictf
   done
fi

if [[ "$1" == "dropbox" ]] ; then
    cd ~/Software
    if ! [ -d "Dropbox" ] ; then
        mkdir Dropbox
        cd Dropbox
        wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
    fi
    sudo apt-get install python-gtk2
    sudo apt-get install libpango1.0.0
    sudo apt-get install python-gpgme
    for dropboxf in *.deb
    do
        sudo dpkg -i $droboxf
    done
fi
if [[ "$1" == "zotero" ]] ; then
    cd ~/Software
    firefox https://www.zotero.org/download/
    if ! [ -d "Zotero" ] ; then
        mkdir Zotero
        cd Zotero
        wget https://download.zotero.org/standalone/4.0.29.10/Zotero-4.0.29.10_linux-x86_64.tar.bz2
        tar -xvjSf Zotero-4.0.29.10_linux-x86_64.tar.bz2

        wget https://addons.mozilla.org/firefox/downloads/file/420697/zotfile-4.2.6-fx.xpi?src=dp-btn-primary
        mv zotfile-4.2.6-fx.xpi\?src\=dp-btn-primary zotfile-4.2.6-fx.xpi
        # https://github.com/retorquere/zotero-better-bibtex/releases
        wget https://github.com/retorquere/zotero-better-bibtex/releases/download/1.6.91/zotero-better-bibtex-1.6.91.xpi

    fi
fi



