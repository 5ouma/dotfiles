# bat
type 'bat' &>/dev/null && alias cat='bat'

# delta
if (type 'delta' &>/dev/null); then
  if [[ "$(uname)" = 'Darwin' ]]; then
    getSyntaxTheme() {
      (defaults read -g AppleInterfaceStyle &>/dev/null) && echo 'ansi' || echo 'GitHub'
    }
    alias diff='delta --syntax-theme=$(getSyntaxTheme)'
    alias git='git -c delta.syntax-theme=$(getSyntaxTheme)'
  else
    alias diff='delta --syntax-theme="GitHub"'
    alias git='git -c delta.syntax-theme="GitHub"'
  fi
fi

# ghq
alias gg='ghq get -p'
alias gup='ghq list | ghq get --update --parallel'

gcd() {
  declare -r repo="$(ghq list | fzf --preview="find $(ghq root)/{} -name README.md -maxdepth 2 | xargs glow --style=auto")"
  [ -n "$repo" ] && cd "$(ghq list --full-path --exact "$repo")"
}

# git
alias ga='git forgit add'
alias gapa='git add -p'
alias gb='git branch'
alias gc!='git commit --no-edit --amend'
alias gc='git commit'
alias gcf='git config'
alias gcl='git clone'
alias gd='git diff'
alias gdt='git difftool'
alias gin='git init'
alias glg='git log --graph'
alias gls='git ls-files'
alias gm='git merge'
alias gop='git open'
alias gpl='git pull origin'
alias gps='git push origin'
alias gr='git remote'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grm='git rm'
alias grmc='git rm --cached'
alias grs='git restore'
alias grss='git restore -S'
alias grv='git remote -v'
alias gs='git status'
alias gst='git stash'
alias gsw='git switch'
alias gswc='git switch -c'
alias gtg='git tag'

gc2() {
  (git commit --dry-run &>/dev/null) || return
  declare message=''
  declare -r types=(
    'feat: A new feature'
    'fix: A bug fix'
    'docs: Documentation only changes'
    'style: Changes that do not affect the meaning of the code'
    'refactor: A code change that neither fixes a bug nor adds a feature'
    'perf: A code change that improves performance'
    'test: Adding missing tests or correcting existing tests'
    'build: Changes that affect the build system or external dependencies'
    'ci: Changes to our CI configuration files and scripts'
    "chore: Other changes that don't modify src or test files"
    'revert: Reverts a previous commit'
  )
  declare -r type="$(gum choose "${types[@]}" --height=11 | cut -d ':' -f 1)" && message+="$type"
  [ -z "$type" ] && return 1
  declare -r scope="$(gum input --placeholder='A commit type to provide additional contextual information' --prompt="$message(")" && message+="($scope): "
  [ -z "$scope" ] && return 1
  declare -r description="$(gum input --placeholder='A short summary of the code changes' --prompt="$message")" && message+="$description"
  [ -z "$description" ] && return 1
  declare -r body="$(gum input --placeholder='Additional contextual information about the code changes' --header="$message" --char-limit=80 --width=80)" && message+=$'\n'$'\n'"$body"
  [ -z "$body" ] && return 1
  printf "%s\n" "$message"
  if (gum confirm 'Commit changes without editing?'); then
    git commit -m "$message"
  else
    git commit -em "$message"
  fi
}

# gitsu
alias gsi='git-su init'
alias gss='git-su select'

# gitui
alias gu='gitui'

# Glow
alias glow='glow -p'

# Homebrew
[ "$(uname)" = 'Darwin' ] && brew() {
  if (command brew "$@"); then
    if [[ "$1" = 'install' || "$1" = 'uninstall' || "$1" = 'tap' || "$1" = 'untap' ]]; then
      bbd
    fi
  else
    return 1
  fi
}

alias bbcp='brew bump-cask-pr'
alias bbfp='brew bump-formula-pr'
alias bcl='brew cleanup'
alias bd='brew doctor'
alias bi='brew install'
alias bif='brew info'
alias bl='brew list'
alias bri='brew reinstall'
alias bs='brew search'
alias bt='brew tap'
alias bui='brew uninstall --zap'
alias bup='brew update && brew upgrade'
alias but='brew untap'

bbd() {
  if (brew bundle dump -f --file="$data/Brewfile" --{tap,formula,cask,mas}); then
    printf '\033[32m==>\033[m \033[;1mHomebrew Bundle complete!\033[m\n'
  else
    printf '\033[31m==>\033[m \033[;1mHomebrew Bundle failed!\033[m\n'
    return 1
  fi
}

# lsd
type 'lsd' &>/dev/null && alias ls='lsd -A' ll='lsd -Alg' lt='lsd -A --tree --ignore-glob={.git,node_modules,.next,.DS_Store}'

# mas
alias mi='mas install'
alias ml='mas list'
alias ms='mas search'
alias mui='mas uninstall'
alias mup='mas upgrade'

# pre-commit
pre-commit() {
  if [[ "$1" != 'clean' && "$1" != 'gc' && "$1" != 'help' ]]; then
    command pre-commit "$@" -c="$data/pre-commit.yml"
  else
    command pre-commit "$@"
  fi
}

# trash
type 'trash' &>/dev/null && alias rm='trash -F'

# tokei
alias tokei='tokei -f'

# topgrade
alias tg='topgrade'

# Vim
alias v='vim'

# VSCode
alias c.='code .'
alias ci.='code-insiders .'

# yazi
alias yzi='yazi'

# System
alias ka='killall'
alias mv='mv -iv'
