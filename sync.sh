# zsh
rm -r ~/.shell-files/zsh/.*
cp ~/.zshenv ~/.shell-files/zsh
cp -r ~/.zsh ~/.shell-files/zsh
rm ~/.shell-files/zsh/.zsh/.zsh_history

#Hyper
cp -f ~/.hyper.js ~/.shell-files/Hyper

# git
cp -f ~/.gitconfig ~/.gitignore_global ~/.shell-files/Git
echo "Do you use 1Password? (y/n): "
read -q && (rm -f ~/.shell-files/Git/.ssh/1password/config && cp ~/.ssh/config ~/.shell-files/Git/.ssh/1password) || (rm -f ~/.shell-files/Git/.ssh/original/config && cp ~/.ssh/config ~/.shell-files/Git/.ssh/original)