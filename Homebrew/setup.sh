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

echo "Please download MesloLGS NF font"
    sleep 3
open https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
open https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
open https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
open https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
    waitEnter

waitInput "If enter \"y\", start installing Homebrew packages and apps."
echo "Please sigin in to App Store"
    sleep 3
open -a "App Store"
    waitEnter
brew bundle

    waitEnter

cp ~/.terminal-files/zsh/.zshenv ~
cp -r ~/.terminal-files/zsh/ ~

cp ~/.terminal-files/Hyper/.hyper.js ~
cp ~/.terminal-files/Hyper/.hyper_plugins ~

touch ~/.hushlogin

cp ~/.terminal-files/Git/.gitconfig ~/.terminal-files/Git/.gitignore_global ~
cp -r ~/.terminal-files/Git/.ssh ~

waitInput "Do you want to install Xcode?"
mas install 497799835