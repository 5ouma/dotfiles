#!/bin/zsh

#==================================================[ Variables & Functions ]==================================================#

export dotfiles=$HOME/.dotfiles
packages="$dotfiles"/packages

notSetup=true
doneAnything=false
nowNum=1
allNum=$(($(grep -o "echoNumber" "$dotfiles"/setup.sh | wc -l) - 2))

typeset -A langs=("nodejs" "Node.js")


waitInput() {
  echo -en "\n\033[34;1mask\033[m $1 (y/n/other to abort): "
  read -r -k 1 run
  echo ""
  if [[ "$run" =~ "y|Y" ]]; then
    return 0
  elif [[ "$run" =~ "n|N" ]]; then
    for i in {1..$2}; do
      (( nowNum++ ))
    done
    return 1
  else
    if "$doneAnything"; then
      echo -e "\n✨ Setting up successfully!\n"
    else
      echo ""
      echoWarning "Nothing is changed.\n"
    fi
    exec $SHELL -l
  fi
}

waitReturn() {
  echo -e "Press RETURN to continue"
  read -rs
}

echoAsk() {
  echo -en "\033[34;1mask\033[m $1: "
}

echoInfo() {
  echo -e "\033[36minfo\033[m $1"
}

echoWarning() {
  echo -e "\033[33mwarning\033[m $1"
}

echoResult() {
  if [[ $? = 0 ]]; then
    echo -e "\033[32msuccess\033[m $1"
  else
    echo -e "\033[31merror\033[m $2"
  fi
}

echoNumber() {
  echo -e "\033[90m[$nowNum/$allNum]\033[m $1"
  (( nowNum++ ))
}

makeSymlink() {
  while read -r pack; do
    homeFile="$2/$(echo "$pack" | sed -e "s/.*$(basename "$1")\///" | cut -d "/" -f 2-)"
    homeDir="$(dirname "$homeFile")"
    if [[ -e "$homeFile" && -n "$(diff "$pack" "$homeFile")" ]]; then
      mkdir -p "$(dirname "$1")"/backup
      mv "$homeFile" "$(dirname "$1")"/backup/
    fi
    if [[ ! -e "$homeFile" || -n "$(diff "$pack" "$homeFile")" ]]; then
      mkdir -p "$homeDir"
      ln -s "$pack" "$homeDir"
      echo -e "$pack"
        notSetup=false
    fi
  done < <(find "$1" -type f ! -name ".DS_Store")
}

makeFile() {
  for target in "$@"; do
    if [[ ! -e "$target" ]]; then
      touch "$target"
      echo -e "$target"
        notSetup=false
    fi
  done
}

makeDir() {
  for target in "$@"; do
    if [[ ! -e "$target" ]]; then
      mkdir -p "$target"
      echo -e "$target"
        notSetup=false
    fi
  done
}

copyFile() {
  for target in $(command ls -A "$1"); do
    if [[ ! -e "$2/$target" ]]; then
      cp "$1/$target" "$2"
      echo -e "$1/$target"
        notSetup=false
    fi
  done
}

installLang() {
  if ! (asdf list "$2" > /dev/null 2>&1); then
    echoInfo "Installing $1..."
    asdf plugin-add "$2" && asdf install "$2" latest && asdf global "$2" latest
    echoResult "Installed $1!" "Installing $1 is failed."
    sleep 1
  else
    echoWarning "$1 is already installed."
    sleep 0.5
  fi
}

#==================================================[ Ask to confirm ]==================================================#

echo -en "\033[34;1mask\033[m Are you sure to start setup? (y/n): "
read -rq && echo -e "" || { echo -e "\n" && exec $SHELL -l; }

#==================================================[ Homebrew install ]==================================================#

if waitInput "Install Homebrew." 2; then
    doneAnything=true
  echoNumber " 🔨 Installing Command Line Tools for Xcode..."
  if ! (xcode-select -v > /dev/null 2>&1); then
    xcode-select --install
    echoResult "Installed Command Line Tools for Xcode!" "Installing Command Line Tools for Xcode is failed."
      sleep 2
  else
    echoWarning "Command Line Tools for Xcode is already installed."
      sleep 0.5
  fi

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

#==================================================[ Files, directories and commands ]==================================================#

