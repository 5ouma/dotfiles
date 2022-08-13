<br>

<h1 align="center">dotfiles</h1>
<p align="center">This is a repository that includes my zsh and vim and other settings, plugins, etc and setup.</p>

<br><br>

## 📲 Install

Run git clone and [setup.sh](https://github.com/5ouma/dotfiles/blob/HEAD/Setup/setup.sh), then you will be able to set up by operation.

```shell
git clone git@github.com:5ouma/dotfiles.git ~/.dotfiles
source ~/.dotfiles/Setup/setup.sh
```

<br><br>

## 🌄 Preview

|            | Overview                                                   | Interacting with zsh                                       | Vim with [NERDTree](https://github.com/preservim/nerdtree) |
| ---------- | ---------------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------- |
| Light Mode | ![Preview 1 - Light](Images/Preview/Light/Preview%201.png) | ![Preview 2 - Light](Images/Preview/Light/Preview%202.png) | ![Preview 3 - Light](Images/Preview/Light/Preview%203.png) |
| Dark Mode  | ![Preview 1 - Dark](Images/Preview/Dark/Preview%201.png)   | ![Preview 2 - Dark](Images/Preview/Dark/Preview%202.png)   | ![Preview 3 - Dark](Images/Preview/Dark/Preview%203.png)   |

<br><br>

## 💾 zsh

### 🪄 Theme

#### <a href="https://github.com/romkatv/powerlevel10k"><b><b>Powerlevel10k</b></b></a> and edit colors.

<a href="https://fig.io/plugins/other/powerlevel10k" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

```shell
fig plugins add powerlevel10k
```

<br>

### 🍽 Settings

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

### 📥 Plugins

#### <a href="https://fig.io"><b>Fig</b></a>

([Fig on GitHub](https://github.com/withfig))

```shell
brew install fig
```

-   #### <a href="https://github.com/zsh-users/zsh-syntax-highlighting"><b>zsh-syntax-highlighting</b></b></a>

    <a href="https://fig.io/plugins/color/zsh-syntax-highlighting" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

    ```shell
    fig plugins add zsh-syntax-highlighting
    ```

-   #### <a href="https://github.com/zsh-users/zsh-autosuggestions"><b>zsh-autosuggestions</b></a>

    <a href="https://fig.io/plugins/completion/zsh-autosuggestions" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

    ```shell
    fig plugins add zsh-autosuggestions
    ```

-   #### <a href="https://github.com/zsh-users/zsh-completions"><b>zsh-completions</b></a>

    ( To erase "insecure directories" error, see [this](https://qiita.com/riku929hr/items/d2a15276e94bd2b11e75) )

    <a href="https://fig.io/plugins/completion/zsh-completions" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

    ```shell
    fig plugins add zsh-completions
    ```

-   #### <a href="https://github.com/hlissner/zsh-autopair"><b>zsh-autopair</b></a>

    <a href="https://fig.io/plugins/other/zsh-autopair_hlissner" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

    ```shell
    fig plugins add zsh-autopair_hlissner
    ```

-   #### <a href="https://github.com/MichaelAquilina/zsh-you-should-use"><b>zsh-you-should-use</b></a>

    <a href="https://app.fig.io/plugins/zsh-you-should-use_MichaelAquilina" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

    ```shell
    fig plugins add zsh-you-should-use_MichaelAquilina
    ```

-   #### <a href="https://github.com/sharkdp/bat"><b>bat</b></a>

    ```shell
    brew install bat
    ```

-   #### <a href="https://github.com/Canop/broot"><b>Broot</b></a>

    ```shell
    brew install broot
    ```

-   #### <a href="https://github.com/dominikwilkowski/cfonts"><b>CFONTS</b></a>

    ```shell
    brew install cfonts
    ```

-   #### <a href="https://github.com/sindresorhus/dark-mode"><b>dark-mode</b></a>

    ```shell
    brew install dark-mode
    ```

-   #### <a href="https://github.com/junegunn/fzf"><b>fzf</b></a>

    ```shell
    brew install fzf
    ```

-   #### <a href="https://github.com/svenstaro/genact"><b>genact</b></a>

    ```shell
    brew install genact
    ```

-   #### <a href="https://github.com/charmbracelet/glow"><b>glow</b></a>

    ```shell
    brew install glow
    ```

-   #### <a href="https://github.com/Ryu0118/Kusa"><b>Kusa</b></a>

    ```shell
    brew install Ryu0118/Kusa/kusa
    ```

-   #### <a href="https://github.com/Peltoche/lsd"><b>lsd</b></a>

    ```shell
    brew install lsd
    ```

-   #### <a href="https://github.com/rgcr/m-cli"><b>m-cli</b></a>

    ```shell
    brew install m-cli
    ```

-   #### <a href="https://github.com/sharkdp/pastel"><b>pastel</b></a>

    ```shell
    brew install pastel
    ```

-   #### <a href="https://github.com/Aloxaf/silicon"><b>Silicon</b></a>

    ```shell
    brew install silicon
    ```

-   #### <a href="https://github.com/XAMPPRocky/tokei"><b>tokei</b></a>

    ```shell
    brew install tokei
    ```

-   #### <a href="https://github.com/ali-rantakari/trash"><b>trash</b></a>

    ```shell
    brew install trash
    ```

<br><br>

## 📝 Vim

### 🪄 Color Scheme

#### <a href="https://github.com/preservim/vim-colors-pencil"><b>vim-colors-pencil</b></a> and edit colors.

<br>

### 🍽 Settings

#### General

-   Set the place of .vimrc and .viminfo
-   Set the text code to UTF-8
-   Not to create backup and swap files
-   Auto reload file editing when it's changed
-   Being able to open the file even buffer is editing
-   Show typing command to status
-   Turn off the beep sound
-   Unlimited undo
-   Share clipboard with OS
-   Click to move the cursor

#### Appearance

-   Show line number
-   Highlight the cursor line
-   Being able to move one more character after the end of lines
-   Change indent as smart indent
-   Highlight corresponding brackets
-   Always show the status line
-   Complement on the command line
-   Being able to move by showed line when the lines are folded
-   Turn on syntax highlight

#### Tabs

-   Visible the invisible words
-   Change tab to spaces
-   Set tab to double space

#### Search

-   If the searched sentences are lower case, search across all words
-   If it is contained in upper case, search only that ones
-   Hit when typing searching sentences
-   Go to the beginning word when searching for is end
-   Highlight searched words
-   Endhighlight by typing the ESC key several times

<br>

### 📥 Plugins

vim-jetpack, a plugin manager, is already installed in .vim/autoload, so you don't need to install it.
But you have to run this command on vim screen.

```vim
Jetpack
```

#### <a href="https://github.com/tani/vim-jetpack"><b>vim-jetpack</b></a>

```shell
curl -fLo ~/.vim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/autoload/jetpack.vim
```

-   #### <a href="https://github.com/airblade/vim-gitgutter"><b>vim-gitgutter</b></a>

    Add `Jetpack 'airblade/vim-gitgutter'` to your .vimrc file.

-   #### <a href="https://github.com/b4b4r07/vim-shellutils"><b>vim-shellutils</b></a>

    Add `Jetpack 'b4b4r07/vim-shellutils'` to your .vimrc file.

-   #### <a href="https://github.com/bronson/vim-trailing-whitespace"><b>vim-trailing-whitespace</b></a>

    Add `Jetpack 'bronson/vim-trailing-whitespace'` to your .vimrc file.

-   #### <a href="https://github.com/cohama/lexima.vim"><b>lexima.vim</b></a>

    Add `Jetpack 'cohama/lexima.vim'` to your .vimrc file.

-   #### <a href="https://github.com/itchyny/lightline.vim"><b>lightline.vim</b></a>

    Add `Jetpack 'itchyny/lightline.vim'` to your .vimrc file.

-   #### <a href="https://github.com/mbbill/undotree"><b>Undotree</b></a>

    Add `Jetpack 'mbbill/undotree'` to your .vimrc file.

-   #### <a href="https://github.com/phodge/vim-shell-command"><b>vim-shell-command</b></a>

    Add `Jetpack 'phodge/vim-shell-command'` to your .vimrc file

-   #### <a href="https://github.com/matze/vim-move"><b>move</b></a>

    Add `Jetpack 'matze/vim-move'` to your .vimrc file

-   #### <a href="https://github.com/preservim/nerdtree"><b>The NERDTree</b></a>

    Add `Jetpack 'preservim/nerdtree'` to your .vimrc file

-   #### <a href="https://github.com/reireias/vim-cheatsheet"><b>vim-cheatsheet</b></a>

    Add `Jetpack 'reireias/vim-cheatsheet'` to your .vimrc file

-   #### <a href="https://github.com/ryanoasis/vim-devicons"><b>vim-devicons</b></a>

    Add `Jetpack 'ryanoasis/vim-devicons'` to your .vimrc file

-   #### <a href="https://github.com/thinca/vim-quickrun"><b>quickrun.vim</b></a>

    Add `jetpack 'thinca/vim-quickrun'` to your .vimrc file

-   #### <a href="https://github.com/tpope/vim-commentary"><b>vim-commentary.vim</b></a>

    Add `Jetpack 'tpope/vim-commentary'` to your .vimrc file

-   #### <a href="https://github.com/tpope/vim-fugitive"><b>fugitive.vim</b></a>

    Add `Jetpack 'tpope/vim-fugitive'` to your .vimrc file

-   #### <a href="https://github.com/tpope/vim-surround"><b>vim-surround</b></a>

    Add `Jetpack 'tpope/vim-surround'` to your .vimrc file

-   #### <a href="https://github.com/vim-scripts/vim-auto-save"><b>AutoSave</b></a>

    Add `Jetpack 'vim-scripts/vim-auto-save'` to your .vimrc file

-   #### <a href="https://github.com/Xuyuanp/nerdtree-git-plugin"><b>NERDTree-git-plugin</b></a>

    Add `Jetpack 'Xuyuanp/nerdtree-git-plugin'` to your .vimrc file

<br><br>

## 🐙 Git

### 🍽 Settings

-   Ignore `.DS_Store` file to make `.gitignore_global` file and run
    ```shell
    git config --global core.excludesfile ~/.gitignore_global
    ```
-   The alias to commit temporary with Vim.

<br>

### 📥 Plugins

-   #### <a href="https://github.com/wfxr/forgit"><b>forgit</b></a>

    <a href="https://fig.io/plugins/other/forgit" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg"/></a>

    ```shell
    fig plugins add forgit
    ```

-   #### <a href="https://github.com/paulirish/git-open"><b>git-open</b></a>

    ```shell
    brew install git-open
    ```

-   #### <a href="https://github.com/extrawurst/gitui"><b>GitUI</b></a>

    ```shell
    brew install gitui
    ```

-   #### <a href="https://github.com/o2sh/onefetch"><b>onefetch</b></a>

    ```shell
    brew install onefetch
    ```

-   #### <a href="https://github.com/Bhupesh-V/ugit"><b>ugit</b></a>

    ```shell
    brew install ugit
    ```

<br><br>

## 🍺 Homebrew

### 🍽 Settings

-   Make Brewfile and move to dotfiles directory when running install, uninstall, rmtree, tap and untap correctly

<br>

### 📥 Plugins

-   #### <a href="https://github.com/beeftornado/homebrew-rmtree"><b>rmtree</b></a>

    ```shell
    brew tap beeftornado/rmtree
    ```

-   #### <a href="https://github.com/Homebrew/homebrew-autoupdate"><b>Homebrew Autoupdate</b></a>

    ```shell
    brew tap homebrew/autoupdate
    brew autoupdate start
    ```
