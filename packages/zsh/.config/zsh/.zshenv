#============================================================[ Paths ]============================================================#

# Homebrew
[ $(uname -m) = 'x86_64' ] && eval "$(/usr/local/bin/brew shellenv)"
[ $(uname -m) = 'arm64' ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# dotfiles
export dotfiles="$HOME/.dotfiles"
export datas="$dotfiles/datas"
export PATH="$dotfiles:$PATH"

#============================================================[ Environment Variables ]============================================================#

# Lang
export LANG='en_US.UTF-8'

# Homebrew
export HOMEBREW_AUTOREMOVE=1

# fzf
export FZF_DEFAULT_COMMAND='fd -H -E={Movies,Music,Pictures,Library,.cache,.local,.vscode,.vscode-insiders,.git}'

# Gum
export GUM_CONFIRM_SELECTED_BACKGROUND='27'
export GUM_CHOOSE_CURSOR_FOREGROUND='27'
export GUM_FORMAT_THEME="$datas/blue.json"
export GUM_INPUT_CURSOR_FOREGROUND='27'
export GUM_SPIN_SPINNER_FOREGROUND='27'

# less
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# rtx
export RTX_USE_TOML=1

# Vim
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export VIMINIT="source $MYVIMRC"
