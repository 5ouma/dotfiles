<h1 align="center">
  <picture>
    <source
      srcset="https://raw.githubusercontent.com/5ouma/dotfiles/main/.github/images/header/header-light.png"
      media="(prefers-color-scheme: light)"
    />
    <source
      srcset="https://raw.githubusercontent.com/5ouma/dotfiles/main/.github/images/header/header-dark.png"
      media="(prefers-color-scheme: dark)"
    />
    <!-- markdownlint-disable MD013 -->
    <img width=500px alt="header" src="https://raw.githubusercontent.com/5ouma/dotfiles/main/.github/images/header/header-light.png" />
  </picture>
</h1>

<div align="center">

**⚙ The most minimal and powerful dotfiles ever.** <br />
My config files and setup for CLI tools and GUI apps.

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/5ouma/dotfiles?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/5ouma/dotfiles?style=flat-square)
[![GitHub last commit](https://img.shields.io/github/last-commit/5ouma/dotfiles?style=flat-square)](https://github.com/5ouma/dotfiles/commit/HEAD)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/5ouma/dotfiles?style=flat-square)](https://github.com/5ouma/dotfiles/commits/main)
[![Test](https://img.shields.io/github/actions/workflow/status/5ouma/dotfiles/test.yml?label=test&style=flat-square)](https://github.com/5ouma/dotfiles/actions/workflows/test.yml)

</div>

<br /><br />

## 🔐 Requirements

- ### 🍎 macOS

  - **macOS** Big Sur `Version 11` or later
  - Intel or Apple Silicon Mac

- ### 🐧 Linux

  > ⚠️ Experimental Support

  - cURL, Git, and Zsh to run the [setup](../setup)
  - Compatible with these [Homebrew dependencies](https://docs.brew.sh/Homebrew-on-Linux#requirements)

<br /><br />

## 📥 Installation

Run one line [setup](../setup), see the [usage](#-usage) for the detail.

<br />

> _All configurations_
>
> ```shell
> zsh <(curl -sL dotup.vercel.app)
> ```

<br />

> _Just config files_
>
> ```shell
> zsh <(curl -sL dotup.vercel.app) --set
> ```

<br /><br />

## 📊 Usage

### `setup --help`

```shell
Usage: setup

⚙️ The most minimal and powerful dotfiles ever.

Flags:
  -h, --help    Print help information
  -y, --yes     Start without confirmation
  -s, --set     Set files to home directory
```

<br /><br />

## 🌄 Screenshots

|            |           Overview           |                  Vim                   |
| :--------: | :--------------------------: | :------------------------------------: |
| Light Mode |     ![Overview - Light]      |             ![Vim - Light]             |
| Dark Mode  |      ![Overview - Dark]      |             ![Vim - Dark]              |
|   Tools    | [fastfetch], [CodeWhisperer] | [lightline.vim], [NERDTree], [fzf.vim] |

[Overview - Light]: ./images/screenshots/light/overview.png
[Overview - Dark]: ./images/screenshots/dark/overview.png
[Vim - Light]: ./images/screenshots/light/vim.png
[Vim - Dark]: ./images/screenshots/dark/vim.png
[fastfetch]: https://github.com/fastfetch-cli/fastfetch
[CodeWhisperer]: https://aws.amazon.com/codewhisperer
[lightline.vim]: https://github.com/itchyny/lightline.vim
[NERDTree]: https://github.com/preservim/nerdtree
[fzf.vim]: https://github.com/junegunn/fzf.vim

<br /><br />

## 📝 Details

- ### 🍺 Package Manager: [`Homebrew`](https://brew.sh)

  ```shell
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

  > See packages in **[`Brewfile`]**
  > or on **[`Shell Commands`]**, **[`Software`]**, **[`Fonts`]** _(GitHub Star List)_

  [`Brewfile`]: ../data/Brewfile
  [`Shell Commands`]: https://github.com/stars/5ouma/lists/shell-commands
  [`Software`]: https://github.com/stars/5ouma/lists/software
  [`Fonts`]: https://github.com/stars/5ouma/lists/fonts

<br />

- ### 📼 Runtime Manager: [`rtx`](https://github.com/jdxcode/rtx)

  ```shell
  brew install rtx
  ```

<br />

- ### 📺 Terminal: [`iTerm2`](https://iterm2.com)

  ```shell
  brew install homebrew/cask-versions/iterm2-beta
  ```

  - #### 🖋 Font 1: [`Fira Code`](https://github.com/tonsky/FiraCode)

    ```shell
    brew install homebrew/cask-fonts/font-fira-code
    ```

  - #### ✒️ Font 2: [`HackGen35`](https://github.com/yuru7/hackgen)

    ```shell
    brew install homebrew/cask-fonts/font-hackgen font-hackgen-nerd
    ```

<br />

- ### 🐚 Shell: [`Zsh`](https://zsh.org)

  - #### 🔌 Plugin Manager: [`Sheldon`](https://github.com/rossmacarthur/sheldon)

    ```shell
    brew install sheldon
    ```

    > See plugins in **[`plugins.toml`]**
    > or on **[`Zsh Plugins`]** _(GitHub Star List)_

    [`plugins.toml`]: ../packages/sheldon/.config/sheldon/plugins.toml
    [`Zsh Plugins`]: https://github.com/stars/5ouma/lists/zsh-plugins

  - #### ❯ Theme: [`Powerlevel10k`](https://github.com/romkatv/powerlevel10k)

    ```shell
    sheldon add powerlevel10k --github romkatv/powerlevel10k --apply source
    ```

  - #### 🧠 Terminal Autocompletion: [`CodeWhisperer`](https://aws.amazon.com/codewhisperer)

    > _Formally [Fig](https://fig.io)_

    ```shell
    brew install codewhisperer
    ```

<br />

- ### 🖌 Terminal Editor: [`Vim`](https://www.vim.org)

  - #### 🚀 Plugin Manager: [`Jetpack`](https://github.com/5ouma/vim-jetpack)

    ```shell
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim" --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
    ```

    > See plugins in **[`plugins.vim`]**
    > or on **[`Vim Plugins`]** _(GitHub Star List)_

    [`plugins.vim`]: ../packages/vim/.config/vim/plugins.vim
    [`Vim Plugins`]: https://github.com/stars/5ouma/lists/vim-plugins

  - #### ✏️ Color Scheme: [`Pencil`](https://github.com/5ouma/vim-colors-pencil)

  - #### 💾 LSP: [`vim-lsp`](https://github.com/prabirshrestha/vim-lsp)

<br /><br />

## 🎨 ANSI Colors

|   \     |        Normal        |        Bright        |
| :-----: | :------------------: | :------------------: |
|  Black  | ![#000000] `#000000` | ![#686868] `#686868` |
|   Red   | ![#C51E14] `#C51E14` | ![#FD6F6B] `#FD6F6B` |
|  Green  | ![#1DC121] `#1DC121` | ![#67F86F] `#67F86F` |
| Yellow  | ![#C7C329] `#C7C329` | ![#FFFA72] `#FFFA72` |
|  Blue   | ![#0A2FC4] `#0A2FC4` | ![#6A76FB] `#6A76FB` |
| Magenta | ![#C839C5] `#C839C5` | ![#FD7CFC] `#FD7CFC` |
|  Cyan   | ![#20C5C6] `#20C5C6` | ![#68FDFE] `#68FDFE` |
|  White  | ![#C7C7C7] `#C7C7C7` | ![#FFFFFF] `#FFFFFF` |

[#000000]: https://via.placeholder.com/15/000000/000000.png
[#686868]: https://via.placeholder.com/15/686868/686868.png
[#C51E14]: https://via.placeholder.com/15/C51E14/C51E14.png
[#FD6F6B]: https://via.placeholder.com/15/FD6F6B/FD6F6B.png
[#1DC121]: https://via.placeholder.com/15/1DC121/1DC121.png
[#67F86F]: https://via.placeholder.com/15/67F86F/67F86F.png
[#C7C329]: https://via.placeholder.com/15/C7C329/C7C329.png
[#FFFA72]: https://via.placeholder.com/15/FFFA72/FFFA72.png
[#0A2FC4]: https://via.placeholder.com/15/0A2FC4/0A2FC4.png
[#6A76FB]: https://via.placeholder.com/15/6A76FB/6A76FB.png
[#C839C5]: https://via.placeholder.com/15/C839C5/C839C5.png
[#FD7CFC]: https://via.placeholder.com/15/FD7CFC/FD7CFC.png
[#20C5C6]: https://via.placeholder.com/15/20C5C6/20C5C6.png
[#68FDFE]: https://via.placeholder.com/15/68FDFE/68FDFE.png
[#C7C7C7]: https://via.placeholder.com/15/C7C7C7/C7C7C7.png
[#FFFFFF]: https://via.placeholder.com/15/FFFFFF/FFFFFF.png
