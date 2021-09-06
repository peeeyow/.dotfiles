##!/bin/bash

# check for better mirrors
sudo pacman --debug -Sy --noconfirm

# install development tools
sudo pacman -S --noconfirm devel-tools
sudo pacman -S --noconfirm git

# install yay
cd $HOME
sudo git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo mv yay /opt

sudo pacman -S --noconfirm sway swayidle swaylock grim waybar wofi pactl pavucontrol slurp wl-clipboard jq xdg-desktop-portal-wlr libpipewire02 mako lsd noto-fonts-emoji bluez bluez-utils blueman awesome-terminal-fonts openssh stow otf-fira-mono libappindicator-gtk2 libappindicator-gtk3 thunar arc-gtk-theme

# yay -S autotiling
yay -S seatd

