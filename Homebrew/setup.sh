waitInput() {
    echo -e -n "$1 (y/n): "
    read -q && echo "" || {echo "" && exec $SHELL}
}

waitEnter() {
    echo "Plese press enter."
    read
}

cd ~/.terminal-files/Homebrew

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


    waitEnter

cp ~/.terminal-files/zsh/.zshenv ~
cp -r ~/.terminal-files/zsh/ ~
cp ~/.terminal-files/Hyper/.hyper.js ~
cp ~/.terminal-files/Hyper/.hyper_plugins ~
touch ~/.hushlogin
cp ~/.terminal-files/Git/.gitconfig ~/.terminal-files/Git/.gitignore_global ~
cp -r ~/.terminal-files/Git/.ssh ~
cp ~/.terminal-files/Homebrew/Fonts/* ~/Library/Fonts

    waitEnter


waitInput "If enter \"y\", start installing Homebrew packages and apps."
echo "Please sigin in to App Store"
    sleep 3
open -a "App Store"
    waitEnter
brew bundle

waitInput "Do you want to install Xcode?"
mas install 497799835