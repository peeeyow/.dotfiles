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

sudo pacman -S sway swayidle swaylock grim waybar wofi pactl pavucontrol slurp wl-clipboard jq xdg-desktop-portal-wlr libpipewire02 mako lsd noto-fonts-emoji noto-fonts-extra noto-fonts bluez bluez-utils blueman awesome-terminal-fonts openssh stow otf-fira-mono libappindicator-gtk2 libappindicator-gtk3 thunar arc-gtk-theme adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts ranger python-pillow

# yay -S autotiling
yay -S seatd

# sudo pacman -S i3-gaps rofi maim xdotools
# yay -S polybar

# TODO
# 1. fix setup.sh
# 2. modularize zsh
# 3. setup nvim config

