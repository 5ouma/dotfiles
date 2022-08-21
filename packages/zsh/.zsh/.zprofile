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
alias go="git open"
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

# Homebrew
brew() {
  if command brew "$@"; then
    if [[ "$1" = "install" || "$1" = "uninstall" || "$1" = "rmtree" || "$1" = "tap" || "$1" = "untap" ]]; then
      echo "\033[32;1m==>\033[m \033[1mCreating Brewfile\033[m"
      brew bundle dump -f --file="$dotfiles"/data/Brewfile
      # Not to install Xcode
      sed -i "" "s/mas \"Xcode\"/# mas \"Xcode\"/g" "$dotfiles"/data/Brewfile
      echo "🍺  Brewfile was successfully generated!"
    fi
  fi
}

bbd() {
  brew bundle dump -f --file="$dotfiles"/data/Brewfile
  # Not to install Xcode
  sed -i "" "s/mas \"Xcode\"/# mas \"Xcode\"/g" "$dotfiles"/data/Brewfile
}
alias bcl="brew cleanup"
alias bd="brew doctor"
alias bi="brew install"
alias bif="brew info"
alias bl="brew list"
alias bri="brew reinstall"
alias bs="brew search"
alias bt="brew tap"
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
alias bup="brew update && brew upgrade"
alias but="brew untap"
alias bv="brew -v"

alias mi="mas install"
alias ml="mas list"
alias ms="mas search"
alias mum="mas uninstall"
alias mup="mas upgrade"

al() {
  indent="  "
  echo "\033[34;1m==>\033[m \033[1mFormulae\033[m"
  brew list --formulae --version |
    while IFS= read -r line; do
      echo "$indent$line"
    done

  echo -e "\n\033[34;1m==>\033[m \033[1mCasks\033[m"
  brew list --cask --version |
    while IFS= read -r line; do
      echo "$indent$line"
    done

  echo -e "\n\033[34;1m==>\033[m \033[1mmas\033[m"
  mas list |
    while IFS= read -r line; do
      echo "$indent$line"
    done
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
alias update="brew update && brew upgrade && vim +Jetpack +qall && asdf plugin-update --all"

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
