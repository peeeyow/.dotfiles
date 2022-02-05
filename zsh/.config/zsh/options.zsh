setopt autocd 
setopt extendedglob
setopt nomatch
setopt menucomplete
setopt interactive_comments
setopt hist_save_no_dups 
setopt menu_complete
setopt auto_list
setopt complete_in_word

unsetopt beep

stty stop undef
zle_highlight=('paste:none')
