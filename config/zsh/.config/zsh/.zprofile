# 1Password
export PATH="/Applications/1Password.app/Contents/MacOS:$PATH"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# fzf
export FZF_DEFAULT_COMMAND='fd -H -t=f -E={Library,Movies,Music,Pictures,.cache,.local,OrbStack,.orbstack,.vscode,.vscode-insiders,.git,node_modules,.next,.DS_Store}'
export FZF_DEFAULT_OPTS="--bind='ctrl-/:change-preview-window(down|right)' --height=80% --layout=reverse --border --border-label-pos=2"

# Gitlint
export GITLINT_CONTRIB='CT1'

# Homebrew
if [[ "$(uname)" == 'Darwin' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export HOMEBREW_BUNDLE_BREW_SKIP='5ouma/tap/mksei 5ouma/tap/mli blacktop/tap/lporg lslqtz/formulae/bclm_loop'
fi
export PATH="/opt/homebrew/opt/trash/bin:$PATH"
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1

# OrbStack
export DOCKER_DEFAULT_PLATFORM='linux/amd64'

# less
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
mkdir -p "$(dirname "$LESSHISTFILE")"
