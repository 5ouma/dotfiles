#============================================================[ Paths ]============================================================#

# Homebrew
[ $(uname -m) = "x86_64" ] && eval "$(/usr/local/bin/brew shellenv)"
[ $(uname -m) = "arm64" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# dotfiles
export -r dotfiles="$HOME/.dotfiles"
export -r datas="$dotfiles/datas"
export PATH="$dotfiles:$PATH"

#============================================================[ Environment Variables ]============================================================#

# Homebrew
export -r HOMEBREW_AUTOREMOVE=1

# Vim
export -r VIMRC="$HOME/.vim/.vimrc"
export -r VIMINIT="source $VIMRC"
export -r EDITOR="vim"

# Gum
export -r GUM_CONFIRM_SELECTED_BACKGROUND="33"
export -r GUM_CHOOSE_CURSOR_FOREGROUND="33"
export -r GUM_SPIN_SPINNER_FOREGROUND="33"

# less
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
