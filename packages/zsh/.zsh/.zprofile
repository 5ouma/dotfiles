# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"
#============================================================[ Aliases ]============================================================#

# git
alias ga="git forgit add"
alias gapa="git add -p"
alias gb="git branch"
alias gc!="git commit -v --no-edit --amend"
alias gc="git commit -v"
alias gcf="git config"
alias gcl="git clone --recurse-submodules"
alias gd="git diff"
alias gdt="git difftool"
alias gin="git init"
alias glg="git log --graph --decorate --all"
alias gls="git ls-files"
alias gop="git open"
alias gpl="git pull origin"
alias gps="git push origin"
alias gr="git remote"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbs="git rebase --skip"
alias grm="git rm"
alias grmc="git rm --cached"
alias grs="git restore"
alias grss="git restore -S"
alias grv="git remote -v"
alias gs="git status"
alias gsm="git submodule"
alias gsw="git switch"
alias gswc="git switch -c"
alias gtg="git tag"

gcv() {
  git config core.editor "vim"
  git commit -v "$@"
  git config core.editor "code --wait"
}

# forgit
alias gflg="git forgit log"
alias gfd="git forgit diff"
alias gfrh="git forgit reset HEAD"

# gitsu
alias gsi="git-su init"
alias gss="git-su select"

# ghq
alias gg="ghq get"
alias gup="ghq list | ghq get --update --parallel"

gcd() {
  local repo
  repo=$(ghq list | fzf --preview="if [[ -e $(ghq root)/{}/README.md ]]; then glow $(ghq root)/{}/README.md; else bat --theme=ansi --color=always --style=header,grid --line-range :300 $(ghq root)/{}/*; fi")
  if [[ -n "$repo" ]]; then
    cd "$(ghq list --full-path --exact "$repo")" || return
  fi
}

# Homebrew
brew() {
  if command brew "$@"; then
    if [[ "$1" = "install" || "$1" = "uninstall" || "$1" = "tap" || "$1" = "untap" ]]; then
      echo "\033[32;1m==>\033[m \033[1mCreating Brewfile\033[m"
      bbd
      echo "🍺  Brewfile was successfully generated!"
    fi
  fi
}

alias bcl="brew cleanup"
alias bd="brew doctor"
alias bi="brew install"
alias bif="brew info"
alias bl="brew list"
alias bri="brew reinstall"
alias bs="brew search"
alias bt="brew tap"
alias bup="brew update && brew upgrade"
alias but="brew untap"
alias bun="brew uninstall"
alias bv="brew -v"

bbd() {
  while true; do
    brew bundle dump -f --file="$dotfiles/data/Brewfile"
    grep -q "mas " "$dotfiles/data/Brewfile" && break
  done
}

# mas
alias mi="mas install"
alias ml="mas list"
alias ms="mas search"
alias mun="mas uninstall"
alias mup="mas upgrade"

al() {
  echo "\033[34;1m==>\033[m \033[1mFormulae\033[m"
  while read -r line; do
    echo "  $line"
  done < <(brew list --formulae --version)
  echo -e "\n\033[34;1m==>\033[m \033[1mCasks\033[m"
  while read -r line; do
    echo "  $line"
  done < <(brew list --cask --version)
  echo -e "\n\033[34;1m==>\033[m \033[1mmas\033[m"
  while read -r line; do
    echo "  $line"
  done < <(mas list)
}

# bat
if type bat >/dev/null 2>&1; then
  alias cat="bat --theme=ansi"
fi

# doctors
alias doctor="brew doctor && fig doctor"

# Fig
alias fd="fig doctor"
alias fg="fig source"

# Glow
alias glow="glow -p"

# lporg
alias lps="lporg save -c $dotfiles/data/launchpad.yaml >/dev/null 2>&1"
alias lpl="lporg load -n $dotfiles/data/launchpad.yaml >/dev/null 2>&1"

# lsd
if type lsd >/dev/null 2>&1; then
  alias ls="lsd -A --ignore-glob=\".DS_Store\""
  alias tree="lsd -A --tree --ignore-glob=\".DS_Store\" --ignore-glob=\".git\""
fi

# Macup
alias mb="mackup -f backup"

# trash
if type trash >/dev/null 2>&1; then
  alias rm="trash -F"
fi

# tokei
alias tokei="tokei -f"

# topgrade
alias tg="topgrade"

# Vim
alias v="vim"
alias vup="vim +Jetpack +qall"

# VSCode
alias c.="code ."
alias ci.="code-insiders ."

# System
alias ka="killall"
alias mv="mv -i -v"

# memo
alias mgc="memo git change"
alias mgm="memo git message"
alias mgfp="memo git force pull"
alias mgfr="memo git force reset"

#============================================================[ Paths ]============================================================#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
