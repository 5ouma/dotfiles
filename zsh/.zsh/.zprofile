# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zprofile.pre.zsh"

#============================================================[ Aliases ]============================================================#

# tree
alias tree-default="tree"
alias tree="tree -a -L 2 -h --si -F -A -C"

# git
alias gin="git init"
alias gck="git checkout"
alias grmt="git remote"
alias gcl="git clone"
alias gap="git add -p"
alias ga="git add"
alias grm="git rm"
alias grs="git reset"
alias gc="git commit"
alias gps="git push origin"
alias grb="git rebase"
alias gpl="git pull origin"
alias gs="git status"
alias gls="git ls-files"
alias glg="git log —oneline"
alias gcg="git config"


g-5ouma() {
  git config user.name "5ouma"
  git config user.email "101255979+5ouma@users.noreply.github.com"
  git config user.name
  git config user.email
}

g-Souma-S() {
  git config user.name "Souma-S"
  git config user.email "102800255+Souma-S@users.noreply.github.com"
  git config user.name
  git config user.email
}


# Notion内のメモ表示
alias memo-commitChange="echo \"1. \e[31;1mgit\e[m rebase -i HEAD~n
2. \e[31;1mpick\e[m を \e[31;1mreword\e[m に書き換える
3. \e[31;1mgit\e[m rebase --edit-todo
   \e[31;1mgit\e[m rebase --continue
4. \e[31;1mgit\e[m push --force origin main
\""
alias notion-commitChange="open notion://www.notion.so/soumas-note/GitHub-774dca1e18844e31b7aa47deaefa67a7"

alias notion-gitCommand="open notion://www.notion.so/soumas-note/Git-c190039953a846d08f20554345103a6b"

alias memo-commitMessage="echo -e \"・\e[34;1mfix\e[m    ：バグ修正
・\e[34;1mhotfix\e[m ：クリティカルなバグ修正
・\e[34;1madd\e[m    ：新規(ファイル)機能追加
・\e[34;1mupdate\e[m ：機能修正(バグではない)
・\e[34;1mchange\e[m ：仕様変更
・\e[34;1mclean\e[m  ：整理(リファクタリング等)
・\e[34;1mdisable\e[m：無効化(コメントアウト等)
・\e[34;1mremove\e[m ：削除(ファイル)
・\e[34;1mupgrade\e[m：バージョンアップ
・\e[34;1mrevert\e[m ：変更取り消し\""
alias notion-commitMessage="open notion://www.notion.so/soumas-note/Git-aeb85626154243048e7c3337d42b7989"


# Homebrew
alias bi="brew install"
alias bri="brew reinstall"
alias bun="brew uninstall"
alias bup="brew update && brew upgrade"
alias bs="brew search"
alias bif="brew info"
alias bl="brew list"
alias bv="brew -v"
alias bd="brew doctor"
alias bbd="brew bundle dump"

alias mi="mas install"
alias mum="mas uninstall"
alias mup="mas upgrade"
alias ms="mas search"
alias ml="mas list"

# Fig
alias fd="fig doctor"
alias fg="fig source"

# System
alias ka="killall"

#============================================================[ Paths ]============================================================#

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zprofile.post.zsh"
