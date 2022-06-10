# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"
#========================================================[ Powerlevel10k ]========================================================#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

#===========================================================[ Settings ]===========================================================#

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cdを省略してディレクトリ移動
setopt auto_cd

# コマンドのスペルをミスして実行した場合に候補を表示
setopt correct

# 補完候補にファイルの種類も表示する
setopt list_types

# 補完候補をカーソルで選択
zstyle ':completion:*:default' menu select=1

# Shift-Tabで補完候補を逆順する
bindkey "^[[Z" reverse-menu-complete

## ls実行時ファイル色分け
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 新しくインストールされたコマンドをすぐに認識させる
zstyle ":completion:*:commands" rehash 1

# コマンドラインスタック
show_buffer_stack() {
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stack


#===========================================================[ Plugins ]===========================================================#

# Alias Tips
 export ZSH_PLUGINS_ALIAS_TIPS_TEXT=" 💡 "

#==============================================================[ Paths ]==============================================================#

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
