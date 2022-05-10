# Theme

<details><summary><a href="https://github.com/romkatv/powerlevel10k">Powerlevel10k</a> and edit color.</summary>

```shell
brew install romkatv/powerlevel10k/powerlevel10k
# echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.dots/zsh/.zshrc
```

</details>

# Preview

| Preview 1                                    | Preview 2                                    |
| -------------------------------------------- | -------------------------------------------- |
| ![Preview 1](Images/Preview/Preview%201.png) | ![Preview 2](Images/Preview/Preview%202.png) |

# Settings

-   Using Japanese
-   Be able to show files named in Japanese
-   Moving directory without `cd` command
-   Spell check
-   Search history started with the input character
-   Display kind of files when complemented
-   Be able to move with cursor when complemented
-   Press `Shift+Tab` to go reverse over
-   Number of cases to save history at memory and history file
-   Share history data between launched zsh
-   Delete unnecessary spaces when history is saved
-   If input commands have already been saved in history, delete them from the older one
-   Coloring when `ls` command

Separate by roll with .zshrc, .zshenv, .zprofile seeing [this site](https://kitakitabauer.hatenablog.com/entry/2016/09/13/173456).

# Plugins

<details><summary><a href="https://github.com/beeftornado/homebrew-rmtree">rmtree</a></summary>

```shell
brew tap beeftornado/rmtree
```

</details>

<details><summary><a href="https://github.com/zsh-users/zsh-syntax-highlighting">zsh-syntax-highlighting</a></summary>

```shell
brew install zsh-syntax-highlighting
```

</details>

<details><summary><a href="https://github.com/zsh-users/zsh-autosuggestions">zsh-autosuggestions</a></summary>

```shell
brew install zsh-autosuggestions
```

</details>

<details><summary><a href="https://github.com/zsh-users/zsh-completions">zsh-completions</a>

(To erase "insecure directories" error, see [this](https://qiita.com/riku929hr/items/d2a15276e94bd2b11e75))</summary>

```shell
brew install zsh-completions
```

</details>

<details><summary><a href="https://fig.io">Fig</a>

([Fig on GitHub](https://github.com/withfig))</summary>

```shell
brew install fig
```

</details>

<details><summary>tree</summary>

```shell
brew install tree
```

</details>

# Git Settings

-   Ignore `.DS_Store` file to make `.gitignore_global` file and run
    ```shell
    git config --global core.excludesfile ~/.gitignore_global
    ```
