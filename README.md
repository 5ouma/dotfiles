# Install

Run git clone and setup.sh, then you will be able to set up by operation.

```shell
git clone git@github.com:5ouma/dotfiles.git ~/.dotfiles
source ~/.dotfiles/Setup/setup.sh
```

# zsh

## Theme

### <a href="https://github.com/romkatv/powerlevel10k"><b><b>Powerlevel10k</b></b></a> and edit colors.

```shell
brew install romkatv/powerlevel10k/powerlevel10k
# echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.dots/zsh/.zshrc
```

<br>

## Preview

| Preview 1                                    | Preview 2                                    |
| -------------------------------------------- | -------------------------------------------- |
| ![Preview 1](Images/Preview/Preview%201.png) | ![Preview 2](Images/Preview/Preview%202.png) |

<br>

## Settings

-   Using Japanese
-   Being able to show files named in Japanese
-   Moving directory without `cd` command
-   Turn on spell check
-   Search history started with the input character
-   Display kind of files when complemented
-   Being able to move with the cursor when complemented
-   Press `Shift+Tab` to go reverse over
-   Number of cases to save history at memory and history file
-   Share history data between launched zsh
-   Delete unnecessary spaces when history is saved
-   If input commands have already been saved in history, delete them from the older one
-   Coloring when `ls` command
-   Being able to do command line stacking

Separate by roll with .zshenv, .zprofile and .zshrc seeing [this site](https://kitakitabauer.hatenablog.com/entry/2016/09/13/173456).

<br>

## Plugins

### <a href="https://github.com/beeftornado/homebrew-rmtree"><b>rmtree</b></a>

```shell
brew tap beeftornado/rmtree
```

<br>

### <a href="https://github.com/zsh-users/zsh-syntax-highlighting"><b>zsh-syntax-highlighting</b></b></a>

```shell
brew install zsh-syntax-highlighting
```

<br>

### <a href="https://github.com/zsh-users/zsh-autosuggestions"><b>zsh-autosuggestions</b></a>

```shell
brew install zsh-autosuggestions
```

<br>

### <a href="https://github.com/zsh-users/zsh-completions"><b>zsh-completions</b></a>

(To erase "insecure directories" error, see [this](https://qiita.com/riku929hr/items/d2a15276e94bd2b11e75))

```shell
brew install zsh-completions
```

<br>

### <a href="https://fig.io"><b>Fig</b></a>

([Fig on GitHub](https://github.com/withfig))

```shell
brew install fig
```

<br>

### <b>ccat</b>

```shell
brew install ccat
```

<br>

### <b>glow</b>

```shell
brew install glow
```

<br>

### <b>lsd</b>

```shell
brew install lsd
```

<br>

# Vim

## Color Scheme

### <a href="https://github.com/preservim/vim-colors-pencil"><b>vim-colors-pencil</b></a> and edit colors.

<br>

## Settings

### General

-   Set the place of .vimrc and .viminfo
-   Set the text code to UTF-8
-   Not to create backup and swap files
-   Auto reload file editing when it's changed
-   Being able to open the file even buffer is editing
-   Show typing command to status
-   Turn off the beep sound

### Appearance

-   Show line number
-   Highlight the cursor line
-   Being able to move one more character after the end of lines
-   Change indent as smart indent
-   Highlight corresponding brackets
-   Always show the status line
-   Complement on the command line
-   Being able to move by showed line when the lines are folded
-   Turn on syntax highlight

### Tabs

-   Visible the invisible words
-   Change tab to spaces
-   Set tab to double space

### Search

-   If the searched sentences are lower case, search across all words
-   If it is contained in upper case, search only that ones
-   Hit when typing searching sentences
-   Go to the beginning word when searching for is end
-   Highlight searched words
-   Endhighlight by typing the ESC key several times

## Plugins

### <a href="https://github.com/airblade/vim-gitgutter"><b>vim-gitgutter</b></a>

```shell
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/start/vim-gitgutter
vim -u NONE -c "helptags vim-gitgutter/doc" -c q
```

<br>

### <a href="https://github.com/tpope/vim-commentary"><b>fugitivecommentary.vim</b></a>

```shell
git clone https://github.com/tpope/vim-commentary.git ~/.vim/pack/tpope/start/commentary
vim -u NONE -c "helptags commentary/doc" -c q
```

<br>

### <a href="https://github.com/tpope/vim-fugitive"><b>fugitive.vim</b></a>

```shell
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/tpope/start/fugitive
vim -u NONE -c "helptags fugitive/doc" -c q
```

<br>

### <a href="https://github.com/preservim/nerdtree"><b>The NERDTree</b></a>

```shell
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```

<br>

# Git

-   Ignore `.DS_Store` file to make `.gitignore_global` file and run
    ```shell
    git config --global core.excludesfile ~/.gitignore_global
    ```

<br>

# Homebrew

## Settings

-   Make Brewfile and move to dotfiles directory when running install, uninstall, rmtree, tap and untap correctly
