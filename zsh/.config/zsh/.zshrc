if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZDOTDIR/functions.zsh

# source
zsh_add_file options.zsh
zsh_add_file aliases.zsh
zsh_add_file vim-mode.zsh

# plugins
zsh_add_plugin "romkatv/powerlevel10k"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-history-substring-search"

zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "greymd/docker-zsh-completion"
zsh_add_file completion.zsh

# history-substring keybind
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# powerlevel 10k
zsh_add_file "plugins/powerlevel10k/powerlevel10k.zsh-theme"
source "$HOME/.p10k.zsh"


# initialize
eval "`fnm env --use-on-cd`"
eval "`zoxide init zsh`"
eval "`pip completion --zsh`"
eval "`pyenv init -`"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pio/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pio/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pio/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

