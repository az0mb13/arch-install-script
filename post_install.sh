pacman -S xorg xf86-video-intel nvidia nvidia-settings --noconfirm
pacman -S sddm --noconfirm
systemctl enable sddm
pacman -S plasma konsole dolphin ark kcalc krunner partitionmanager --noconfirm
pacman -S alsa-utils bluez bluez-utils sof-firmware alsa-ucm-conf --noconfirm
systemctl enable bluetooth.service
pacman -S firefox openssh qbittorrent wget screen git neofetch --noconfirm
