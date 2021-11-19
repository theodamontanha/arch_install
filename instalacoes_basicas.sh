useradd -m -G wheel -s /bin/bash <usuario>
passwd <usuario>
systemctl start ssh.service
pacman -Syy
pacman -S networkmanager network-manager-applet xorg-server xorg-xinit lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3-gaps i3status i3lock dmenu xfce4 alacritty nautilus chromium samba ntfs-3g
pacman -S vim nano dialog wireless_tools efibootmgr grub os-prober net-tools git go
systemctl start NetworkManager
systemctl enable NetworkManager
systemctl enable lightdm
git clone https://aur.archlinux.org/yay.git
su <usuario> && cd yay && makepkg -si
