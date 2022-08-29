#!/bin/zsh

#==================================================[ Variables ]==================================================#

dotfiles=$(dirname "$0")
packages="$dotfiles"/packages

doAll=false
notSetup=true
doneAnything=false
nowNum=1
allNum=$(($(grep -o "echoNumber" "$dotfiles"/setup.sh | wc -l) - 2))

#==================================================[ Functions ]==================================================#

waitInput() {
  echo -en "\033[34;1mask\033[m $1 (y/n/other to abort): "
  read -r -k 1 run
  echo
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
      echo
      echoWarning "Nothing has changed.\n"
    fi
    exec $SHELL -l
  fi
}

waitReturn() {
  echo "Press RETURN to continue"
  read -rs
}

echoAsk() {
  echo -en "\033[34;1mask\033[m $1: "
}

echoQue() {
  echo -en "\033[90;1mquestion\033[m $1: "
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
    doneAnything=true
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
    homeFile="$2/$(echo "$pack" | perl -pe "s/.*packages\/.*?\///")"
    homeDir=$(dirname "$homeFile")
    if [[ -e "$homeFile" && -n $(diff "$pack" "$homeFile") ]]; then
      mkdir -p "$(dirname "$1")"/backup
      mv "$homeFile" "$(dirname "$1")"/backup/
    fi
    if [[ ! -e "$homeFile" || -n $(diff "$pack" "$homeFile") ]]; then
      mkdir -p "$homeDir"
      ln -s "$pack" "$homeDir"
      echo "$pack"
        notSetup=false
    fi
  done < <(find "$1" -type f ! -name ".DS_Store")
}

makeFile() {
  for target in "$@"; do
    if [[ ! -e "$target" ]]; then
      touch "$target"
      echo "$target"
        notSetup=false
    fi
  done
}

makeDir() {
  for target in "$@"; do
    if [[ ! -e "$target" ]]; then
      mkdir -p "$target"
      echo "$target"
        notSetup=false
    fi
  done
}

copyFile() {
  for target in $(command ls -A "$1"); do
    if [[ ! -e "$2/$target" ]]; then
      cp "$1/$target" "$2"
      echo "$1/$target"
        notSetup=false
    fi
  done
}

setFiles() {
  makeSymlink "$packages" "$HOME"
  makeDir ~/.vim/undo ~/.ssh/git
  makeFile ~/.hushlogin
  if ! "$notSetup"; then
    echoResult "Set these files!" "Setting files is failed."
      sleep 1
  else
    echoWarning "All files are already set."
      sleep 0.5
  fi
}

installLang() {
  if ! (asdf list "$1" > /dev/null 2>&1); then
    echoInfo "Installing $1..."
    asdf plugin-add "$1"
    if "$2"; then
      asdf install "$1" latest
    else
      asdf install "$1"
    fi
    asdf global "$1" latest
    echoResult "Installed $1!" "Installing $1 is failed."
    sleep 1
  else
    echoWarning "$1 is already installed."
    sleep 0.5
  fi
}

uninstallLang() {
  if (asdf list "$1" > /dev/null 2>&1); then
    while read -r ver; do
      asdf uninstall "$1" "$ver"
      asdf plugin remove "$1"
      sed -i "" "/$1/d" "$packages"/asdf/.tool-versions
    done < <(asdf list "$1" | awk '{print $1}')
    echoResult "Uninstalled $1!\n" "Uninstalling $1 is failed.\n"
  else
    echoWarning "$1 doesn't exist."
  fi
}

#==================================================[ Options ]==================================================#

