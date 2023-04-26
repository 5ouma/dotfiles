# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#========================================================[ Configurations ]========================================================#

# Sheldon
eval "$(sheldon source)"

# rtx
eval "$(rtx activate -q zsh)"

# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[ -f "$ZDOTDIR/.p10k.zsh" ] && source "$ZDOTDIR/.p10k.zsh"

# 1Password
source "$HOME/.config/op/plugins.sh"

# iTerm2
[ -e "$ZDOTDIR/.iterm2_shell_integration.zsh" ] && source "$ZDOTDIR/.iterm2_shell_integration.zsh"

#===========================================================[ Settings ]===========================================================#

setopt print_eight_bit
setopt auto_cd
setopt correct
setopt list_types
zstyle ':completion:*:default' menu select=1
bindkey "^[[Z" reverse-menu-complete
zstyle ":completion:*:commands" rehash 1

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars ' -,;:"()[]{}@/=|'
zstyle ':zle:*' word-style unspecified

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
