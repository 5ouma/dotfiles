_fzf() {
  fzf --border-label "$1" --preview="$2"
}

_git_check() {
  git rev-parse HEAD &>/dev/null && return
}

# bat
_has 'bat' && alias cat='bat'

# dasel
alias dasel='dasel --colour'

# diffastic
alias diff='difft'

# gh-dash
alias ghd='gh-dash'

# ghq
alias gg='ghq get -p'
alias gup='ghq list | ghq get --update --parallel'

gcd() {
  declare -r repo="$(
    ghq list |
      _fzf \
        '🔖 Repositories' \
        "find $(ghq root)/{} -name README.md -maxdepth 2 | head -n 1 | xargs glow --style=auto"
  )"
  [ -n "$repo" ] &&
    cd "$(ghq list --full-path --exact "$repo")" || return
}

# git
alias ga='git forgit add'
alias gb='git branch'
alias gcm!='git commit --no-edit --amend'
alias gcm='git commit'
alias gcf='git config'
alias gcl='git clone'
alias gd='git diff'
alias gin='git init'
alias glg='git log --graph'
alias gm='git merge'
alias gpl='git pull'
alias gps='git push'
alias gr='git remote'
alias grb='git rebase'
alias gs='git status'
alias gst='git stash'
alias gsw='git switch'
alias gswc='git switch -c'

gc() {
  _git_check || return
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
  printf "%s\n\n" "$message"
  if (gum confirm 'Commit changes without editing?'); then
    git commit -m "$message"
  else
    git commit -em "$message"
  fi
}

gbs() {
  _git_check || return
  declare -r branch="$(
    git branch \
      --format=$'%(refname:short)\t%(committerdate:relative)\t%(subject)' |
      column -ts=$'\t' |
      _fzf \
        '🌲 Branches' \
        'git log --format="%C(auto)%h %s" --graph --color=always -100 {1}' |
      cut -d ' ' -f 1
  )"
  [ -n "$branch" ] &&
    git switch "$branch"
}

# gitui
alias gu='gitui'

# glow
alias glow='glow --pager'

# Homebrew
[[ "$(uname)" == 'Darwin' ]] && brew() {
  if (command brew "$@"); then
    if [[ "$1" == 'install' || "$1" == 'uninstall' || "$1" == 'tap' || "$1" == 'untap' ]]; then
      bbd
    fi
  else
    return 1
  fi
}

alias bcl='brew cleanup'
alias bd='brew doctor'
alias bi='brew install'
alias bif='brew info'
alias bl='brew list'
alias bri='brew reinstall'
alias bs='brew search'
alias bsv='brew services'
alias bt='brew tap'
alias bui='brew uninstall --zap'
alias bup='brew update && brew upgrade --greedy'
alias but='brew untap'

bbd() {
  if (brew bundle dump -f --file="$data/Brewfile"); then
    printf '\033[32m==>\033[m \033[;1mHomebrew Bundle complete!\033[m\n'
  else
    printf '\033[31m==>\033[m \033[;1mHomebrew Bundle failed!\033[m\n'
    return 1
  fi
}

# lsd
_has 'lsd' && alias ls='lsd' \
  ll='lsd -l' \
  lt='lsd --tree --ignore-glob={.git,node_modules,.next,.DS_Store}'

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
_has 'trash' && alias rm='trash -F'

# topgrade
alias tg='topgrade'

# Vim
alias v='vim'

# VSCode
alias c.='code .'
alias ci.='code-insiders .'

# yazi
alias yzi='yazi'

# zoxide
zcd() {
  declare -r dir="$(
    zoxide query -l |
      _fzf '📂 Directories' 'lsd -Alg {} --color=always'
  )"
  [ -n "$dir" ] &&
    cd "$dir" || return
}

# System
alias ka='killall'
alias mv='mv -iv'

# Keybinds
bindkey -s '^B' '^Ugbs^M'
bindkey -s '^P' '^Ugcd^M'
bindkey -s '^Y' '^Uyzi^M'
bindkey -s '^Z' '^Uzcd^M'
