#============================================================[ Paths ]============================================================#

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Vim
export VIMRC=$HOME/.vim/.vimrc
export VIMINIT="source $VIMRC"

# dotfiles
export dotfiles="$HOME"/.dotfiles

# memo
export PATH="$dotfiles"/packages/commands/memo:$PATH

# notion
export PATH="$dotfiles"/packages/commands/notion:$PATH

#============================================================[ Settings ]============================================================#

# Use Japanese
export LANG=ja_JP.UTF-8

# Load plugin's settings
source "$ZDOTDIR"/.plugins.zsh

#============================================================[ History ]============================================================#

# Where to save history file
export HISTFILE=$HOME/.zsh/.zsh_history

# Number of histories stored in memory
export HISTSIZE=1000

# Number of histories saved in the history file
export SAVEHIST=10000

# Share histories between concurrently running zsh
setopt share_history

# Remove extra space when saving to histories
setopt hist_reduce_blanks

# If the command entered is already in the command history, delete the older command
setopt hist_ignore_all_dups

# Add black frame when selecting with Tab
autoload -Uz compinit
compinit -d $HOME/.zsh/.zcompdump

# Search the history for commands that begin with the characters entered and completes them with the up and down arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
