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
yay -S appimagelauncher --noconfirm
yay -S notion-app --noconfirm
yay -S notion-enhancer --noconfirm
yay -S ocs-url --noconfirm
yay -S cpupower --noconfirm
yay -S visual-studio-code-bin --noconfirm
sudo pacman -S net-tools htop ntfs-3g vlc python-pip flameshot jre-openjdk jdk-openjdk openvpn cpupower inetutils --noconfirm
wget https://raw.githubusercontent.com/Jigsaw-Code/outline-releases/master/client/stable/Outline-Client.AppImage -O ~/apps/

#Pimping terminal
sudo pacman -S zsh --noconfirm
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#Removing remaining zsh commands for now

#Throttled for Intel CPU
cd ~/apps && git clone https://github.com/erpalma/throttled
cd ~/apps/throttled 
sudo ./install.sh
