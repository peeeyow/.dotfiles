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
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"

# PATH
export PATH=$HOME/.cargo/bin:$HOME/.scripts:$HOME/.fnm:$HOME/.local/bin:$PATH

# initialize
eval "`fnm env`"
eval "`zoxide init zsh`"
# eval "`pip completion --zsh`"