case "$1" in
  "-h" | "--help" )
    echo -e "\033[32mdotfiles\033[m"
    echo -e "My zsh, vim and other settings, plugins, etc and setup.\n"

    echo -e "\033[33mUSAGE:\033[m
      source ~/.dotfiles/setup.sh\n"
    echo -e "\033[33mOPTIONS:\033[m
      \033[32m-h\033[m, \033[32m--help\033[m    Print help information
      \033[32m-y\033[m, \033[32m--yes\033[m     Run all configuration
      \033[32m-s\033[m, \033[32m--set\033[m     Set files to home directory\n"
    echo -e "\033[33mCOMMANDS:\033[m
      \033[32minstall\033[m <languages>      Install programming languages with asdf
      \033[32muninstall\033[m <languages>    Uninstall programming languages from asdf\n"
    exec $SHELL -l
    ;;

  "-y" | "--yes" )
    doAll=true
    ;;

  "-s" | "--set" )
    setFiles
    echo
    exec $SHELL -l
    ;;

  "install" )
    for i in "${@:2}"; do
      installLang "$i" true
    done
    exec $SHELL -l
    ;;

  "uninstall" )
    for i in "${@:2}"; do
      uninstallLang "$i"
    done
    exec $SHELL -l
    ;;
esac

#==================================================[ Ask to confirm ]==================================================#

echo -en "\033[34;1mask\033[m Are you sure to start setup? (y/n): "
read -rq && echo -e "\n" || { echo -e "\n" && exec $SHELL -l; }

#==================================================[ Homebrew install ]==================================================#

if "$doAll" || waitInput "Install Homebrew." 2; then
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

echo

#==================================================[ Files, directories and commands ]==================================================#

if "$doAll" || waitInput "Make symlinks or create terminal files and add permission to commands." 3; then
  echoNumber " 🔗 The following files and directories will be symlinked or created:"
    setFiles

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
  if ! (type memo > /dev/null 2>&1); then
      chmod +x "$dotfiles"/commands/memo/memo
        notSetup=false
    fi
    if ! (type notion > /dev/null 2>&1); then
      chmod +x "$dotfiles"/commands/notion/notion
        notSetup=false
    fi
  if ! "$notSetup"; then
    echoResult "Added permission!" "Adding permission is failed."
  else
    echoWarning "All permission is already added."
  fi
fi

echo

#==================================================[ System write ]==================================================#

if "$doAll" || waitInput "Run to change Launchpad size, add spaces on Dock,\n    change the saving screen capture location to the new folder and change computer name." 5; then
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
  if [[ ! $(defaults read com.apple.dock persistent-apps) =~ "\"spacer-tile\"" ]]; then
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
  if [[ $(defaults read com.apple.screencapture location) != "$HOME/Pictures/Screen Capture" ]]; then
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

  echoNumber " 💻 Setting computer name..."
  if [[ ! $(scutil --get ComputerName) =~ $(id -F)\'s ]]; then
    echoQue "What's your computer name?"
    read -r computerName
    localName=$(echo "$computerName" | sed -e "s/'//g" -e "s/ /-/g")
    scutil --set ComputerName "$computerName"
      echo "computerName: $(sudo scutil --get ComputerName)"
    scutil --set LocalHostName "$localName"
      echo "LocalHostName: $(sudo scutil --get LocalHostName)"
    scutil --set HostName "$computerName"
      echo "HostName: $(sudo scutil --get HostName)"
    echoResult "Set computer name!" "Setting computer name is failed."
      sleep 1
  else
    echoWarning "Computer name is already set up."
      sleep 0.5
  fi
fi

echo

#==================================================[ Install apps and more ]==================================================#

if "$doAll" || waitInput "Install packages and apps with Homebrew and more." 5; then
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
  while read -r lang; do
    installLang "$lang" false
  done < <(awk '{print $1}' "$packages"/asdf/.tool-versions)

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
    echo "Please install DaVinci Resolve."
      sleep 3
    open https://www.blackmagicdesign.com/jp/products/davinciresolve
  fi

  if [[ ! -e "/Applications/Xcode.app" ]]; then
    echo "Install Xcode."
    mas install 497799835
  fi
fi

echo

#==================================================[ Done! ]==================================================#

if "$doneAnything"; then
  echo "✨ Setting up successfully!"
else
  echoWarning "Nothing has changed."
fi
