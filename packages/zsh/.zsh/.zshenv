#============================================================[ Paths ]============================================================#

# Homebrew
export PATH="/usr/local/bin":$PATH
export HOMEBREW_AUTOREMOVE=1

# Vim
export VIMRC="$HOME/.vim/.vimrc"
export VIMINIT="source $VIMRC"

# dotfiles
export dotfiles="$HOME/.dotfiles"

# setup
export PATH="$dotfiles:$PATH"

#============================================================[ Settings ]============================================================#

export LANG=ja_JP.UTF-8

#============================================================[ History ]============================================================#

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=10000
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
autoload -Uz compinit
compinit -d "$ZDOTDIR/.zcompdump"

# Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
