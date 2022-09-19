# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && . "$HOME/.fig/shell/zprofile.pre.zsh"

#============================================================[ Aliases ]============================================================#

# git
alias ga="git forgit add"
alias gapa="git add -p"
alias gb="git branch"
alias gc!="git commit -v --no-edit --amend"
alias gc="git commit -v"
alias gcb="git checkout -b"
alias gcf="git config"
alias gcl="git clone --recurse-submodules"
alias gco="git checkout"
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
alias grh="git reset"
alias grm="git rm"
alias grmc="git rm --cached"
alias grs="git restore"
alias grv="git remote -v"
alias gs="git status"
alias gsm="git submodule"
alias gsw="git switch"
alias gswb="git switch -b"
alias gtg="git tag"

gcv() {
  git config core.editor "vim"
  git commit -v "$@"
  git config core.editor "code --wait"
}

g-5ouma() {
  git config user.name "5ouma"
  git config user.email "101255979+5ouma@users.noreply.github.com"
  echo "name: $(git config user.name)"
  echo "email: $(git config user.email)"
}

g-Souma-S() {
  git config user.name "Souma-S"
  git config user.email "102800255+Souma-S@users.noreply.github.com"
  echo "name: $(git config user.name)"
  echo "email: $(git config user.email)"
}

# forgit
alias gflg="git forgit log"
alias gfd="git forgit diff"
alias gfrh="git forgit reset HEAD"

# ghq
gcd() {
  local repo
  repo=$(ghq list | fzf)
  if [[ -n "$repo" ]]; then
    cd "$(ghq list --full-path --exact "$repo")" || return
  fi
}

alias gup="ghq list | ghq get --update --parallel"


# Homebrew
brew() {
  if command brew "$@"; then
    if [[ "$1" = "install" || "$1" = "uninstall" || "$1" = "rmtree" || "$1" = "tap" || "$1" = "untap" ]]; then
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
alias bv="brew -v"

bbd() {
  while true; do
    brew bundle dump -f --file="$dotfiles"/data/Brewfile
    sed -i "" "s/mas \"Xcode\"/# mas \"Xcode\"/g" "$dotfiles"/data/Brewfile
    grep -q "mas " "$dotfiles"/data/Brewfile && break
  done
}

bun() {
  for pack in "$@"; do
    packType=$(brew info "$pack")
    if [[ "$packType" =~ "Formula" ]]; then
      brew rmtree "$pack"
    else
      brew uninstall "$pack"
    fi
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


# VSCode
alias c.="code ."

# bat
if type bat > /dev/null 2>&1; then
  alias cat="bat --theme=ansi"
fi

# doctors
alias doctor="brew doctor && fig doctor"

# Fig
alias fd="fig doctor"
alias fg="fig source"

# Glow
alias glow="glow -p"

# lsd
if type lsd > /dev/null 2>&1; then
  alias ls="lsd -A --ignore-glob=\".DS_Store\""
  alias tree="lsd -A --tree --depth=3 --ignore-glob=\".DS_Store\""
fi

# trash
if type trash > /dev/null 2>&1; then
  alias rm="trash -F"
fi

# tokei
alias tokei="tokei -f"

# Vim
alias v="vim"
alias vup="vim +Jetpack +qall"

vim() {
  if [[ $1 = "-f" ]]; then
    command vim "$(find ~ | fzf --preview "bat --theme=ansi --color=always --style=header,grid --line-range :300 {}")"
  else
    command vim "$@"
  fi
}

# update
update() {
  echo "\033[34;1m==>\033[m \033[1mHomebrew\033[m"
    brew update && brew upgrade
  vim +Jetpack +qall
  echo "\033[34;1m==>\033[m \033[1masdf\033[m"
    asdf plugin-update --all
  echo "\033[34;1m==>\033[m \033[1mghq\033[m"
    ghq list | ghq get --update --parallel
}

# System
alias ka="killall"
alias mv="mv -i -v"

# memo
alias mgc="memo git change"
alias mgm="memo git message"
alias mgfp="memo git force pull"
alias mgfr="memo git force reset"
alias mgca="memo git cancel add"
alias mgcc="memo git cancel commit"

alias ngl="notion git list"

#============================================================[ Paths ]============================================================#

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && . "$HOME/.fig/shell/zprofile.post.zsh"