if waitInput "Make symlinks or create terminal files and add permission to commands." 3; then
    doneAnything=true
  echoNumber " 🔗 The following files and directories will be symlinked or created:"
    makeSymlink "$packages" "$HOME"
    makeDir ~/.vim/undo ~/.ssh/git
    makeFile ~/.hushlogin
  if ! "$notSetup"; then
    echoResult "Symlinked terminal files!" "Making symlinks terminal files is failed."
      sleep 1
  else
    echoWarning "All files are already symlinked."
      sleep 0.5
  fi

    notSetup=true
  echoNumber " 🚚 The following fonts will be copied:"
    copyFile "$dotfiles"/data/fonts ~/Library/Fonts
  if ! "$notSetup"; then
    echoResult "Copied fonts!" "Copying fonts is failed."
      sleep 1
  else
    echoWarning "All fonts are already copied."
      sleep 0.5
  fi

    notSetup=true
  echoNumber " 🚨 Adding permission to my commands..."
    if [[ ! $(command ls -l "$dotfiles"/commands/memo/memo) =~ "-rwxr--r--" ]]; then
      chmod 744 "$dotfiles"/commands/memo/memo
        notSetup=false
    fi
    if [[ ! $(command ls -l "$dotfiles"/commands/notion/notion) =~ "-rwxr--r--" ]]; then
      chmod 744 "$dotfiles"/commands/notion/notion
        notSetup=false
    fi
  if ! "$notSetup"; then
    echoResult "Added permission!" "Adding permission is failed."
  else
    echoWarning "All permission is already added."
  fi
fi

#==================================================[ System write ]==================================================#

# Make spaces on Dock and resize Launchpad
if waitInput "Run to change Launchpad size, add space on Dock, and change the saving screen capture location to the new folder." 4; then
    doneAnything=true
  echoNumber " 🟩 Changing Launchpad size..."
  if [[ ! ($(defaults read com.apple.dock springboard-columns) = 9 && $(defaults read com.apple.dock springboard-rows) = 8) ]]; then
    defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 8;defaults write com.apple.dock ResetLaunchPad -bool TRUE
    echoResult "Changed Launchpad size!" "Changing Launchpad size is failed."
      sleep 1
  else
    echoWarning "Launchpad size is already set up."
      sleep 0.5
  fi

  echoNumber " 🔲 Adding spaces on Dock..."
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

  echoNumber " 📷 Creating a screen capture directory and changing its directory to it..."
  if [[ "$(defaults read com.apple.screencapture location)" != "$HOME/Pictures/Screen Capture" ]]; then
    mkdir -p "$HOME/Pictures/Screen Capture"
    defaults write com.apple.screencapture location "$HOME/Pictures/Screen Capture"
    echoResult "Created screen capture directory and changed its directory!" "Creating screen capture directory and changing its directory is failed."
      sleep 1
  else
    echoWarning "Screen capture directory is already set up."
      sleep 0.5
  fi

  echoNumber " ❎ Suppressing .DS_Store creation..."
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

if waitInput "Set computer name." 1; then
    doneAnything=true
  echoNumber " 💻 Setting computer name..."
  if [[ ! $(scutil --get ComputerName) =~ $(id -F)\'s ]]; then
    echoAsk "What's your computer name?"
    read -r computerName
    localName=$(echo -e "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
    scutil --set ComputerName "$computerName"
      echo -e "computerName: $(sudo scutil --get ComputerName)"
    scutil --set LocalHostName "$localName"
      echo -e "LocalHostName: $(sudo scutil --get LocalHostName)"
    scutil --set HostName "$computerName"
      echo -e "HostName: $(sudo scutil --get HostName)"
    echoResult "Set computer name!" "Setting computer name is failed."
      sleep 1
  else
    echoWarning "Computer name is already set up."
      sleep 0.5
  fi
fi

#==================================================[ Install apps and more ]==================================================#

if waitInput "Install packages and apps with Homebrew and more." 5; then
    doneAnything=true
  if ! (mas account > /dev/null 2>&1); then
    echoInfo "Opening App Store..."
    echoInfo "Please sign in to App Store."
      sleep 3
    open -a "App Store"
    waitReturn
  fi
  echoNumber " 📲 Installing apps with Homebrew..."
  brew bundle --file="$dotfiles"/data/Brewfile
  echoResult "Installed apps!" "Installing apps is failed."
    sleep 1

  echoNumber " 🖥 Installing Shell Integration for iTerm2..."
    if [[ ! -e "$ZDOTDIR/.iterm2_shell_integration.zsh" ]]; then
      curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
      echoResult "Installed Shell Integration!" "Installing Shell Integration is failed."
    else
      echoWarning "Shell Integration is already installed."
    fi

  echoNumber " 💾 Installing programming language with asdf..."
  for lang in ${(k)langs}; do
    installLang "${langs[$lang]}" "$lang"
  done

  echoNumber " 🧶 installing packages with yarn..."
    if [[ ! -e "$HOME/.config/yarn/global/node_modules" ]]; then
      yarn global add
      echoResult "Installed packages!" "Installing yarn is failed."
    else
      echoWarning "Packages are already installed."
    fi

  echoNumber " 📝 Installing Vim plugins with Jetpack..."
    export VIMRC="$HOME/.vim/.vimrc"
    export VIMINIT="source $VIMRC"
    vim +Jetpack +qall
    echoResult "Installed plugins!" "Installing plugins is failed."


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

#==================================================[ Done! ]==================================================#

if "$doneAnything"; then
  echo -e "\n✨ Setting up successfully!"
else
  echo ""
  echoWarning "Nothing is changed."
fi
