export LANG='en_US.UTF-8'

_has() {
  type "$1" &>/dev/null
}

_run() {
  if (_has "$1"); then
    "$@"
  else
    printf '\033[33;1mSkipped\033[m\n'
  fi
}

# dotfiles
export dotfiles="$HOME/.dotfiles"
export data="$dotfiles/data"
export PATH="$dotfiles:$PATH"

# Go
export GOPATH="$XDG_CACHE_HOME/go"

# mise
export PATH="$HOME/.local/share/mise/shims:$PATH"
