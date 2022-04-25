# zsh
rm -r ~/.shell-files/zsh/.*
cp ~/.zshenv ~/.shell-files/zsh
cp -r ~/.zsh ~/.shell-files/zsh


# git
rm -f ~/.shell-files/Git/.*
cp ~/.gitconfig ~/.gitignore_global ~/.shell-files/Git
echo "Do you use 1Password? (y/n): "
read -q && (rm -f ~/.shell-files/Git/.ssh/1password/config && cp ~/.ssh/config ~/.shell-files/Git/.ssh/1password) || (rm -f ~/.shell-files/Git/.ssh/original/config && cp ~/.ssh/config ~/.shell-files/Git/.ssh/original)