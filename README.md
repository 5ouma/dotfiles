# Install

Run git clone and setup.sh, then you will be able to set up by operation.

```shell
git clone git@github.com:5ouma/dotfiles.git ~/.dotfiles
source ~/.dotfiles/Setup/setup.sh
```

# zsh

## Theme

### <a href="https://github.com/romkatv/powerlevel10k"><b><b>Powerlevel10k</b></b></a> and edit colors.

Add Powerlevel10k with Fig.

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

### <a href="https://fig.io"><b>Fig</b></a>

([Fig on GitHub](https://github.com/withfig))

```shell
brew install fig
```

<br>

### <a href="https://github.com/zsh-users/zsh-syntax-highlighting"><b>zsh-syntax-highlighting</b></b></a>

Add with with Fig.

<br>

### <a href="https://github.com/zsh-users/zsh-autosuggestions"><b>zsh-autosuggestions</b></a>

Add this with Fig.

<br>

### <a href="https://github.com/zsh-users/zsh-completions"><b>zsh-completions</b></a>

(To erase "insecure directories" error, see [this](https://qiita.com/riku929hr/items/d2a15276e94bd2b11e75))

Add this with Fig.

<br>

### <a href="https://github.com/djui/alias-tips"><b>alias-tips</b></a>

Add this with Fig.

<br>

### <a href="https://github.com/owenthereal/ccat"><b>ccat</b></a>

```shell
brew install ccat
```

<br>

### <a href="https://github.com/charmbracelet/glow"><b>glow</b></a>

```shell
brew install glow
```

<br>

### <a href="https://github.com/Peltoche/lsd"><b>lsd</b></a>

```shell
brew install lsd
```

<br>

### <a href="https://github.com/XAMPPRocky/tokei"><b>tokei</b></a>

```shell
brew install tokei
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

vim-jetpack, a plugin manager, is already installed in .vim/autoload, so you don't need to install it.
But you have to run this command on vim screen.

```vim
Jetpack
```

### <a href="https://github.com/tani/vim-jetpack"><b>vim-jetpack</b></a>

```shell
curl -fLo ~/.vim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim
```

<br>

### <a href="https://github.com/airblade/vim-gitgutter"><b>vim-gitgutter</b></a>

Add `Jetpack 'airblade/vim-gitgutter'` to your .vimrc file.

<br>

### <a href="https://github.com/b4b4r07/vim-shellutils"><b>vim-shellutils</b></a>

Add `Jetpack 'b4b4r07/vim-shellutils'` to your .vimrc file.

<br>

### <a href="https://github.com/bronson/vim-trailing-whitespace"><b>vim-trailing-whitespace</b></a>

Add `Jetpack 'bronson/vim-trailing-whitespace'` to your .vimrc file.

<br>

### <a href="https://github.com/cohama/lexima.vim"><b>lexima.vim</b></a>

Add `Jetpack 'cohama/lexima.vim'` to your .vimrc file.

<br>

### <a href="https://github.com/mbbill/undotree"><b>Undotree</b></a>

Add `Jetpack 'mbbill/undotree'` to your .vimrc file.

<br>

### <a href="https://github.com/phodge/vim-shell-command"><b>vim-shell-command</b></a>

Add `Jetpack 'phodge/vim-shell-command'` to your .vimrc file

<br>

### <a href="https://github.com/preservim/nerdtree"><b>The NERDTree</b></a>

Add `Jetpack 'preservim/nerdtree'` to your .vimrc file

<br>

### <a href="https://github.com/reireias/vim-cheatsheet"><b>vim-cheatsheet</b></a>

Add `Jetpack 'reireias/vim-cheatsheet'` to your .vimrc file

<br>

### <a href="https://github.com/thinca/vim-quickrun"><b>quickrun.vim</b></a>

add `jetpack 'thinca/vim-quickerun'` to your .vimrc file

<br>

### <a href="https://github.com/tpope/vim-commentary"><b>vim-commentary.vim</b></a>

Add `Jetpack 'tpope/vim-commentary'` to your .vimrc file

<br>

### <a href="https://github.com/tpope/vim-fugitive"><b>fugitive.vim</b></a>

Add `Jetpack 'tpope/vim-fugitive'` to your .vimrc file

<br>

### <a href="https://github.com/tpope/vim-surround"><b>vim-surround</b></a>

Add `Jetpack 'tpope/vim-surround'` to your .vimrc file

<br>

### <a href="https://github.com/vim-scripts/vim-auto-save"><b>AutoSave</b></a>

Add `Jetpack 'vim-scripts/vim-auto-save'` to your .vimrc file

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

## Plugins

### <a href="https://github.com/beeftornado/homebrew-rmtree"><b>rmtree</b></a>

```shell
brew tap beeftornado/rmtree
```

<br>
