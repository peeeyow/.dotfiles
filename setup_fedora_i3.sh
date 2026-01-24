sudo dnf -y install i3-gaps xinput arc-theme zsh polybar stow ranger arc-theme ripgrep zoxide cargo kitty dunst picom rofi feh util-linux-user tlp tlp-rdw brightnessctl python-devel @development-tools scrot util-linux-user lsd fontawesome5-fonts-all jetbrains-mono-fonts-all pam-u2f pamu2fcfg pcsc-lite libasan wl-clipboard tldr git-credential-libsecret pulseaudio-utils zathura zathura-plugins-all btop bat sqlite-devel sqlite-tcl tk-devel ImageMagick-devel poppler-utils netpbm-progs inotify-tools vnstat xfce-polkit fira-code-fonts fuse-libs @development-tools @development-libs @base-x @x-software-development fastfetch fd git-delta

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
sudo dnf copr enable atim/lazydocker -y
sudo dnf install lazydocker

# onefetch
sudo dnf copr enable varlad/onefetch
sudo dnf install onefetch

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

# molten nvim
nvim_env="$HOME/workfiles/virtualenvs"
mkdir -p $nvim_env
python -m venv $nvim_env/neovim
source $nvim_env/neovim/bin/activate
pip install ipykernel jupytext pynvim jupyter_client cairosvg plotly kaleido pyperclip nbformat pillow
deactivate
