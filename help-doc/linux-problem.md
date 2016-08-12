#Big Problem
1. No sound into headphone.

#Convenience
1. windows move and split (ctrl+win+left/right)

2. Freemind in ubuntu

3. vim
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

3. Quick SSH Connect(store password and session)
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
3.1 Remote GUI program shown in Ubuntu
Really compatible and easy to implement
```
ssh -X username@host
```
Put into ~/Linux/bin/serverconnect.sh and chmod 750 serverconnect.sh

3.2 SVN Alternatives
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
Ref<http://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion>

3.3 Other tools
PDF Reader-> evince
Microsoft Office -> Libreoffice
dropbox
TortoiseSVN -> SVN (<http://svnbook.red-bean.com/en/1.4/svn.ref.svn.html>)


3.4 Caps Lock key change to additional CTRL
```
sudo apt-get install gnome-tweak-tool
```
open gnome-tweak-tool, typing, caps behavior -> make as an additional ctrl keys.

4. Quick Github Repo commit

5. package install guide:
apt-cache show package          //description of package
apt-cache search package          //a short summary of all the texlive
apt-get install xxx

6. texlive choose and install
sudo apt-get install texlive-latex-base
Better Choice
```
sudo apt-get install texlive
sudo apt-get install texlive-latex-extra --no-install-recommends            #for a smaller extra package
```
tips, pdf open tools - evince; this pdfware is quite simple but powerful. Annotation and highlight is in the left side with a tiny icon.

8. Navigation
navigate in terminal(tmux): ctrl-b + [ or ctrl-b+pageup/pagedown

9. change default shell
```
chsh -s /bin/bash
```
10. window move and resize

```
wmctrl -d #show desktop
wmctrl -l #list all the windows
wmctrl -i -a <win-id>  #ignore other workspace; activate windows id
```
Ubuntu Workspace Move: Ctrl+Alt+Arrow

11. Temperature Monitor
```
sudo apt-get install lm-sensors
sudo sensors-detect
#sudo service kmod start
sensors
```
12. Account in Ubuntu
Add
```
sudo adduser newuser #example newuser-> silly
```
Delete
```
sudo userdel newuser #example newuser-> silly
sudo rm -rf /home/newuser
```

13. connectable computer (-)
```
sudo iptables -L
```
sudo apt-get openssh-server
check ps -A |grep sshd      #check sshd runs or not
ssh -v localhost            #check locally

<https://help.ubuntu.com/lts/serverguide/openssh-server.html>

ifconfig : inet addr:
ssh username@localhost -p 2222  # silly sillyisafatpig

14. Thunderbird

addon google calendar
school-settings :
server-settings incoming IMAP outlook.office365.com port:993 ssl/tls
                outgoing smtp outlook.office365.com port:587 starttls

15. Dropbox
