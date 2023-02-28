# Homebrew
export HOMEBREW_AUTOREMOVE=1

# Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of "$ZDOTDIR"/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[ -f "$ZDOTDIR/.p10k.zsh" ] && source "$ZDOTDIR/.p10k.zsh"

# forgit
export -r FORGIT_NO_ALIASES=1

# Gum
export GUM_CONFIRM_SELECTED_BACKGROUND="33"
export GUM_CHOOSE_CURSOR_FOREGROUND="33"
export GUM_SPIN_SPINNER_FOREGROUND="33"

# zsh-you-should-use
export -r YSU_MESSAGE_FORMAT="💡 $(tput setaf 6)%alias$(tput sgr0)"
