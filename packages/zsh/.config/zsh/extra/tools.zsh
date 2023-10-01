# Sheldon
eval "$(sheldon source)"

# Atuin
zsh-defer eval "$(atuin init zsh --disable-up-arrow)"

# OrbStack
zsh-defer source "$HOME/.orbstack/shell/init.zsh" 2>/dev/null

# rtx
eval "$(rtx activate -q zsh)"

# zoxide
zsh-defer eval "$(zoxide init zsh --cmd=j)"
