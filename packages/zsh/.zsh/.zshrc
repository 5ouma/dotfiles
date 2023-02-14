# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#========================================================[ Configurations ]========================================================#

# Homebrew
[ $(uname -m) = "x86_64" ] && eval "$(/usr/local/bin/brew shellenv)"
[ $(uname -m) = "arm64" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# rtx
eval "$(rtx activate zsh -q)"

# iTerm2
source $(brew --prefix)/opt/iterm2-shell-integration/bin/iterm2_shell_integration.zsh

# 1Password
source "$HOME/.config/op/plugins.sh"

# Load plugin's settings
source "$ZDOTDIR/plugins.zsh"

#===========================================================[ Settings ]===========================================================#

setopt print_eight_bit
setopt auto_cd
setopt correct
setopt list_types
zstyle ':completion:*:default' menu select=1
bindkey "^[[Z" reverse-menu-complete
zstyle ":completion:*:commands" rehash 1

# Command line stack
show_buffer_stack() {
  POSTDISPLAY="
  stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack

#==============================================================[ Paths ]==============================================================#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
