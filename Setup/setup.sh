#!/bin/zsh
#=====================================================================================[ Variables & Functions ]=====================================================================================#

export dotfiles=$HOME/.dotfiles
notSetup=true
nowNum=1
allNum=12

waitInput() {
  echo -en "\n\033[34;1mask\033[m $1 (y/n): "
  read -rq && echo "" || { echo "" && exec $SHELL;}
}

waitReturn() {
  echo "Press RETURN to continue"
  read -r
}

echoInfo() {
  echo -e "\033[34minfo\033[m $1"
}

echoSuccess() {
  if [[ $? = 0 ]];then
    echo -e "\033[32msuccess\033[m $1"
  fi
}

echowithNumber() {
  echo -e "\033[90m[$nowNum/$allNum]\033[m $1"
  (( nowNum++ ))
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
      notSetup=false
    fi
  done
  if [[ $notSetup = false ]]; then
    sleep 0.5
  fi
}

makeFile() {
  if [[ ! -e "$1" ]]; then
    touch "$1"
    echo "$1"
    notSetup=false
    sleep 0.5
  fi
}

makeDir() {
  if [[ ! -e "$1" ]]; then
    mkdir "$1"
    echo "$1"
    sleep 0.5
  fi
}

copyFile() {
  for i in $(ls -A "$1"); do
    if [[ ! -e "$2/$i" ]]; then
      cp "$1/$i" "$2"
      echo "$1/$i"
      notSetup=false
    fi
  done
  if [[ $notSetup = false ]]; then
    sleep 0.5
  fi
}

#===================================================================================[ Ask and move ]==================================================================================#

waitInput "Are you sure to start setup?"
cd "$dotfiles"/Setup/ || exit

#===================================================================================[ Homebrew install ]===================================================================================#

# Command Line Tools for Xcode
if [[ ! $(xcode-select --install 2>&1) =~ "command line tools are already installed" ]]; then
  echowithNumber " 🔨 Installing Command Line Tools for Xcode..."
    xcode-select --install
    echoSuccess "Installed Command Line Tools for Xcode!"
  sleep 3
else
  echowithNumber " 🔨 Command Line Tools for Xcode is already installed."
  sleep 0.5
fi

# Homebrew
if ! (type brew > /dev/null 2>&1); then
  echowithNumber " 🍺 Installing Homebrew..."
  echo -e "Is this command correct?\033[32m/bin/bash\033[m -c \033[33m\"\033[m\033[35m\$(\033[m\033[32mcurl\033[m -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh\033[35m)\033[m\033[33m\"\033[m"
      sleep 3
    open https://brew.sh/index_ja
      waitReturn
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      waitReturn
    echoSuccess "Installed Homebrew!"
    brew doctor
else
  echowithNumber " 🍺 Homebrew is already installed."
  sleep 2
fi

#================================================================================[ Files and directories ]================================================================================#

waitInput "Make symlinks of terminal files."
echowithNumber " 🔗 The following files and directories will be symlinked or created:"
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

if [[ "$notSetup" = true ]]; then
  echoInfo "All files are already symlinked."
  sleep 0.5
else
  echoSuccess "Symlinked terminal files!"
  sleep 1
fi
notSetup=true

echowithNumber " 🚚 The following fonts will be copied:"
copyFile "$dotfiles"/Setup/Fonts ~/Library/Fonts
if [[ "$notSetup" = true ]]; then
  echoInfo "All fonts are already copied."
  sleep 0.5
else
  echoSuccess "Copied fonts!"
  sleep 1
fi

echowithNumber " 🚨 Add permission to my commands."
  chmod 744 ~/.dotfiles/Commands/memo/memo
  chmod 744 ~/.dotfiles/Commands/notion/notion
  echoSuccess "Added permission!"
  sleep 2

#=====================================================================================[ System write ]=====================================================================================#

