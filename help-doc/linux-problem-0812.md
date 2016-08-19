#Big Problem (Todo List)
1. No sound into headphone through SSH (ssh self problem)

2. Windows Ctrl - wmctrl (deeply understand)

3. npm study (javascript etc, not in hurry)

4. Research Environment Get Familiar

!! 5. svn **problem** cant commit in ubuntu...!!!

6. Ubuntu Dictionary (like lingoes in Windows)

!! 7. Chinese input in ubuntu (restart)

8. freemind in ubuntu (done)

9. paste and copy in/out terminal (alternatives)
Way 1
```
--gnome terminal use ctrl-shift-c for copy and ctrl-shift-v for paste
vim insert
```
# Ubuntu - Installation Guide

## Ubuntu Settings

### 1. Caps Lock key change to additional CTRL
```
sudo apt-get install gnome-tweak-tool
```
open gnome-tweak-tool, typing, caps behavior -> make as an additional ctrl keys.

```
setxkbmap -option caps:ctrl_modifier
```
<http://askubuntu.com/questions/53038/how-do-i-remap-the-caps-lock-key>


### 2. change default shell
```
chsh -s /bin/bash
```

### 3. window move and resize
```
wmctrl -d #show desktop
wmctrl -l #list all the windows
wmctrl -i -a <win-id>  #ignore other workspace; activate windows id
```
Ubuntu Workspace Move: Ctrl+Alt+Arrow

### 4. Key-Shortcuts
Win Switch to Neighbor Workspace: super + arrow
Win Move to other Workspace: None
Workspace Switch : ctrl + number
Workspace Switch to Neighbor: ctrl + alt + arrow


### 5. deb file install and remove

sudo dpkg -i xxx.deb
sudo dpkg -r xxx

## Core Software Installation

### 1. vim
Compile Problem
```
checking for tgetent()... configure: error
      You need to install a terminal library; for example ncurses.
      Or specify the name of the library with --with-tlib.
apt-get install ncurses-dev

apt-get install python-dev
```
the best way in ubuntu to install vim:
```
sudo apt-get upgrade vim
```

install kvim


### 2. Quick SSH Connect(store password and session)
Generate a public key locally and send it to server

```
cd ~
mkdir .ssh
chmod 700 .ssh
ssh-keygen     #enter keyfile:rsa_id  next phrase:psw
ssh-copy-id -i user@host
ssh user@host
```


__Tips__: SSH copy files between local machine and server - use scp
```
scp /path/to/file username@host:path/to/destination
scp username@host:/path/to/file path/to/destination
```

2.1 Remote GUI program shown in Ubuntu
Really compatible and easy to implement
```
ssh -X username@host
```
Put into ~/Linux/bin/serverconnect.sh and chmod 750 serverconnect.sh

2.2 SVN Alternatives
TortoiseSVN is only for windows

Tortoise SVN Alternatives - just use svn
Integer with nautilus tool:rabbit
or just live in the command line:
```
sudo apt-get install subversion
```

```
svn checkout --depth immediates ssh+svn://xuanqi@young.ece.ust.hk/home/svn_repository SVN           #only download the first folders names
svn update --set-depth infinity Group\ discussion           #infinity, immediates, empty
```
```
svn ls          #check svn-repo's files
svn add xxx_files
svn ci -m "COMMIT MEssage"      # otherwise, will be ignored
```
```
svn status -v xxx_files         #check file status
svn status -u xxx-files         # check updates
```

Bug Fix >> Status against revision

**problem** cant commit in ubuntu...
```
svn add xxx
svn commit -m "description"
svn update
```
like windows after commit, update first and maybe wait for some seconds to see the changes)

Ref<http://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion>
<http://www.linuxfromscratch.org/blfs/edguide/chapter03.html>
<http://stackoverflow.com/questions/20273160/when-doing-a-subversion-commit-this-line-and-those-below-will-be-ignored>
<http://beerpla.net/2008/07/23/how-to-check-if-the-local-svn-revision-is-up-to-date/>

