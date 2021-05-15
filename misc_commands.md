## Configure borderless windows when maximized in KDE

```
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key BorderlessMaximizedWindows true
qdbus org.kde.KWin /KWin reconfigure
```
---

## Optimus Manager prime-run command 

```
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia appname
```
---

## Fix Antialiasing for fonts in Java apps

```
Paste this in /etc/environment. Can change the value to `gasp` as well

_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
```
---

## Fix for CPU Throttling in Intel CPUs

```
Clone and ./install.sh

https://github.com/erpalma/throttled
```
---

## Fixing Sound in newer laptop models

```
Install sof-firmware and alsa-ucm-conf
```

## Fixing Bluetooth headphones

```
Install these - 
sudo pacman -S bluez
sudo pacman -S bluez-utils
sudo pacman -S blueman (Try without this next time in KDE)
sudo pacman -S pulseaudio-bluetooth

Then restart pulseaudio and bluetooth with 
pulseaudio -k
pulseaudio --start
sudo systemctl restart bluetooth
```

## Starting ssh-agent automatically on system boot

Create a systemd user service, by putting the following to `~/.config/systemd/user/ssh-agent.service`:

```
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

Setup shell to have an environment variable for the socket (.bash_profile, .zshrc, ...):

`export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"`

Enable the service, so it'll be started automatically on login, and start it:

```
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
```
