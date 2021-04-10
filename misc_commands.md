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
