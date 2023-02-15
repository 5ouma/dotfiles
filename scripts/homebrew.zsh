if "$doAll" || waitInput "Install Homebrew." "$0"; then
  echoNumber "🍺" "Installing Homebrew..."
  if ! (type brew >/dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echoResult "Installed Homebrew!" "Installing Homebrew is failed."
    [ "$(uname -m)" = "x86_64" ] && eval "$(/usr/local/bin/brew shellenv)"
    [ "$(uname -m)" = "arm64" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    brew doctor
    echoResult "Installed Homebrew!" "Installing Homebrew has failed."
  else
    echoWarning "Homebrew is already installed."
  fi
fi
