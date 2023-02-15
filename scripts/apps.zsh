if "$doAll" || waitInput "Install packages and apps with Homebrew and more." "$0"; then
  echoNumber "📲 Installing apps with Homebrew..."
  brew bundle --no-lock --file="$datas/Brewfile"
  sleep 1
  if [[ ! -e "/Applications/DaVinci Resolve" ]]; then
    print "Please install DaVinci Resolve."
    sleep 2
    open "https://www.blackmagicdesign.com/jp/products/davinciresolve"
    waitReturn
  fi
  echoResult "Installed apps!" "Installing apps is failed."
  sleep 1

  echoNumber "🟩 Setting up Launchpad..."
  lporg save -c "$HOME/.cache/launchpad.yaml" >/dev/null 2>&1
  if [[ -n $(diff "$datas/launchpad.yaml" "$HOME/.cache/launchpad.yaml") ]]; then
    lporg load -n "$datas/launchpad.yaml" >/dev/null 2>&1
    echoResult "Set up Launchpad!" "Setting up Launchpad is failed."
    sleep 1
  else
    echoWarning "Launchpad is already set."
    sleep 0.5
  fi
  command rm "$HOME/.cache/launchpad.yaml"

  echoNumber "📀 Restoring appliaction settings with Mackup..."
  if [[ -n "$(mackup -n backup)" ]]; then
    mackup restore
    echoResult "Restored app settings!" "Restoring app settings is failed."
    sleep 1
  else
    echoWarning "App settings is already restored."
    sleep 0.5
  fi

  echoNumber "⌨️ Restoring App Shortcuts..."
  if [[ ! "$(defaults read com.apple.universalaccess "com.apple.custommenu.apps")" =~ "\"" ]]; then
    mksei load "$datas/keyboard_shortcuts.json"
    echoResult "Restored App Shortcuts!" "Restoring App Shortcuts is failed."
    sleep 1
  else
    echoWarning "App Shortcuts is already restored."
    sleep 0.5
  fi

  echoNumber "💾 Installing programming language with rtx..."
  eval "$(rtx activate zsh -q)"
  if [[ "$(rtx ls)" =~ "missing" ]]; then
    rtx install --all
    echoResult "Installed all languages!" "Installing languages is failed."
    sleep 1
  else
    echoWarning "Languages are already installed."
  fi

  echoNumber "📝 Installing Vim plugins with Jetpack..."
  [ -z "$VIMRC" ] && export -r VIMRC="$HOME/.vim/.vimrc"
  [ -z "$VIMINIT" ] && export -r VIMINIT="source $VIMRC"
  vim +qall
  echoResult "Installed plugins!" "Installing plugins is failed."
  sleep 1
fi
