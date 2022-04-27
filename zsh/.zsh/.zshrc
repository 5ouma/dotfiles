# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme


# Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH


# 日本語を使用
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cdを省略してディレクトリ移動
setopt auto_cd

# コマンドのスペルをミスして実行した場合に候補を表示
setopt correct

# 入力した文字から始まるコマンドを履歴から検索し、上下矢印で補完
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# 補完候補にファイルの種類も表示する
setopt list_types

# 補完候補をカーソルで選択
zstyle ':completion:*:default' menu select=1

# Shift-Tabで補完候補を逆順する
bindkey "^[[Z" reverse-menu-complete

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000

# 同時に起動しているzshの間でhistoryを共有する
setopt share_history

# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
setopt hist_ignore_all_dups


##ls実行時ファイル色分け
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi




## エイリアス

# tree
alias tree-default="tree"
alias tree="tree -a -L 2 -h --si -F -A -C"

# git
alias gin="git init"
alias gck="git checkout"
alias grm="git remote"
alias ga="git add"
alias gc="git commit"
alias gps="git push origin"
alias gcl="git clone"
alias gpl="git pull origin"
alias gs="git status"
alias gl="git log --oneline"
alias gcg="git config"
alias grs="git reset"

grp() {
  echo -n "Are you sure to run? (y/n): "
  read -q && echo "" || {echo "" && exec $SHELL}

  git reset --hard HEAD^
  git push -f $1
}

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
alias bun="brew uninstall"
alias bup="brew update && brew upgrade"
alias bs="brew search"
alias bl="brew list"
alias bv="brew -v"
alias bd="brew doctor"
alias bbd="brew bundle dump"

alias mi="mas install"
alias mum="mas uninstall"
alias mup="mas upgrade"
alias ms="mas search"
alias ml="mas list"

al() {
  echo "\e[1m[Formulae & Cask]:\e[m"
  indent="  "
  brew list --version |
    while IFS= read -r line; do
      echo -e "$indent$line"
    done
  echo "\e[1m---------------------------------------------------------\e[m"
  echo "\e[1m[mas]:\e[m"
  mas list |
    while IFS= read -r line; do
        echo -e "$indent$line"
    done
}

# Setting files
alias cz="code .zsh/.zshrc"
alias ct="code .shell-files"

# System
alias ka="killall"
