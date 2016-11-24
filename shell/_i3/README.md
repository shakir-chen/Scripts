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
