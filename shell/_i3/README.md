# i3wm-config
My current i3wm configuration and conky scripts

![alt tag](https://io.pinterjann.is/public/stuff/screenshots/bar_screenshot.png)

## Requirements
- i3
- i3status
- conky
- bash
- setxkbmap
- xorg-xbacklight
- Font Awesome

## Installation
```sh
cd ~
git clone https://github.com/jannispinter/i3wm-config.git .i3
```

## Configuration
You might want to change the network interface names in `.i3/conkyrc`.

If you are on Arch Linux (or Arch Linux based distributions), you might want to add a new cronjob to check for system updates:

```sh
*/10 * * * * checkupdates | wc -l > /tmp/.update_count
```

When new package updates become available, the status bar will notify you, showing a shield symbol and the amount of new packages available.

# Font Support
http://tech.karbassi.com/2009/05/27/command-option-shift-symbols-in-unicode/

# concky with image support
failed
taskbar - icons
tray -icons

## system tray (postpone)

## Launchers:
locate firefox.desktop , learn from yEd.desktop, but this will not add to system tray
application locates at /usr/share/applications ; ~/.local/share/applications

Desktop Icons<http://askubuntu.com/questions/40931/where-are-the-unity-launcher-desktop-files>
<http://askubuntu.com/questions/575113/ubuntu-14-10-add-and-remove-icons-from-the-system-tray>

# fantastic demons
<http://daviddavioblue.deviantart.com/art/haxOS-Conky-454353060>

<http://epsi-rns.github.io/desktop/2016/08/01/modularized-i3status-conky-lua-json.html>

Ref:
<http://conky.sourceforge.net/variables.html>
i3bar-with concky
<https://i3wm.org/docs/user-contributed/conky-i3bar.html>

