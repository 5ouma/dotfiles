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

# forgit
export -r FORGIT_NO_ALIASES=1

# Gum
export -r GUM_CONFIRM_SELECTED_BACKGROUND="33"
export -r GUM_CHOOSE_CURSOR_FOREGROUND="33"
export -r GUM_SPIN_SPINNER_FOREGROUND="33"

# zsh-you-should-use
export -r YSU_MESSAGE_FORMAT="💡 \033[36m%alias\033[m"

#============================================================[ History ]============================================================#

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=10000
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups

# Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
