# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dots/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.dots/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.dots/zsh/.p10k.zsh.
[[ ! -f ~/.dots/zsh/.p10k.zsh ]] || source ~/.dots/zsh/.p10k.zsh



# 日本語を使用
export LANG=ja_JP.UTF-8

# cdを省略してディレクトリ移動
setopt auto_cd

# コマンドのスペルをミスして実行した場合に候補を表示
setopt correct

#ls実行時ファイル色分け
export CLICOLOR=1

# zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi