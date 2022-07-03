#!/bin/zsh
#=====================================================================================[ Variables & Functions ]=====================================================================================#

export dotfiles=$HOME/.dotfiles
notSetup=true
doneAnything=false
doAction=
nowNum=1
allNum=12

waitInput() {
  echo -en "\n\033[34;1mask\033[m $1 (y/n/other to abort): "
  read -r -k 1 run
  if [[ "$run" =~ "y" ]]; then
    doAction=true && echo ""
  elif [[ "$run" =~ "n" ]]; then
    doAction=false && echo ""
  else
    echo -e "\n" && exec $SHELL -l
  fi
}

waitReturn() {
  echo -e "Press RETURN to continue"
  read -rs
}

echoInfo() {
  echo -e "\033[36minfo\033[m $1"
}

echoWarning() {
  echo -e "\033[33mwarning\033[m $1"
}

echoResult() {
  if [[ $? = 0 ]];then
    echo -e "\033[32msuccess\033[m $1"
  else
    echo -e "\033[31merror\033[m $2"
  fi
}

echoNumber() {
  echo -e "\033[90m[$nowNum/$allNum]\033[m $1"
  (( nowNum++ ))
}

echoDir() {
  for i in $(ls -A "$1"); do
    i=${i//\.DS_Store/??}
    if [[ $i != "??" ]]; then
      echo -e "$1/$i"
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
    echo -e "$1"
    notSetup=false
    sleep 0.5
  fi
}

makeDir() {
  if [[ ! -e "$1" ]]; then
    mkdir "$1"
    echo -e "$1"
    sleep 0.5
  fi
}

copyFile() {
  for i in $(ls -A "$1"); do
    if [[ ! -e "$2/$i" ]]; then
      cp "$1/$i" "$2"
      echo -e "$1/$i"
      notSetup=false
    fi
  done
  if [[ "$notSetup" = false ]]; then
    sleep 0.5
  fi
}

#===================================================================================[ Ask and move ]==================================================================================#

echo -en "\033[34;1mask\033[m Are you sure to start setup? (y/n): "
read -rq && echo -e "" || { echo -e "\n" && exec $SHELL -l;}
cd "$dotfiles"/Setup/ || exit

#===================================================================================[ Homebrew install ]===================================================================================#

waitInput "Installing Homebrew."
if [[ "$doAction" = true ]]; then

  doneAnything=true

  # Command Line Tools for Xcode
  echoNumber " 🔨 Installing Command Line Tools for Xcode..."
  if [[ ! $(xcode-select --install 2>&1) =~ "command line tools are already installed" ]]; then
      xcode-select --install
      echoResult "Installed Command Line Tools for Xcode!" "Installing Command Line Tools for Xcode is failed."
    sleep 2
  else
    echoWarning "Command Line Tools for Xcode is already installed."
    sleep 0.5
  fi

  # Homebrew
  echoNumber " 🍺 Installing Homebrew..."
  if ! (type brew > /dev/null 2>&1); then
    echo -e "Is this command correct?\033[32m/bin/bash\033[m -c \033[33m\"\033[m\033[35m\$(\033[m\033[32mcurl\033[m -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh\033[35m)\033[m\033[33m\"\033[m"
        sleep 3
      open https://brew.sh/index_ja
        waitReturn
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        waitReturn
      echoResult "Installed Homebrew!" "Installing Homebrew is failed."
      brew doctor
      sleep 2
  else
    echoWarning "Homebrew is already installed."
    sleep 1
  fi
fi

#================================================================================[ Files and directories ]================================================================================#

waitInput "Make symlinks of terminal files."
if [[ "$doAction" = true ]]; then

  doneAnything=true

  echoNumber " 🔗 The following files and directories will be symlinked or created:"
    makeSymlink "$dotfiles"/zsh ~
    makeSymlink "$dotfiles"/Vim ~

    makeFile ~/.hushlogin

    makeDir ~/.ssh
    makeSymlink "$dotfiles"/Git ~
    if [[ ! -e ~/.ssh/config ]]; then
      echo -e "Do you use 1Password? (y/n): "
        read -rq && makeSymlink "$dotfiles"/Git/.ssh/1password ~/.ssh || makeSymlink "$dotfiles"/Git/.ssh/original ~/.ssh
    fi

    makeDir ~/.vim/undo

  if [[ "$notSetup" = false ]]; then
    echoResult "Symlinked terminal files!" "Making symlinks terminal files is failed."
    sleep 1
  else
    echoWarning "All files are already symlinked."
    sleep 0.5
  fi

  notSetup=true
  echoNumber " 🚚 The following fonts will be copied:"
  copyFile "$dotfiles"/Setup/Fonts ~/Library/Fonts
  if [[ "$notSetup" = false ]]; then
    echoResult "Copied fonts!" "Copying fonts is failed."
    sleep 1
  else
    echoWarning "All fonts are already copied."
    sleep 0.5
  fi

  notSetup=true
  echoNumber " 🚨 Add permission to my commands."
    if [[ $(ls -l "$dotfiles"/Commands/memo/memo) != "-rwxr--r--" ]]; then
      chmod 744 "$dotfiles"/Commands/memo/memo
      notSetup=false
    fi
    if [[ $(ls -l "$dotfiles"/Commands/notion/notion) != "-rwxr--r--" ]]; then
      chmod 744 "$dotfiles"/Commands/notion/notion
      notSetup=false
    fi
    if [[ "$notSetup" = false ]]; then
      echoResult "Added permission!" "Adding permission is failed."
    else
      echoWarning "All permission is already added."
    fi
    sleep 2
fi

#=====================================================================================[ System write ]=====================================================================================#

# Make spaces on Dock and resize Launchpad
waitInput "Run to change Launchpad size, add space on Dock, and change the saving screen capture location to the new folder."
if [[ "$doAction" = true ]]; then

  doneAnything=true

  echoNumber " 🟩 Change Launchpad size."
  if [[ ! ($(defaults read com.apple.dock springboard-columns) = 9 && $(defaults read com.apple.dock springboard-rows) = 8) ]]; then
    defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 8;defaults write com.apple.dock ResetLaunchPad -bool TRUE
    echoResult "Changed Launchpad size!" "Changing Launchpad size is failed."
    sleep 1
  else
    echoWarning "Launchpad size is already set up."
    sleep 0.5
  fi

  echoNumber " 🔲 Add spaces on Dock."
  if [[ ! "$(defaults read com.apple.dock persistent-apps)" =~ "\"spacer-tile\"" ]]; then
    for ((i=0; i<6; i++)); do
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    done
    echoResult "Added spaces on Dock!" "Adding spaces on Dock is failed."
    sleep 1
  else
    echoWarning "Space in Dock is already added."
    sleep 0.5
  fi

  echoNumber " 📷 Create screen capture directory and change its directory to it."
  if [[ ! -e ~/Pictures/スクリーンショット ]]; then
    makeDir ~/Pictures/スクリーンショット
    defaults write com.apple.screencapture location ~/Pictures/スクリーンショット
    echoResult "Created screen capture directory and changed its directory!" "Creating screen capture directory and changed its directory is failed."
    sleep 1
  else
    echoWarning "Screen capture directory is already set up."
    sleep 0.5
  fi

  # .DS_Store作成を抑制
  echoNumber " ❎ Suppress .DS_Store creation."
  if [[ $(defaults read com.apple.desktopservices DSDontWriteNetworkStores -bool) = 0 && $(defaults write com.apple.desktopservices DSDontWriteUSBStores -bool) = 0 ]]; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"
    echoResult "Suppressed .DS_Store creation!" "Suppressing .DS_Store creation is failed."
    sleep 1
  else
    echoWarning ".DS_Store creation is already suppressed."
    sleep 0.5
  fi

  killall Dock
  killall SystemUIServer
fi

# Set computer names
waitInput "Set computer name."
if [[ "$doAction" = true ]]; then

  doneAnything=true

  echoNumber " 💻 Setting computer name…"
  if [[ ! $(scutil --get ComputerName) =~ "Souma\'s" ]]; then
      echo -e "What's your computer name?"
      read -r computerName
      localName=$(echo -e "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
      scutil --set ComputerName "$computerName"
        echo -e "computerName: $(scutil --get ComputerName)"
      scutil --set LocalHostName "$localName"
        echo -e "LocalHostName: $(scutil --get LocalHostName)"
      scutil --set HostName "$computerName"
        echo -e "HostName: $(scutil --get HostName)"
    echoResult "Set computer name!" "Setting computer name is failed."
    sleep 1
  else
    echoWarning "Computer name is already set up."
    sleep 0.5
  fi
fi

#=====================================================================================[ Install apps ]=====================================================================================#

waitInput "Installing Homebrew packages and apps."
if [[ "$doAction" = true ]]; then

  doneAnything=true

  echoInfo "Opening App Store…"
    echoInfo "Please sign in to App Store."
        sleep 3
      open -a "App Store"
    waitReturn
  echoNumber " 📲 Installing apps with Homebrew…"
    brew bundle
  echoResult "Installed apps!" "Installing apps is failed."
  sleep 1

  echoNumber " 💾 Installing programming language with asdf."
  if [[ $(asdf list nodejs) =~ "No such plugin:" ]]; then
    echoInfo "Installing Node.js..."
    asdf plugin-add nodejs && asdf install nodejs latest && asdf global nodejs latest
    echoResult "Installed Node.js!" "Installing Node.js is failed."
    sleep 1
  else
    echoWarning "Node.js is already installed."
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
fi

if [[ "$doneAnything" = true ]]; then
  echo -e "\n✨ Setting up successfully!"
else
  echo ""
  echoWarning "Nothing is changed."
fi
