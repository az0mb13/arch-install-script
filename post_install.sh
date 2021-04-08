pacman -S xorg xf86-video-intel nvidia nvidia-settings --noconfirm
pacman -S sddm --noconfirm
systemctl enable sddm
pacman -S plasma konsole dolphin ark kcalc krunner partitionmanager --noconfirm
pacman -S alsa-utils bluez bluez-utils sof-firmware alsa-ucm-conf --noconfirm
systemctl enable bluetooth.service
pacman -S firefox openssh qbittorrent wget screen git neofetch --noconfirm

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R zombie:users ./yay-git
cd yay-git
makepkg -si
yay -Syu
mkdir ~/apps && cd ~/apps
wget https://app.hubstaff.com/download/linux -O Hubstaff.sh
chmod +x Hubstaff.sh
./Hubstaff.sh

#installing packages from yay
yay -S slack-desktop --noconfirm
yay -S google-chrome --noconfirm
yay -S authy --noconfirm
yay -S vlc --noconfirm
sudo pacman -S net-tools htop ntfs-3g vlc --noconfirm