### 3. Other tools
PDF Reader-> evince
Microsoft Office -> Libreoffice
dropbox
TortoiseSVN -> SVN (<http://svnbook.red-bean.com/en/1.4/svn.ref.svn.html>)

### 4. Freemind in ubuntu
install linux binary 2.6MB <http://freemind.sourceforge.net/wiki/index.php/Download>
alias mindopen="~/Software/freemind/freeMind.sh"

Java Virtual Machine Issue; apt-get install openjdk-8-jre


### 5. Quick Github Repo commit
```
git status  #check package status
git add
git commit
git push
git pull    #update packages
```

### 6. package install guide:
```
apt-cache show package          //description of package
apt-cache search package          //a short summary of all the texlive
apt-get install xxx
```

### 7. texlive choose and install
sudo apt-get install texlive-latex-base
Better Choice
```
sudo apt-get install texlive
sudo apt-get install texlive-latex-extra --no-install-recommends            #for a smaller extra package
```
tips, pdf open tools - evince; this pdfware is quite simple but powerful. Annotation and highlight is in the left side with a tiny icon.

### 8. tmux
navigate in terminal(tmux): ctrl-b + [ or ctrl-b+pageup/pagedown

### 9. Temperature Monitor
```
sudo apt-get install lm-sensors
sudo sensors-detect
#sudo service kmod start
sensors
```
### 10. Account in Ubuntu
Add
```
sudo adduser newuser #example newuser-> silly
```
Delete
```
sudo userdel newuser #example newuser-> silly
sudo rm -rf /home/newuser
```

### 11. connectable computer (-)
```
sudo iptables -L
```
sudo apt-get openssh-server
check ps -A |grep sshd      #check sshd runs or not
ssh -v localhost            #check locally

<https://help.ubuntu.com/lts/serverguide/openssh-server.html>

ifconfig : inet addr:
ssh username@localhost -p 2222  # silly sillyisafatpig

### 12. Thunderbird
addon google calendar
school-settings :
server-settings incoming IMAP outlook.office365.com port:993 ssl/tls
                outgoing smtp outlook.office365.com port:587 starttls

### 13. Dropbox
<https://www.dropbox.com/install>
Use .deb file
```
You might want to run 'apt-get -f install' to correct these:
The following packages have unmet dependencies:
dropbox : Depends: python-gtk2 (>= 2.12) but it is not going to be installed
python-gtk2-dev : Depends: python-gtk2 (>= 2.24.0-4ubuntu1) but it is not going to be installed
Depends: python-gtk2 (< 2.24.0-4ubuntu1.1~) but it is not going to be installed
Depends: libglib2.0-dev (>= 2.8) but it is not going to be installed
Depends: libgtk2.0-dev (>= 2.18.0) but it is not going to be installed
Depends: python-gobject-2-dev (>= 2.21.3) but it is not going to be installed
Recommends: python-gtk2-doc but it is not going to be installed
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).>)
```
Then better to compile from the source
```
No package 'libnautilus-extension' found
sudo apt-get install libnautilus-extension-dev
sudo apt-get install python-gtk2-dev
sudo apt-get install python-docutils-dev
```
Succeed



### 14. Wechat
```
npm install -g node-wechat-terminal
wechat-terminal
\h

node problem solution: sudo ln -s /usr/bin/nodejs /usr/bin/node
```
Because Debian renames node to node.js

<https://www.npmjs.com/package/node-wechat-terminal>

## 15. Evince Use Guide
Create own custom shortcuts
Enable /desktop/gnome/interface/can_change_accels flag in gconf

<https://help.gnome.org/users/evince/stable/shortcuts.html.en>

## 16. Sogou Pingyin Installation
```
sudo apt-get install fcitx
sudo dpkg --install sogoupinyin_xxxx.deb
fcitx-autostart
```


