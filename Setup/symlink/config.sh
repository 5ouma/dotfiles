#!/bin/zsh

dotfiles=$HOME/.dotfiles
config="$dotfiles"/packages/config

moveBackup() {
  if [[ ! -e "$dotfiles"/backup ]]; then
    mkdir -p "$dotfiles"/backup
  fi
  mv "$1" "$dotfiles"/backup/
}

while read -r dir; do
  configDir=~/.config/$(basename "$dir")
  if [[ ! -e "$configDir" ]]; then
    mkdir -p "$configDir"
  fi
  if [[ "$(basename "$dir")" = "yarn" ]]; then
    if [[ ! -e ~/.config/yarn/global ]]; then
      mkdir ~/.config/yarn/global
    fi
    configDir="$configDir"/global
  fi
  while read -r target; do
    configTgt="$configDir"/$(basename "$target")
    if [[ ! -e "$configTgt" ]]; then
      ln -s "$target" "$configDir"
      echo -e "$target"
      notSetup=false
    elif [[ -n "$(diff "$target" "$configTgt")" ]]; then
      moveBackup "$configTgt"
      ln -s "$target" "$configDir"
      echo -e "$target"
      notSetup=false
    fi
  done < <(find "$dir" -type f -not -name "." -and -not -name ".DS_Store")
done < <(find "$config" -type d -d 1)
