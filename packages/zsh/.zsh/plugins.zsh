# Homebrew
export HOMEBREW_AUTOREMOVE=1

# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[ -f "$ZDOTDIR/.p10k.zsh" ] && source "$ZDOTDIR/.p10k.zsh"

# forgit
export -r FORGIT_NO_ALIASES=1

# Gum
export -r GUM_CONFIRM_SELECTED_BACKGROUND="33"
export -r GUM_CHOOSE_CURSOR_FOREGROUND="33"
export -r GUM_SPIN_SPINNER_FOREGROUND="33"

# zsh-you-should-use
export -r YSU_MESSAGE_FORMAT="💡 $(tput setaf 6)%alias$(tput sgr0)"
