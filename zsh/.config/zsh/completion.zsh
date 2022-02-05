autoload -Uz compinit
zstyle ':completion:*' menu select

# allow dot completion
_comp_options+=(globdots)

fpath+="$ZDOTDIR/plugins/zsh-completions/src"
fpath+="$ZDOTDIR/completions"

compinit
