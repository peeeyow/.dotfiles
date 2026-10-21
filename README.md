# .dotfiles

My system dotfiles repository.

All directories are `stow`able to `$HOME` except for `dnf` and `pacman` which must be `stow`ed to `/etc/`.

## Update global skills

With `agents` and `pi` stowed, run `just update-skills` (requires `just` and Node.js 22.20+).
This updates skills tracked in `agents/.agents/.skill-lock.json` via the Skills CLI.
The existing Stow and Pi symlinks expose the updated files globally; Pi packages are not updated.
