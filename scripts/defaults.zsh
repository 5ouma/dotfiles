#!/usr/bin/env zsh

if "$doAll" || waitInput "Run some \`defaults\` commands." "$0"; then
  echoNumber "🟩 Changing Launchpad size..."
  if [[ $(defaults read com.apple.dock springboard-columns) != 9 || $(defaults read com.apple.dock springboard-rows) != 8 ]]; then
    defaults write com.apple.dock springboard-columns -int 9
    defaults write com.apple.dock springboard-rows -int 8
    defaults write com.apple.dock ResetLaunchPad -bool TRUE
    echoResult "Changed Launchpad size!" "Changing Launchpad size is failed."
      sleep 1
  else
    echoWarning "Launchpad size is already set up."
      sleep 0.5
  fi

  echoNumber "🔲 Adding spaces on Dock..."
  if [[ ! $(defaults read com.apple.dock persistent-apps) =~ "\"spacer-tile\"" ]]; then
    for ((i = 0; i < 6; i++)); do
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    done
    echoResult "Added spaces on Dock!" "Adding spaces on Dock is failed."
      sleep 1
  else
    echoWarning "Space in Dock is already added."
      sleep 0.5
  fi

  echoNumber "📷 Creating a screen capture directory and changing its directory to it..."
  if [[ "$(defaults read com.apple.screencapture location)" != "$HOME/Pictures/Screen Capture" ]]; then
    mkdir -p "$HOME/Pictures/Screen Capture"
    defaults write com.apple.screencapture location "$HOME/Pictures/Screen Capture"
    echoResult "Created screen capture directory and changed its directory!" "Creating screen capture directory and changing its directory is failed."
      sleep 1
  else
    echoWarning "Screen capture directory is already set up."
      sleep 0.5
  fi

  killall Dock
  killall SystemUIServer

  echoNumber "💻 Setting computer name..."
  if [[ ! $(scutil --get ComputerName) =~ $(id -F)\'s ]]; then
    echoQue "What's your computer name?"
    read -r computerName
    declare -r localName
      localName=$(echo "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
    scutil --set ComputerName "$computerName"
      print "computerName: $(sudo scutil --get ComputerName)"
    scutil --set LocalHostName "$localName"
      print "LocalHostName: $(sudo scutil --get LocalHostName)"
    scutil --set HostName "$computerName"
      print "HostName: $(sudo scutil --get HostName)"
    echoResult "Set computer name!" "Setting computer name is failed."
      sleep 1
  else
    echoWarning "Computer name is already set up."
      sleep 0.5
  fi
fi
