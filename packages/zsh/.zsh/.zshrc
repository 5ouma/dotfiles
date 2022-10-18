# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
#========================================================[ Configurations ]========================================================#

# Load plugin's settings
source "$ZDOTDIR"/plugins.zsh

# iTerm2
test -e "$ZDOTDIR"/.iterm2_shell_integration.zsh && source "$ZDOTDIR"/.iterm2_shell_integration.zsh

# Homebrew
if [[ $(uname -m) = "arm64" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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
