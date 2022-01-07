# Fixes for stuff in Arch Linux running on Thinkpad T15 Gen 1

* Arch Auto Installer inside `install.sh`

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

## Starting ssh-agent automatically on system boot - FIX 1

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

---

## Configuring Github SSH - FIX 2

Add this in the `~/.ssh/config` file:
```
Host github
        HostName github.com
        User git
        IdentityFile ~/.ssh/github
        AddKeysToAgent yes
```
Add this in the `~/.zshrc` file: 

```
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
```

---

### If META key stops opening Application launcher in KDE

```
kwriteconfig5 --file ~/.config/kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.plasmashell,/PlasmaShell,org.kde.PlasmaShell,activateLauncherMenu"
qdbus org.kde.KWin /KWin reconfigure
```

---

### When VMWare can't open /dev/vmmon. No such file or directory.

```
sudo vmware-modconfig --console --install-all
```

---

### Unalias gau permanently to use the tool

```
vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh
# alias gau='git add --update'
```
---
### VMWare Glibc error fix

```
sudo LD_LIBRARY_PATH=/lib/ ~/Downloads/VMware-Player-Full-16.2.1-18811642.x86_64.bundle
```

### VMWare can not conenct to Ethernet0

```
sudo systemctl enable --now vmware-networks
```
