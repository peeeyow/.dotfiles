sudo dnf -y install i3-gaps xinput arc-theme zsh polybar stow ranger arc-theme ripgrep zoxide cargo kitty dunst picom rofi feh chsh tlp tlp-rdw brightnessctl python-devel @development-tools scrot util-linux-user lsd mozilla-fira-mono-font fontawesome5-fonts-all jetbrains-mono-fonts-all starship


sudo dnf -y groupinstall "X Software Development"

chsh -s `which zsh`

cargo install fnm stylua
pip install -U wheel ueberzug pynvim

mkdir ~/.config/tmux/plugins/

git clone https://github.com/tmux-plugins/tpm.git ~/.config/tmux/plugins/tpm

# setup spanish like compose
sudo localectl set-x11-keymap us pc105+inet altgr-intl
