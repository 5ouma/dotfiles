# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"

# Homebrew
export HOMEBREW_AUTOREMOVE=1

# fzf
export FZF_DEFAULT_COMMAND='fd -H -t=f -E={Library,Movies,Music,Pictures,.cache,.local,OrbStack,.orbstack,.vscode,.vscode-insiders,.git,node_modules,.DS_Store}'

# Gum
export GUM_CONFIRM_SELECTED_BACKGROUND='27'
export GUM_CHOOSE_CURSOR_FOREGROUND='27'
export GUM_FORMAT_THEME="$data/blue.json"
export GUM_INPUT_CURSOR_FOREGROUND='27'
export GUM_SPIN_SPINNER_FOREGROUND='27'

# less
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
mkdir -p "$(dirname "$LESSHISTFILE")"

# rtx
export RTX_USE_TOML=1

# Vim
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export VIMINIT="source $MYVIMRC"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
