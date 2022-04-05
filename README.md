# Theme

[Powerlevel10k](https://github.com/romkatv/powerlevel10k) and edit color.

# Settings

-   Using Japanese
-   Be able to show files named by japanese
-   Moving directory without `cd` command
-   Spell check
-   Search history started with input character
-   Display kind of files when complemented
-   Be able to move with cursor when complemented
-   Press `Shift+Tab` to go reverse over
-   Number of cases to save history at memory and history file
-   Share history data between launched zsh
-   Delete unnecessary spaces when history is saved
-   If input commands have already saved in history, delete from older one
-   Coloring when `ls` command

# Plugins

-   [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
-   [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
-   [zsh-completions](https://github.com/zsh-users/zsh-completions)
    (To erase "insecure directories" error, see [this](https://qiita.com/riku929hr/items/d2a15276e94bd2b11e75))
-   tree
    (`brew install tree`)

# Git Settings

-   Ignore `.DS_Store` file to make `.gitignore_global` file and run
    ```shell
    git config --global core.excludesfile ~/.gitignore_global
    ```
