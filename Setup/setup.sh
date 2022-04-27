#=====================================================================================[ Functions ]=====================================================================================

waitInput() {
    echo -e -n "$1 (y/n): "
    read -q && echo "" || {echo "" && exec $SHELL}
}

waitEnter() {
    echo "Plese press enter."
    read
}

#========================================================================================================================================================================================



#=================================================================================== Homebrew install ===================================================================================

cd ~/.shell-files/Setup

waitInput "Are you sure to start setup?"
xcode-select --install

    sleep 3

echo -e "Is commadnd correct?\n/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    sleep 3
open https://brew.sh/index_ja
    waitEnter
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    waitEnter
brew doctor

#================================================================================ Files and directories ================================================================================

    waitInput "Make symbolic links of terminal files."

ln -s ~/.shell-files/zsh/.zshenv ~/.zshenv
ln -s ~/.shell-files/zsh/.zsh ~/.zsh
touch ~/.hushlogin
ln -s ~/.shell-files/Git/.gitconfig ~/.gitconfig
ln -s ~/.shell-files/Git/.gitignore_global ~/.gitignore_global

mkdir ~/.ssh
echo "Do you use 1Password? (y/n): "
read -q && ln -s ~/.shell-files/Git/.ssh/1password/config ~/.ssh/config || ln -s ~/.shell-files/Git/.ssh/original/config ~/.ssh/config

cp ~/.shell-files/Setup/Fonts/* ~/Library/Fonts

#===================================================================================== System write =====================================================================================

    waitInput "Run changing Launchpad size, add space on Dock and chage save screencapture location to new folder."
defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 7;defaults write com.apple.dock ResetLaunchPad -bool TRUE
for ((i=0; i<6; i++)); do
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
done

mkdir ~/Pictures/スクリーンショット
defaults write com.apple.screencapture location ~/Pictures/スクリーンショット

killall Dock

#===================================================================================== Install apps =====================================================================================

waitInput "If enter \"y\", start installing Homebrew packages and apps."
echo "Please sigin in to App Store"
    sleep 3
open -a "App Store"
    waitEnter
brew bundle

open https://github.com/mohamed-arradi/AirpodsBattery-Monitor-For-Mac
open https://github.com/x74353/Amphetamine-Enhancer
open https://github.com/alexzielenski/Mousecape
open https://www.corecode.io/trashrecover/

waitInput "Do you want to install Xcode?"
mas install 497799835