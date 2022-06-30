#!/bin/zsh
#=====================================================================================[ Variables & Functions ]=====================================================================================#

waitInput() {
  echo -en "$1 (y/n): "
  read -rq && echo "" || { echo "" && exec $SHELL;}
}

waitReturn() {
  echo "Press RETURN to continue"
  read -r
}

echoArrow() {
  echo "\033[34;1m==>\033[m \033[1m$1\033[m"
}

echoDir() {
  for i in $(ls -A "$1"); do
    i=${i//\.DS_Store/??}
    if [[ $i != "??" ]]; then
      echo "$1/$i"
    fi
  done
}

makeSymlink() {
  for i in $(ls -A "$1"); do
    if [[ ! -e "$2/$i" ]]; then
      ln -s "$1/$i" "$2"
      echoDir "$1"
    fi
  done
}

makeFile() {
  if [[ ! -e "$1" ]]; then
    touch "$1"
    echo "$1"
  fi
}

makeDir() {
  if [[ ! -e "$1" ]]; then
    mkdir "$1"
    echo "$1"
  fi
}

copyFile() {
  for i in $(ls -A "$1"); do
    if [[ ! -e "$2/$i" ]]; then
      cp "$1/$i" "$2"
      echo "$1/$i"
    fi
  done
}

export dotfiles=$HOME/.dotfiles

#===================================================================================[ Ask and move ]==================================================================================#

waitInput "Are you sure to start setup?"
cd "$dotfiles"/Setup/ || exit

#===================================================================================[ Homebrew install ]===================================================================================#

# Command Line Tools for Xcode
echoArrow "Installing Command Line Tools for Xcode."
  xcode-select --install

  sleep 3

# Homebrew
if ! (type brew > /dev/null 2>&1); then
  echoArrow "Installing Homebrew."
  echo -e "Is this command correct?\n\033[32m/bin/bash\033[m -c \033[33m\"\033[m\033[35m\$(\033[m\033[32mcurl\033[m -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh\033[35m)\033[m\033[33m\"\033[m"
      sleep 3
    open https://brew.sh/index_ja
      waitReturn
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      waitReturn
    brew doctor
else
  echoArrow "Homebrew is already installed."
fi

#================================================================================[ Files and directories ]================================================================================#

waitInput "\nMake symlinks of terminal files."
echoArrow "The following files and directories will be symlinked or created:"
  makeSymlink "$dotfiles"/zsh ~
  makeSymlink "$dotfiles"/Vim ~
  makeFile ~/.hushlogin
  makeDir ~/.ssh
  makeSymlink "$dotfiles"/Git ~
  if [[ ! -e ~/.ssh/config ]]; then
    echo "Do you use 1Password? (y/n): "
      read -rq && makeSymlink "$dotfiles"/Git/.ssh/1password ~/.ssh || makeSymlink "$dotfiles"/Git/.ssh/original ~/.ssh
  fi

  makeDir ~/.vim/undo

echoArrow "The following fonts will be copied:"
copyFile "$dotfiles"/Setup/Fonts ~/Library/Fonts

echoArrow "Add permission to my commands."
  chmod 744 ~/.dotfiles/Commands/memo/memo
  chmod 744 ~/.dotfiles/Commands/notion/notion

#=====================================================================================[ System write ]=====================================================================================#

# Make spaces on Dock and resize Launchpad
waitInput "\nRun changing Launchpad size, add space on Dock and change save screencapture location to new folder."
  if [[ ! ($(defaults read com.apple.dock springboard-columns) = 9 && $(defaults read com.apple.dock springboard-rows) = 8) ]]; then
    echoArrow "Change Launchpad size."
      defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 8;defaults write com.apple.dock ResetLaunchPad -bool TRUE
  else
    echoArrow "Launchpad size is already set up"
  fi
  echoArrow "Add space on Dock."
    for ((i=0; i<6; i++)); do
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    done

echoArrow "Create screenshot directory and change its directory to it."
  makeDir ~/Pictures/スクリーンショット
  defaults write com.apple.screencapture location ~/Pictures/スクリーンショット

# .DS_Store作成を抑制
echoArrow "Suppress .DS_Store creation."
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"

killall Dock
killall SystemUIServer

# Set computer names
echoArrow "Setting computer name…"
  echo "What's your computer name?"
  read -r computerName
  localName=$(echo "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
  scutil --set ComputerName "$computerName"
    echo "computerName: $(scutil --get ComputerName)"
  scutil --set LocalHostName "$localName"
    echo "LocalHostName: $(scutil --get LocalHostName)"
  scutil --set HostName "$computerName"
    echo "HostName: $(scutil --get HostName)"

#=====================================================================================[ Install apps ]=====================================================================================#

waitInput "\nIf enter \"y\", start installing Homebrew packages and apps."
  echoArrow "Opening App Store…"
    echo "Please sign in to App Store."
        sleep 3
      open -a "App Store"
    waitReturn
  echoArrow "Installing apps with Homebrew…"
    brew bundle

echoArrow "Installing programming language with asdf"
asdf plugin-add nodejs && asdf install nodejs latest && asdf global nodejs latest

waitInput "Please install DaVinci Resolve."
    sleep 3
  open https://www.blackmagicdesign.com/jp/products/davinciresolve

waitInput "Do you want to install Xcode?"
  mas install 497799835

echoArrow "Deploying successful!"