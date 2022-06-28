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
  for i in $(ls -A "$dotfiles/$1"); do
    i=${i//\.DS_Store/??}
    if [[ $i != "??" ]]; then
      echo "$dotfiles/$i"
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
echoArrow "Installing Homebrew."
echo -e "Is this command correct?\n\033[32m/bin/bash\033[m -c \033[33m\"\033[m\033[35m\$(\033[m\033[32mcurl\033[m -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh\033[35m)\033[m\033[33m\"\033[m"
    sleep 3
  open https://brew.sh/index_ja
    waitReturn
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    waitReturn
  brew doctor

#================================================================================[ Files and directories ]================================================================================#

waitInput "Make symlinks of terminal files."
echoArrow "The following files and directories will be symlinked or created:"
  echoDir zsh
    ln -s "$dotfiles"/zsh/.* ~
  echoDir Vim
    ln -s "$dotfiles"/Vim/.* ~
  echo "$HOME/.hushlogin"
    touch ~/.hushlogin
  echoDir Git
    ln -s "$dotfiles"/Git/.gitconfig ~
    ln -s "$dotfiles"/Git/.gitignore_global ~
    mkdir ~/.ssh
    echo "Do you use 1Password? (y/n): "
      read -rq && ln -s "$dotfiles"/Git/.ssh/1password/config ~/.ssh/config || ln -s "$dotfiles"/Git/.ssh/original/config ~/.ssh/config

  echo "$HOME/.vim/undo"
    mkdir .vim/undo

  cp $dotfiles/Setup/Fonts/* ~/Library/Fonts

echoArrow "Add permission to my commands."
  chmod 744 ~/.dotfiles/Commands/memo/memo
  chmod 744 ~/.dotfiles/Commands/notion/notion

#=====================================================================================[ System write ]=====================================================================================#

# Make spaces on Dock and resize Launchpad
waitInput "Run changing Launchpad size, add space on Dock and change save screencapture location to new folder."
  echoArrow "Change Launchpad size."
    defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 7;defaults write com.apple.dock ResetLaunchPad -bool TRUE
  echoArrow "Add space on Dock."
    for ((i=0; i<6; i++)); do
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    done

echoArrow "Create screenshot directory and change its directory to it."
  mkdir ~/Pictures/スクリーンショット
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

waitInput "If enter \"y\", start installing Homebrew packages and apps."
  echoArrow "Opening App Store…"
    echo "Please sign in to App Store."
        sleep 3
      open -a "App Store"
    waitReturn
  echoArrow "Installing apps with Homebrew…"
    brew bundle

waitInput "Please install DaVinci Resolve."
    sleep 3
  open https://www.blackmagicdesign.com/jp/products/davinciresolve

waitInput "Do you want to install Xcode?"
  mas install 497799835

echoArrow "Deploying successful!"