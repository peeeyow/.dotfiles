function zvm_config () {
    ZVM_INIT_MODE=sourcing
}

function zvm_after_init ()
{
    zmodload zsh/complist
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
}

zsh_add_plugin "jeffreytse/zsh-vi-mode"
