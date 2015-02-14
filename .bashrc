# ~/.bashrc: Executed for non-login shells.

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Make `less` more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Source a provided file if it exists and is readable.
rsource () {
  [ -r "$1" ] && source "$1"
}

bash_config_files="$PWD/.bash/*"
nvm_source="$HOME/.nvm/nvm.sh"
source_files="$bash_config_files $nvm_source"

# `rsource` each bash-config file as well as the 'nvm' file.
for file in "$source_files"; do rsource "$file"; done

unset bash_config_files file nvm_source source_files

# If the `shopt -o` 'posix' feature is turned off,
# `rsource` the primary bash-completion file.
! shopt -oq posix && rsource /etc/bash_completion

# Go to the last entered directory.
[ -r "$HOME/.lastdir" ] && cd "$( cat "$HOME/.lastdir" )"
