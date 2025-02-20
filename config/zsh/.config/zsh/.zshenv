# Lang
export LANG='en_US.UTF-8'

# Homebrew
if [[ "$(uname)" == 'Darwin' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export HOMEBREW_BUNDLE_BREW_SKIP='5ouma/formula/mksei 5ouma/formula/mli blacktop/tap/lporg lslqtz/formulae/bclm_loop'
fi

# dotfiles
export dotfiles="$HOME/.dotfiles"
export data="$dotfiles/data"
export PATH="$dotfiles:$PATH"

# Go
export GOPATH="$XDG_CACHE_HOME/go"

# mise
export PATH="$HOME/.local/share/mise/shims:$PATH"
