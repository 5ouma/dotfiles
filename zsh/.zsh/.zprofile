# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zprofile.pre.zsh"

export dotfiles=${HOME}/.dotfiles

#============================================================[ Aliases ]============================================================#

# tree
alias tree-default="tree"
alias tree="tree -a -L 2 -h --si -F -A -C"

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
        echo "\033[34;1m==>\033[m \033[1mRemoving files:\033[m
/Applications/RealTimeSync.app"
        sudo rm -r /Applications/RealTimeSync.app
      fi
      if [ $arg = "install" ] || [ $arg = "uninstall" ] || [ $arg = "rmtree" ] || [ $arg = "tap" ] || [ $arg = "untap" ]; then
        echo "\033[32;1m==>\033[m \033[1mCreating Brewfile\033[m"
        brew bundle dump -f
        # Xcodeをインストールしないようにする
        sed -i "" "s/mas \"Xcode\"/# mas \"Xcode\"/g" Brewfile
        # dotfiles/Setupディレクトリ内なら実行しない
        if [[ $(echo `pwd` | sed -e "s/\/Users\/souma/~/g") != "$dotfiles/Setup" ]]; then
          echo "\033[34;1m==>\033[m \033[1mMoving Brewfile to '$dotfiles/Setup'\033[m"
          mv -f Brewfile $dotfiles/Setup
        fi
        echo "🍺  Brewfile was successfully generated!"
      fi
    done
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

# System
alias ka="killall"
alias ls="ls -a"

# Notion内のメモ表示
alias memo-commitChange="echo \"1. \033[31;1mgit\033[m rebase -i HEAD~n
2. \033[31;1mpick\033[m を \033[31;1medit\033[m もしくは \033[31;1mreword\033[m  に書き換える
3. \033[31;1mgit commit --amend\033[m で変更
   (\033[31;1mgit\033[m rebase --edit-todo で指定し直し)
4. \033[31;1mgit\033[m rebase --continue
5. \033[31;1mgit\033[m push --force origin main
\""
alias notion-commitChange="open notion://www.notion.so/soumas-note/GitHub-774dca1e18844e31b7aa47deaefa67a7"

alias notion-gitCommand="open notion://www.notion.so/soumas-note/Git-c190039953a846d08f20554345103a6b"

alias memo-commitMessage="echo \"・\033[34;1mfix\033[m    ：バグ修正
・\033[34;1mhotfix\033[m ：クリティカルなバグ修正
・\033[34;1madd\033[m    ：新規(ファイル)機能追加
・\033[34;1mupdate\033[m ：機能修正(バグではない)
・\033[34;1mchange\033[m ：仕様変更
・\033[34;1mclean\033[m  ：整理(リファクタリング等)
・\033[34;1mdisable\033[m：無効化(コメントアウト等)
・\033[34;1mremove\033[m ：削除(ファイル)
・\033[34;1mupgrade\033[m：バージョンアップ
・\033[34;1mrevert\033[m ：変更取り消し\""
alias notion-commitMessage="open notion://www.notion.so/soumas-note/Git-aeb85626154243048e7c3337d42b7989"

#============================================================[ Paths ]============================================================#

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zprofile.post.zsh"
