#============================================================[ Paths ]============================================================#

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Vim
export VIMRC=$HOME/.vim/.vimrc
export VIMINIT="source $VIMRC"

# Nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# memo
export PATH=$HOME/.dotfiles/Commands/memo:$PATH

# notion
export PATH=$HOME/.dotfiles/Commands/notion:$PATH

# 日本語を使用
export LANG=ja_JP.UTF-8

#============================================================[ History ]============================================================#

# 履歴ファイルの保存先
export HISTFILE=$HOME/.zsh/.zsh_history

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

# Tabでの選択時黒枠を追加
autoload -Uz compinit
compinit -d $HOME/.zsh/.zcompdump

# 入力した文字から始まるコマンドを履歴から検索し、上下矢印で補完
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
