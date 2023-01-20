#!/usr/bin/env zsh

# Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of "$ZDOTDIR"/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# forgit
export FORGIT_NO_ALIASES=1

# zsh-you-should-use
export YSU_MESSAGE_FORMAT="💡 $(tput setaf 6)%alias$(tput sgr0)"
