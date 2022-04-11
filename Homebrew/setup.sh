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
# xcode-select --install

sleep 3

open https://brew.sh/index_ja
waitInput "Is commadnd correct?\n/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
waitEnter
# brew doctor
waitEnter
# brew install mas

waitInput "If enter \"y\", start installing Homebrew packages and apps."
# brew bundle

waitEnter

# cp ~/.terminal-files/zsh/.zshenv ~
# cp -r ~/.terminal-files/zsh/ ~

# cp ~/.terminal-files/Hyper/.hyper.js ~
# cp ~/.terminal-files/Hyper/.hyper_plugins ~

# touch ~/.hushlogin

# cp ~/.terminal-files/Git/.gitconfig ~/.terminal-files/Git/.gitignore_global ~
# cp -r ~/.terminal-files/Git/.ssh ~