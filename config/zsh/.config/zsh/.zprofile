# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.pre.zsh"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# fzf
export FZF_DEFAULT_COMMAND='fd -H -t=f -E={Library,Movies,Music,Pictures,.cache,.local,OrbStack,.orbstack,.vscode,.vscode-insiders,node_modules,.next,.DS_Store}'

# Gitlint
export GITLINT_CONTRIB='CT1'

# Gum
export GUM_CONFIRM_SELECTED_BACKGROUND='27'
export GUM_CHOOSE_CURSOR_FOREGROUND='27'
export GUM_FORMAT_THEME="$data/blue.json"
export GUM_INPUT_CURSOR_FOREGROUND='27'
export GUM_SPIN_SPINNER_FOREGROUND='27'

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_AUTOREMOVE=1
export HOMEBREW_NO_ENV_HINTS=1

# less
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
mkdir -p "$(dirname "$LESSHISTFILE")"

# Vim
export MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
export VIMINIT="source $MYVIMRC"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.post.zsh"
