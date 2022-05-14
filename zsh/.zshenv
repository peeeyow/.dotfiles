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

## PATH
# scripts
export PATH=$HOME/.scripts:$PATH
# cargo
export PATH=$HOME/.cargo/bin:$PATH
# fnm
export PATH=$HOME/.fnm:$PATH
# npm globals
export PATH=$HOME/.config/node_modules/bin:$PATH
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# poetry
export PATH="$HOME/.poetry/bin:$PATH"
# local/bin
export PATH=$HOME/.local/bin:$PATH


# PATH with NVIDIA
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
