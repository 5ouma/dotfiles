export -r XDG_CONFIG_HOME="$HOME/.config"
export -r XDG_CACHE_HOME="$HOME/.cache"
export -r XDG_DATA_HOME="$HOME/.local/share"
export -r XDG_STATE_HOME="$HOME/.local/state"
export -r ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source "$ZDOTDIR/.zshenv"
