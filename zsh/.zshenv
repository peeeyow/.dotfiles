# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Use a better zshconfig dir
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"

# man color
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export GROFF_NO_SGR=1

# PATH
export PATH=$HOME/.cargo/bin:$HOME/.scripts:$HOME/.fnm:$HOME/.local/bin:$PATH
