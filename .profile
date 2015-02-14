# ~/.profile: Executed by the command interpreter for login shells.
# This file is not read by bash, if ~/.bash_profile or ~/.bash_login exists.

[ -d "$HOME/bin"     ] && PATH="$HOME/bin:$PATH"
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
