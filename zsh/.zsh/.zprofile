# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zprofile.pre.zsh"

export dotfiles=${HOME}/.dotfiles

#============================================================[ Aliases ]============================================================#

# git
alias gin="git init"
alias gck="git checkout"
alias grmt="git remote"
alias gcl="git clone"
alias grst="git restore"
alias gd="git difftool"
alias ga="git add"
alias gap="git add -p"
alias grm="git rm"
alias grs="git reset"
grp() {
  echo -n "Are you sure to run? (y/n): "
  read -q && echo "" || {echo "" && exec $SHELL}

  git reset --hard HEAD^
  git push -f $@
}
alias gc="git commit"
alias gps="git push origin"
alias grb="git rebase"
alias gpl="git pull origin"
alias gs="git status"
alias gls="git ls-files"
alias glg="git log --oneline"
alias gcg="git config"

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

# Homebrew
brew(){
  command brew $@
  if [ $? = 0 ]; then
    for arg in "$@"; do
      if [ -e /Applications/RealTimeSync.app ] && [ $arg = "freefilesync" ]; then
        echo "\033[34;1m==>\033[m \033[1mRemoving files:\033[m"
        echo "/Applications/RealTimeSync.app"
        sudo rm -r /Applications/RealTimeSync.app
      fi
      if [ $arg = "install" ] || [ $arg = "uninstall" ] || [ $arg = "rmtree" ] || [ $arg = "tap" ] || [ $arg = "untap" ]; then
        echo "\033[32;1m==>\033[m \033[1mCreating Brewfile\033[m"
        brew bundle dump -f
        # Xcodeをインストールしないようにする
        sed -i "" "s/mas \"Xcode\"/# mas \"Xcode\"/g" Brewfile
        # dotfiles/Setupディレクトリ内なら実行しない
        if [[ $(echo `pwd`) != "$dotfiles/Setup" ]]; then
          echo "\033[34;1m==>\033[m \033[1mMoving Brewfile to '$dotfiles/Setup'\033[m"
          mv -f Brewfile $dotfiles/Setup
        fi
        echo "🍺  Brewfile was successfully generated!"
      fi
    done
  fi
}

make(){
  if [ $1 = "Brewfile" ]; then
    echo "\033[32;1m==>\033[m \033[1mCreating Brewfile\033[m"
    brew bundle dump -f
    # Xcodeをインストールしないようにする
    sed -i "" "s/mas \"Xcode\"/# mas \"Xcode\"/g" Brewfile
    # dotfiles/Setupディレクトリ内なら実行しない
    if [[ $(echo `pwd`) != "$dotfiles/Setup" ]]; then
      echo "\033[34;1m==>\033[m \033[1mMoving Brewfile to '$dotfiles/Setup'\033[m"
      mv -f Brewfile $dotfiles/Setup
    fi
    echo "🍺  Brewfile was successfully generated!"
  fi
}

alias bi="brew install"
alias bri="brew reinstall"
alias bun="brew uninstall"
alias br="brew rmtree"
alias bt="brew tap"
alias but="brew untap"
alias bup="brew update && brew upgrade"
alias bs="brew search"
alias bif="brew info"
alias bl="brew list"
alias bv="brew -v"
alias bd="brew doctor"
alias bcl="brew cleanup"
alias bbd="brew bundle dump"

alias mi="mas install"
alias mum="mas uninstall"
alias mup="mas upgrade"
alias ms="mas search"
alias ml="mas list"

al() {
  indent="  "
  echo "\033[34;1m==>\033[m \033[1mFormulae\033[m"
  brew list --formulae --version |
    while IFS= read -r line; do
      echo "$indent$line"
    done

  echo "\n\033[34;1m==>\033[m \033[1mCasks\033[m"
  brew list --cask --version |
    while IFS= read -r line; do
      echo "$indent$line"
    done

  echo "\n\033[34;1m==>\033[m \033[1mmas\033[m"
  mas list |
    while IFS= read -r line; do
        echo "$indent$line"
    done
}

# Fig
alias fd="fig doctor"
alias fg="fig source"

# Vim
alias v="vim"

# lsd
alias ls="lsd -a"
alias tree="lsd -a --tree --depth 3"

# ccat
alias cat="ccat"

# Glow
alias glow="glow -p"

# System
alias ka="killall"

# メモを表示
alias mgc="memo git change"
alias mgm="memo git message"
alias mgfp="memo git force pull"
alias mgca="memo git cancel add"
alias mgcc="memo git cancel commit"

alias ngl="notion git list"

#============================================================[ Paths ]============================================================#

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zprofile.post.zsh"
