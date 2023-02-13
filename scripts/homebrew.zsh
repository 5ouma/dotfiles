#!/usr/bin/env zsh

if "$doAll" || waitInput "Install Homebrew." "$0"; then
  echoNumber "🍺 Installing Homebrew..."
  if ! (type brew >/dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      waitReturn
    echoResult "Installed Homebrew!" "Installing Homebrew is failed."
    [ "$(uname -m)" = "arm64" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    brew doctor
      sleep 2
  else
    echoWarning "Homebrew is already installed."
      sleep 1
  fi
fi
