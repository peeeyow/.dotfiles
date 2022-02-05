if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/functions.zsh

# source
zsh_add_file options.zsh
zsh_add_file aliases.zsh
zsh_add_file vim-mode.zsh
zsh_add_file completion.zsh

# plugins
zsh_add_plugin "romkatv/powerlevel10k"

# powerlevel 10k
zsh_add_file "plugins/powerlevel10k/powerlevel10k.zsh-theme"
source "$HOME/.p10k.zsh"

# initialize
eval "`fnm env`"
eval "`zoxide init zsh`"
# eval "`pip completion --zsh`"
