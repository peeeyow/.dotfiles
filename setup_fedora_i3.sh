sudo dnf -y install i3-gaps xinput arc-theme zsh polybar stow ranger arc-theme ripgrep zoxide cargo kitty dunst picom rofi feh chsh tlp tlp-rdw brightnessctl python-devel @development-tools scrot util-linux-user lsd mozilla-fira-mono-font fontawesome5-fonts-all jetbrains-mono-fonts-all starship pam-u2f pamu2fcfg pcsc-lite libasan


sudo dnf -y groupinstall "X Software Development" "Development Tools" "Development Libraries"

chsh -s `which zsh`

cargo install fnm stylua
pip install -U wheel ueberzug pynvim

mkdir ~/.config/tmux/plugins/

git clone https://github.com/tmux-plugins/tpm.git ~/.config/tmux/plugins/tpm

# setup spanish like compose
sudo localectl set-x11-keymap us pc105+inet altgr-intl

# pldt sucks
nmcli conn modify "<connection-name>" ipv4.ignore-auto-dns yes
nmcli conn modify "<connection-name>" ipv4.dns "8.8.8.8 8.8.4.4"
systemctl restart NetworkManager
