source $ZDOTDIR/functions.zsh

# source
zsh_add_file options.zsh
zsh_add_file aliases.zsh
zsh_add_file vim-mode.zsh
zsh_add_file completion.zsh

# initialize
eval "`fnm env`"
eval "`zoxide init zsh`"
# eval "`pip completion --zsh`"
