# Lang
export LANG='en_US.UTF-8'

# Homebrew
if [[ "$(uname)" = 'Darwin' ]]; then
  [ $(uname -m) = 'x86_64' ] && eval "$(/usr/local/bin/brew shellenv)"
  [ $(uname -m) = 'arm64' ] && eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export HOMEBREW_BUNDLE_BREW_SKIP='5ouma/formula/mksei blacktop/tap/lpor'
fi

# 1Password
source "$XDG_CONFIG_HOME/op/plugins.sh"

# dotfiles
export dotfiles="$HOME/.dotfiles"
export datas="$dotfiles/datas"
export PATH="$dotfiles:$PATH"
