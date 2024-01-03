# Sheldon
eval "$(sheldon source)"

# Atuin
zsh-defer eval "$(atuin init zsh --disable-up-arrow)"

# mise
eval "$(mise activate -q zsh)"

# OrbStack
zsh-defer source "$HOME/.orbstack/shell/init.zsh"

# zoxide
zsh-defer eval "$(zoxide init zsh --cmd=j)"
