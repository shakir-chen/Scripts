#!/bin/bash

function soft-check(){
    if [[ $(apt-cache policy $1) == "" ]] ; then
        echo "----No "$1" Installed -----"
        sudo apt-get install $1
    else
        echo "++++"$1" has installed +++++"
    fi
}

function pip-check(){
    if [[ $(ls /usr/local/bin | grep $1) == "" &&
        $(ls /usr/local/lib/python2.7/dist-packages | grep $1) == "" ]] ; then
        echo "No Python Package "$1" Installed ====="
        sudo pip install $1
    else
        echo "Python Package "$1" has installed ====="
    fi
}

function pip3-check(){
    if [[ $(ls /usr/local/bin | grep $1) == "" &&
        $(ls /usr/local/lib/python3.5/dist-packages | grep $1) == "" ]] ; then
        echo "No Python Package "$1" Installed ====="
        sudo pip3 install $1
    else
        echo "Python Package "$1" has installed ====="
    fi
}
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
    if ! [ -d "~/.tmux" ] ; then
        ln -s ~/Software/Scripts/tmux/tmux-folder ~/.tmux
    fi
    ln -s ~/Software/Scripts/tmux/tmux.conf ~/.tmux.conf
    echo "=========Terminal Tab========="
    ln -s ~/Software/Scripts/gtk/gtk.css ~/.config/gtk-3.0/
    echo "=========Zathura========="
    # ln -s ~/Software/Scripts/shell/zathurarc ~/.zathurarc
    sudo ln -s ~/Software/Scripts/shell/zathurarc /etc/
    echo "=========i3wm========="
    if ! [ -d "~/.i3" ] ; then
        ln -s ~/Software/Scripts/shell/_i3 ~/.i3
    fi
    echo "=========feh========="
    if ! [ -d "~/.config/feh" ] ; then
        ln -s ~/Software/Scripts/shell/feh ~/.config/feh
    fi

    ln -s ~/Software/Scripts/help-doc/_helprc ~/.helprc
fi


if [[ "$1" == "dir" ]]
then
    echo "=========Link Dropbox to Current Folder========="
    if ! [ -d "~/Documents" ] ; then
        ln -s ~/Dropbox/Linux/Documents ~/
    fi
    if ! [ -d "~/Dairy" ] ; then
        ln -s ~/Dropbox/Linux/Dairy ~/
    fi
    if ! [ -d "~/Music" ] ; then
        ln -s ~/Dropbox/Linux/Music ~/
    fi
    if ! [ -d "~/Research" ] ; then
        ln -s ~/Dropbox/Linux/Research ~/
    fi
    echo "=========Dropbox File link========="
    ln -s ~/Dropbox/Linux/notes/plan.txt ~/
fi

if [[ "$1" == "software" ]]
then
   echo "============Install git==============="
   soft-check git
   echo "============Install vim==============="
   soft-check vim
   echo "============Install tmux==============="
   soft-check tmux
   soft-check xclip
   echo "============Install zathura==============="
   soft-check zathura
   soft-check qpdfviewer
   soft-check qpdf

   echo "============Install i3wm==============="
   soft-check i3
   soft-check i3status
   soft-check conky

   echo "============Install Python==============="
   soft-check python-dev
   soft-check python-pip
   soft-check python3-pip

   echo "============Install Research==============="
   pip3-check matplotlib
   pip3-check numpy
   pip3-check scipy
   pip3-check ipython

   echo "============Install howdoi==============="
   pip-check howdoi
   echo "============Install cheat==============="
   pip-check cheat

   echo "============Install scdv dictionary==============="
   soft-check sdcv

   echo "============Install Latex==============="
   soft-check texlive
   soft-check texlive-latex-extra
   echo "============Install Synergy==============="
   soft-check synergy
   echo "============Install svn==============="
   soft-check subversion
   echo "============Install scrot==============="
   soft-check scrot

   echo "============Install feh==============="
   soft-check feh
fi

if [[ "$1" == "ssh" ]]
then
   echo "============Install ssh==============="
   soft-check openssh-server
   sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
   sudo chmod a-w /etc/ssh/sshd_config.original

   echo "vim sshd_config"
   echo "Port 2222"
   echo "PubkeyAuthentication yes"
   echo "Banner /etc/issue.net"
   echo "Wait a Key enter....... ....."
   read key
   sudo vim /etc/ssh/sshd_config
   sudo iptables -L
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



