#!/usr/bin/fish

# pacman
sudo pacman -Syyu
sudo pacman -S neovim nodejs ttf-sourcecodepro-nerd ttf-hack-nerd ttf-fira-code ufw hyprland hyprpaper fish git bat man neofetch rofi waybar fakeroot binutils make gcc bat clamtk curl fzf github-cli docker docker-compose

# yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

yay -S google-chrome spotify powerline-go zoom
