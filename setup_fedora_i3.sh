sudo dnf -y install i3-gaps xinput arc-theme zsh polybar stow ranger arc-theme ripgrep zoxide cargo kitty dunst picom rofi feh util-linux-user tlp tlp-rdw brightnessctl python-devel @development-tools scrot util-linux-user lsd mozilla-fira-mono-fonts fontawesome5-fonts-all jetbrains-mono-fonts-all pam-u2f pamu2fcfg pcsc-lite libasan wl-clipboard tldr git-credential-libsecret pulseaudio-utils zathura zathura-plugins-all btop bat sqlite-devel sqlite-tcl tk-devel


sudo dnf -y groupinstall "X Software Development" "Development Tools" "Development Libraries"

chsh -s `which zsh`

cargo install fnm du-dust
pip install -U wheel ueberzug pynvim

mkdir ~/.config/tmux/plugins/

git clone https://github.com/tmux-plugins/tpm.git ~/.config/tmux/plugins/tpm

# setup spanish like compose
sudo localectl set-x11-keymap us pc105+inet altgr-intl

# lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# lazydocker
sudo dnf copr enable atim/lazydocker
sudo dnf install lazydocker

# onefetch
sudo dnf copr enable varlad/onefetch
sudo dnf install onefetch

# nvautoinstall
sudo dnf copr enable t0xic0der/nvidia-auto-installer-for-fedora
sudo dnf install nvautoinstall

# pldt sucks
nmcli conn modify "<connection-name>" ipv4.ignore-auto-dns yes
nmcli conn modify "<connection-name>" ipv4.dns "8.8.8.8 8.8.4.4"
systemctl restart NetworkManager

# thinkpad throttled
dnf copr enable abn/throttled
dnf install -y throttled
systemctl enable --now throttled

flatpak install flathub net.ankiweb.Anki org.freedesktop.Sdk.Extension.texlive

# ipython before stowing
mkdir -p ~/.ipython/profile_default
