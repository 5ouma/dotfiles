# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#========================================================[ Configurations ]========================================================#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

# iTerm2
test -e "$ZDOTDIR"/.iterm2_shell_integration.zsh && source "$ZDOTDIR"/.iterm2_shell_integration.zsh

#===========================================================[ Settings ]===========================================================#

# Being enabled to show Japanese file names
setopt print_eight_bit

# Moving directories without `cd`
setopt auto_cd

# Show completions when input commands are typo
setopt correct

# Show type of the files on completions
setopt list_types

# Select with the cursor on completions
zstyle ':completion:*:default' menu select=1

# Reverse with `Shift + Tab` on completions
bindkey "^[[Z" reverse-menu-complete

# Recognize the commands as soon as installed
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

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

#==============================================================[ Paths ]==============================================================#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
