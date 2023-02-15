if "$doAll" || waitInput "Run some \`defaults\` commands." "$0"; then
  echoNumber "🟩" "Changing Launchpad size..."
  if [[ $(defaults read com.apple.dock springboard-columns) != 9 || $(defaults read com.apple.dock springboard-rows) != 8 ]]; then
    defaults write com.apple.dock springboard-columns -int 9
    defaults write com.apple.dock springboard-rows -int 8
    defaults write com.apple.dock ResetLaunchPad -bool TRUE
    echoResult "Changed Launchpad size!" "Changing Launchpad size has failed."
  else
    echoWarning "Launchpad size is already set up."
  fi

  echoNumber "🔲" "Adding spaces on Dock..."
  if [[ ! $(defaults read com.apple.dock persistent-apps) =~ "\"spacer-tile\"" ]]; then
    for ((i = 0; i < 6; i++)); do
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    done
    echoResult "Added spaces on Dock!" "Adding spaces on Dock has failed."
  else
    echoWarning "Space in Dock is already added."
  fi

  echoNumber "📷" "Changing screen capture path..."
  if [[ "$(defaults read com.apple.screencapture location)" != "$HOME/Pictures/Screen Capture" ]]; then
    mkdir -p "$HOME/Pictures/Screen Capture"
    defaults write com.apple.screencapture location "$HOME/Pictures/Screen Capture"
    echoResult "Changed screen capture path!" "Changing screen capture path has failed."
  else
    echoWarning "Screen capture directory is already set up."
  fi

  killall Dock
  killall SystemUIServer

  echoNumber "💻" "Setting computer name..."
  if [[ ! $(scutil --get ComputerName) =~ $(id -F)\'s ]]; then
    echoQue "What's your computer name?"
    read -r computerName
    declare -r localName=$(echo "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
    scutil --set ComputerName "$computerName"
    scutil --set HostName "$computerName"
    scutil --set LocalHostName "$localName"
    print -- "- computerName : $(printc cyan false "$(sudo scutil --get ComputerName)")"
    print -- "- HostName : $(printc cyan false "$(sudo scutil --get HostName)")"
    print -- "- LocalHostName : $(printc cyan false "$(sudo scutil --get LocalHostName)")"
    echoResult "Set computer name!" "Setting computer name has failed."
  else
    echoWarning "Computer name is already set up."
  fi
fi