# Make spaces on Dock and resize Launchpad
waitInput "Run to change Launchpad size, add space on Dock, and change the saving screen capture location to the new folder."
  if [[ ! ($(defaults read com.apple.dock springboard-columns) = 9 && $(defaults read com.apple.dock springboard-rows) = 8) ]]; then
    echowithNumber " 🟩 Change Launchpad size."
      defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 8;defaults write com.apple.dock ResetLaunchPad -bool TRUE
      echoSuccess "Changed Launchpad size!"
      sleep 1
  else
    echowithNumber " 🟩 Launchpad size is already set up."
    sleep 0.5
  fi
  if [[ ! "$(defaults read com.apple.dock persistent-apps)" =~ "\"spacer-tile\"" ]]; then
    echowithNumber " 🔲 Add spaces on Dock."
      for ((i=0; i<6; i++)); do
        defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
      done
      echoSuccess "Added spaces on Dock!"
      sleep 1
  else
    echowithNumber " 🔲 Space in Dock is already added."
    sleep 0.5
  fi

  if [[ ! -e ~/Pictures/スクリーンショット ]]; then
    echowithNumber " 📷 Create screen capture directory and change its directory to it."
    makeDir ~/Pictures/スクリーンショット
    defaults write com.apple.screencapture location ~/Pictures/スクリーンショット
    echoSuccess "Created screen capture directory and changed its directory!"
    sleep 1
  else
    echowithNumber " 📷 screen capture directory is already set up."
    sleep 0.5
  fi

# .DS_Store作成を抑制
if [[ $(defaults read com.apple.desktopservices DSDontWriteNetworkStores -bool) = 0 && $(defaults write com.apple.desktopservices DSDontWriteUSBStores -bool) = 0 ]]; then
  echowithNumber " ❎ Suppress .DS_Store creation."
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"
    echoSuccess "Suppressed .DS_Store creation!"
    sleep 1
else
  echowithNumber " ❎ .DS_Store creation is already suppressed."
  sleep 0.5
fi

killall Dock
killall SystemUIServer

# Set computer names
if [[ ! $(scutil --get ComputerName) =~ "Souma\'s" ]]; then
  echowithNumber " 💻 Setting computer name…"
    echo "What's your computer name?"
    read -r computerName
    localName=$(echo "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
    scutil --set ComputerName "$computerName"
      echo "computerName: $(scutil --get ComputerName)"
    scutil --set LocalHostName "$localName"
      echo "LocalHostName: $(scutil --get LocalHostName)"
    scutil --set HostName "$computerName"
      echo "HostName: $(scutil --get HostName)"
  echoSuccess "Set computer name!"
  sleep 1
else
  echowithNumber " 💻 Computer name is already set up."
  sleep 0.5
fi

#=====================================================================================[ Install apps ]=====================================================================================#

waitInput "If enter \"y\", start installing Homebrew packages and apps."
  echoInfo "Opening App Store…"
    echoInfo "Please sign in to App Store."
        sleep 3
      open -a "App Store"
    waitReturn
  echowithNumber " 📲 Installing apps with Homebrew…"
    brew bundle
  echoSuccess "Installed apps!"
  sleep 1

echowithNumber " 💾 Installing programming language with asdf."
if [[ $(asdf list nodejs) =~ "No such plugin:" ]]; then
  echoInfo "Installing Node.js..."
  asdf plugin-add nodejs && asdf install nodejs latest && asdf global nodejs latest
  echoSuccess "Installed Node.js!"
  sleep 1
else
  echoInfo "Node.js is already installed."
  sleep 0.5
fi

if [[ ! -e "/Applications/DaVinci Resolve" ]]; then
  waitInput "Please install DaVinci Resolve."
      sleep 3
    open https://www.blackmagicdesign.com/jp/products/davinciresolve
fi

if [[ ! -e "/Applications/Xcode.app" ]]; then
  waitInput "Do you want to install Xcode?"
    mas install 497799835
fi

echo -e " ✨ Setting up successfully!"