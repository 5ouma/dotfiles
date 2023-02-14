#!/usr/bin/env zsh

if "$doAll" || waitInput "Install packages and apps with Homebrew and more." "$0"; then
  echoNumber "📲 Installing apps with Homebrew..."
    echoInfo "Opening App Store..."
    echoInfo "Please sign in to App Store."
        sleep 3
      open -a "App Store"
        waitReturn
    brew bundle --no-lock --file="$data/Brewfile"
      sleep 1
    if [[ ! -e "/Applications/DaVinci Resolve" ]]; then
      print "Please install DaVinci Resolve."
        sleep 3
      open https://www.blackmagicdesign.com/jp/products/davinciresolve
        waitReturn
    fi
    echoResult "Installed apps!" "Installing apps is failed."
      sleep 1

  echoNumber "🟩 Setting up Launchpad..."
      lporg save -c "$HOME/.cache/launchpad.yaml" >/dev/null 2>&1
    if [[ -n $(diff "$data/launchpad.yaml" "$HOME/.cache/launchpad.yaml") ]]; then
      lporg load -n "$data/launchpad.yaml" >/dev/null 2>&1
      echoResult "Set up Launchpad!" "Setting up Launchpad is failed."
    else
      echoWarning "Launchpad is already set."
    fi
      command rm "$HOME/.cache/launchpad.yaml"
      sleep 1

  echoNumber "📀 Restoring appliaction settings with Mackup..."
    if [[ -n "$(mackup -n backup)" ]]; then
      mackup restore
      echoResult "Restored app settings!" "Restoring app settings is failed."
    else
      echoWarning "App settings is already restored."
    fi
      sleep 1

  echoNumber "⌨️ Restoring App Shortcuts..."
    if [[ ! "$(defaults read com.apple.universalaccess "com.apple.custommenu.apps")" =~ "\"" ]]; then
      mksei load "$data/keyboard_shortcuts.json"
      echoResult "Restored App Shortcuts!" "Restoring App Shortcuts is failed."
    else
      echoWarning "App Shortcuts is already restored."
    fi
      sleep 1

  echoNumber "💾 Installing programming language with rtx..."
    eval "$(rtx activate zsh -q)"
    if [[ "$(rtx ls)" =~ "missing" ]]; then
      rtx install --all
      echoResult "Installed all languages!" "Installing languages is failed."
    else
      echoWarning "Languages are already installed."
    fi
      sleep 1

  echoNumber "🧶 Installing packages with yarn..."
    if [[ ! -e "$HOME/.config/yarn/global/node_modules" ]]; then
      yarn global add
      echoResult "Installed packages!" "Installing packages is failed."
    else
      echoWarning "Packages are already installed."
    fi
      sleep 1

  echoNumber "📝 Installing Vim plugins with Jetpack..."
    [ -z "$VIMRC" ] && export -r VIMRC="$HOME/.vim/.vimrc"
    [ -z "$VIMINIT" ] && export -r VIMINIT="source $VIMRC"
    vim +qall
    echoResult "Installed plugins!" "Installing plugins is failed."
      sleep 1
fi
