echo "Digite o nome do usuario padrao [NÃO root]:"
read usuario
echo "O nome de usuario selecionado foi" $usuario
useradd -m -G wheel -s /bin/bash $usuario
echo "Digite a senha para o usuario:"
passwd $usuario
echo "Digite a senha para o root: "
passwd
systemctl start ssh.service
systemctl enable ssh.service
pacman -Syy --noconfirm
pacman --noconfirm -S networkmanager network-manager-applet xorg-server xorg-xinit lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3-gaps i3status i3lock dmenu xfce4 alacritty nautilus chromium samba ntfs-3g
pacman --noconfirm -S vim nano dialog wireless_tools efibootmgr grub os-prober net-tools git go
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
systemctl start NetworkManager
systemctl enable NetworkManager
systemctl enable lightdm
su $usuario && cd ~
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
echo "Aparentemente foi tudo concluído com sucesso! "
