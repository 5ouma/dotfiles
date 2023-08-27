# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

#===========================================================[ Load Tools ]===========================================================#

# Sheldon
eval "$(sheldon source)"

# 1Password
zsh-defer source "$XDG_CONFIG_HOME/op/plugins.sh"

# Atuin
zsh-defer eval "$(atuin init zsh --disable-up-arrow)"

# rtx
eval "$(rtx activate -q zsh)"

# zoxide
zsh-defer eval "$(zoxide init zsh --cmd=j)"

#===========================================================[ Settings ]===========================================================#

# Zsh
setopt print_eight_bit
setopt auto_cd
setopt correct
setopt globdots
setopt list_types
zstyle ':completion:*:default' menu select=1
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*:commands' rehash 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -Uz compinit
zsh-defer compinit -d "$XDG_CACHE_HOME/zsh/compdump"

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars ' -,.;:"()[]{}@/=|'
zstyle ':zle:*' word-style unspecified

# History
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups

# Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

#==============================================================[ Paths ]==============================================================#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
