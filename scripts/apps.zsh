if "$doAll" || waitInput "Install packages and apply prefernces." "$0"; then
  echoNumber "📲" "Installing apps and commands..."
  brew bundle --no-lock --file="$datas/Brewfile"
  sleep 1
  if [[ ! -e "/Applications/DaVinci Resolve" ]]; then
    print "Please install DaVinci Resolve."
    sleep 2
    open "https://www.blackmagicdesign.com/jp/products/davinciresolve"
    waitReturn
  fi
  echoResult "Installed apps!" "Installing apps has failed."

  echoNumber "🟩" "Setting up Launchpad..."
  lporg save -c "$HOME/.cache/launchpad.yaml" >/dev/null 2>&1
  if [[ -n $(diff "$datas/launchpad.yaml" "$HOME/.cache/launchpad.yaml") ]]; then
    lporg load -n "$datas/launchpad.yaml" >/dev/null 2>&1
    echoResult "Set up Launchpad!" "Setting up Launchpad has failed."
  else
    echoWarning "Launchpad is already set."
  fi
  command rm "$HOME/.cache/launchpad.yaml"

  echoNumber "📀" "Restoring appliaction settings..."
  if [[ -n "$(mackup -n backup)" ]]; then
    mackup restore
    echoResult "Restored app settings!" "Restoring app settings has failed."
  else
    echoWarning "App settings is already restored."
  fi

  echoNumber "⌨️" "Restoring App Shortcuts..."
  if [[ ! "$(defaults read com.apple.universalaccess "com.apple.custommenu.apps")" =~ "\"" ]]; then
    mksei load "$datas/keyboard_shortcuts.json"
    echoResult "Restored App Shortcuts!" "Restoring App Shortcuts has failed."
  else
    echoWarning "App Shortcuts is already restored."
  fi

  echoNumber "💾" "Installing programming languages..."
  eval "$(rtx activate zsh -q)"
  if [[ "$(rtx ls)" =~ "missing" ]]; then
    rtx install --all
    echoResult "Installed all languages!" "Installing languages has failed."
  else
    echoWarning "Languages are already installed."
  fi

  echoNumber "📝" "Installing Vim plugins..."
  [ -z "$VIMRC" ] && export -r VIMRC="$HOME/.vim/.vimrc"
  [ -z "$VIMINIT" ] && export -r VIMINIT="source $VIMRC"
  vim +qall
  echoResult "Installed plugins!" "Installing plugins has failed."
fi
