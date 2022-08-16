#!/bin/zsh

dotfiles=$HOME/.dotfiles
home="$dotfiles"/packages/home

moveBackup() {
  if [[ ! -e "$dotfiles"/backup ]]; then
    mkdir -p "$dotfiles"/backup
  fi
  mv "$1" "$dotfiles"/backup/
}

while read -r dir; do
  homeDir=~/$(basename "$dir")
  if [[ ! -e "$homeDir" ]]; then
    mkdir -p "$homeDir"
  fi
  while read -r target; do
    homeTgt="$homeDir"/$(basename "$target")
    if [[ ! -e "$homeTgt" ]]; then
      ln -s "$target" "$homeDir"
      echo -e "$target"
      notSetup=false
    elif [[ -n "$(diff "$target" "$homeTgt")" ]]; then
      moveBackup "$homeTgt"
      ln -s "$target" "$homeDir"
      echo -e "$target"
      notSetup=false
    fi
  done < <(find "$dir" -not -name "." -and -not -name ".DS_Store" -d 1)
done < <(find "$home" -type d -d 2)

while read -r file; do
  homeFile=~/$(basename "$file")
  if [[ ! -e "$homeFile" ]]; then
    ln -s "$file" ~
    echo -e "$file"
    notSetup=false
  elif [[ -n "$(diff "$file" "$homeFile")" ]]; then
    moveBackup "$homeFile"
    ln -s "$file" ~
    echo -e "$file"
    notSetup=false
  fi
done < <(find "$home" -type f -not -name "." -and -not -name ".DS_Store" -d 2)
