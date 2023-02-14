# alias usable for sudo
alias sudo="sudo "

# interactive
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# ls
alias ls="lsd "
alias la="ls -la"
alias lA="ls -lA"

# readable
alias du="du -h"
alias df="df -h"
alias free="free -h"

# programs
alias v="nvim "
alias r="ranger "

# compiling flags
alias gpp="clang++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors -DONPC"
alias gpp17="clang++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors --std=c++17 -DONPC"
alias gpp20="clang++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors --std=c++20 -DONPC"

# nvidia offloading
alias nv="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

# paths
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# fnm installation
alias fnm_update="curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell"
