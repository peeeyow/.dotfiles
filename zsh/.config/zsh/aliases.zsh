# alias usable for sudo
alias sudo="sudo "

# interactive
alias rm="rm -I"
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
alias pn="pnpm "
alias tf="terraform "
alias ts="terraspace "
alias lg="lazygit"
alias g="git "
alias dk="docker "
alias dkc="docker-compose "
alias ipy="ipython "

# compiling flags
alias gpp-debug="g++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors -ggdb"
alias gpp-release="g++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors -O2 -DNDEBUG"
alias gpp17="g++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors -std=c++17 -O2 -DNDEBUG -DONPC"
alias gpp20="g++ -Wall -Wextra -Werror -Wsign-conversion -Weffc++ -pedantic-errors -std=c++20 -O2 -DNDEBUG -DONPC"

# nvidia offloading
alias nv="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

# paths
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# fnm installation
alias fnm_update="curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell"

# python venv sourcing
alias venv="source .venv/bin/activate"
