# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"

#============================================================[ Aliases & Functions ]============================================================#

has() {
  type "$1" >/dev/null 2>&1
}

# bat
has 'bat' && alias cat='bat'

# delta
if (has 'delta'); then
  alias diff='delta --syntax-theme=$(defaults read -g AppleInterfaceStyle >/dev/null 2>&1 && echo "ansi" || echo "GitHub")'
  alias git='git -c delta.syntax-theme=$(defaults read -g AppleInterfaceStyle >/dev/null 2>&1 && echo "ansi" || echo "GitHub")'
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
alias gc='git commit'
alias gc!='git commit --no-edit --amend'
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

# gitsu
alias gsi='git-su init'
alias gss='git-su select'

# gitui
alias gu='gitui'

# Glow
alias glow='glow -p'

# Gum
gcg() {
  (git commit --dry-run >/dev/null 2>&1) || return
  declare -r types=(
    'fix : Fix bugs'
    'hotfix : Fix critical bugs'
    'add : Add new files or features'
    'update : Update functions'
    'change : Change specification'
    'clean : Clean or refactor'
    'disable : Disable functions'
    'remove : Remove files'
    'upgrade : Upgrade versions'
    'revert : Revert changes'
  )
  declare -r type="$(gum choose "${types[@]}" | awk '{print $1}')" && [ -z "$type" ] && return
  declare -r summary="$(gum input --prompt="[$type] " --placeholder='Summary of this change')" && [ -z "$summary" ] && return
  declare -r description="$(gum input --header="[$type] $summary" --placeholder='Details of this change')" && [ -z "$description" ] && return
  if (gum confirm 'Commit changes without editing?'); then
    git commit -m "[$type] $summary" -m "$description"
  else
    git commit -e -m "[$type] $summary" -m "$description"
  fi
}

# Homebrew
brew() {
  if (command brew "$@") && [[ "$1" = 'install' || "$1" = 'uninstall' || "$1" = 'tap' || "$1" = 'untap' ]]; then
    bbd
  fi
}

alias bcl='brew cleanup'
alias bd='brew doctor'
alias bi='brew install'
alias bif='brew info'
alias bl='brew list'
alias bri='brew reinstall'
alias bs='brew search'
alias bt='brew tap'
alias bup='brew update && brew upgrade'
alias bui='brew uninstall'
alias but='brew untap'

bbd() {
  printf '\033[32;1m==>\033[m \033[1mCreating Brewfile\033[m\n'
  brew bundle dump -f --file="$datas/Brewfile" --{tap,formula,cask,mas}
  printf '🍺 Brewfile was successfully generated!\n'
}

# lporg
alias lps='lporg save -c "$datas/launchpad.yaml" >/dev/null 2>&1'
alias lpl='lporg load -n "$datas/launchpad.yaml" >/dev/null 2>&1'

# lsd
has 'lsd' && alias ls='lsd -A' ll='lsd -Al' lt='lsd -A --tree --ignore-glob=.git'

# Macup
alias mb='mackup -f backup'

# mas
alias mi='mas install'
alias ml='mas list'
alias ms='mas search'
alias mui='mas uninstall'
alias mup='mas upgrade'

# trash
has 'trash' && alias rm='trash -F'

# tokei
alias tokei='tokei -f'

# topgrade
alias tg='topgrade'

# Vim
alias v='vim'
alias vup='vim +Jetpack +qall'

# VSCode
alias c.='code .'
alias ci.='code-insiders .'

# System
alias ka='killall'
alias mv='mv -iv'

unset -f has

#============================================================[ Paths ]============================================================#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
