# Sheldon
eval "$(sheldon source)"

# Atuin
# shellcheck disable=SC2016
zsh-defer -c 'eval "$(atuin init zsh --disable-up-arrow)"'

# mise
eval "$(mise activate -q zsh)"

# OrbStack
zsh-defer source "$HOME/.orbstack/shell/init.zsh"

# zoxide
# shellcheck disable=SC2016
zsh-defer -c 'eval "$(zoxide init zsh --cmd=cd)"'
