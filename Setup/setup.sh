waitInput() {
    echo -e -n "$1 (y/n): "
    read -q && echo "" || {echo "" && exec $SHELL}
}

waitEnter() {
    echo "Plese press enter."
    read
}

cd ~/.terminal-files/Setup

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


    waitInput "Copy terminal files."

cp ~/.terminal-files/zsh/.zshenv ~
cp -r ~/.terminal-files/zsh/ ~
cp ~/.terminal-files/Hyper/.hyper.js ~
cp ~/.terminal-files/Hyper/.hyper_plugins ~
touch ~/.hushlogin
cp ~/.terminal-files/Git/.gitconfig ~/.terminal-files/Git/.gitignore_global ~

mkdir ~/.ssh
echo "Do you use 1Password? (y/n): "
read -q && cp ~/.terminal-files/Git/.ssh/1password/config ~/.ssh || cp ~/.terminal-files/Git/.ssh/original/config ~/.ssh


cp ~/.terminal-files/Setup/Fonts/* ~/Library/Fonts

    waitInput "Run changing Launchpad size and add space on Dock"
defaults write com.apple.dock springboard-columns -int 9;defaults write com.apple.dock springboard-rows -int 7;defaults write com.apple.dock ResetLaunchPad -bool TRUE
for ((i=0; i<6; i++)); do
defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
done
killall Dock


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