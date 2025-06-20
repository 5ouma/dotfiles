<h1 align="center">
  <picture>
    <source
      srcset="https://raw.githubusercontent.com/5ouma/dotfiles/main/docs/images/header/header-light.png"
      media="(prefers-color-scheme: light)"
    />
    <source
      srcset="https://raw.githubusercontent.com/5ouma/dotfiles/main/docs/images/header/header-dark.png"
      media="(prefers-color-scheme: dark)"
    />
    <!-- markdownlint-disable MD013 -->
    <img width=500px alt="header" src="https://raw.githubusercontent.com/5ouma/dotfiles/main/docs/images/header/header-light.png" />
  </picture>
</h1>

<div align="center">

**⚙ The most minimal and powerful dotfiles ever** <br />
My config files and setup for CLI tools and GUI apps.

<br />

[![Test](https://img.shields.io/github/actions/workflow/status/5ouma/dotfiles/test.yml?label=Test&style=flat-square)](https://github.com/5ouma/dotfiles/actions/workflows/test.yml)
[![Detail Test](https://img.shields.io/github/actions/workflow/status/5ouma/dotfiles/detail-test.yml?label=Detail%20Test&style=flat-square)](https://github.com/5ouma/dotfiles/actions/workflows/detail-test.yml)
[![pre-commit](https://img.shields.io/github/actions/workflow/status/5ouma/dotfiles/pre-commit.yml?label=pre-commit&style=flat-square)](https://github.com/5ouma/dotfiles/actions/workflows/pre-commit.yml)

![Repobeats Analytics Image](https://repobeats.axiom.co/api/embed/582e65bd5fb58fbbc0ecbb2947a391efde3d9516.svg)

</div>

<br /><br />

## 🔐 Requirements

- ### 🍎 macOS

  - macOS Sonoma `Version 14` or later
  - Apple Silicon Mac

- ### 🐧 Linux

  - cURL, Git, and Zsh to run the [setup](./setup)
  - Compatible with these [Homebrew dependencies](https://docs.brew.sh/Homebrew-on-Linux#requirements)

<br /><br />

## 📥 Installation

Run one line [setup](./setup), see the [usage](#-usage) for the detail.

<br />

> _All configurations_
>
> ```sh
> zsh <(curl https://dotup.deno.dev)
> ```

<br />

> _Just config files_
>
> ```sh
> zsh <(curl https://dotup.deno.dev) set
> ```

<br />

> _Vim config files_
>
> ```sh
> curl https://vimrc.deno.dev > "$HOME/.config/vim/vimrc"
> ```

<br /><br />

## 📊 Usage

### `setup help`

```sh
  ▌ Usage: setup

  │ ⚙️ The most minimal and powerful dotfiles ever.

  ▌ Commands:

  • help    Print help information
  • set     Set files to home directory

  ▌ Flags:

  • -y, --yes    Start without confirmation
```

<br /><br />

## 🌄 Screenshots

|            |      Overview       |                  Vim                   |
| :--------: | :-----------------: | :------------------------------------: |
| Light Mode | ![Overview - Light] |             ![Vim - Light]             |
| Dark Mode  | ![Overview - Dark]  |             ![Vim - Dark]              |
|   Tools    |     [fastfetch]     | [lightline.vim], [NERDTree], [fzf.vim] |

[Overview - Light]: ./images/screenshots/light/overview.png
[Overview - Dark]: ./images/screenshots/dark/overview.png
[Vim - Light]: ./images/screenshots/light/vim.png
[Vim - Dark]: ./images/screenshots/dark/vim.png
[fastfetch]: https://github.com/fastfetch-cli/fastfetch
[lightline.vim]: https://github.com/itchyny/lightline.vim
[NERDTree]: https://github.com/preservim/nerdtree
[fzf.vim]: https://github.com/junegunn/fzf.vim

<br /><br />

## 📝 Details

### 🍺 Package Manager: [`Homebrew`](https://brew.sh)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> See packages in **[`Brewfile`]**
> or on **[`Shell Commands`]**, **[`Software`]**, **[`Fonts`]** _(GitHub Star List)_

[`Brewfile`]: ./data/Brewfile
[`Shell Commands`]: https://github.com/stars/5ouma/lists/shell-commands
[`Software`]: https://github.com/stars/5ouma/lists/software
[`Fonts`]: https://github.com/stars/5ouma/lists/fonts

<br />

### 📼 Runtime Manager: [`mise`](https://github.com/jdx/mise)

```sh
brew install mise
```

<br />

### 👻 Terminal: [`Ghostty`](https://ghostty.org)

```sh
brew install ghostty
```

#### 🖋 ASCII Font: [`Fira Code`](https://github.com/tonsky/FiraCode)

```sh
brew install font-fira-code
```

#### ✒️ Japanese Font: [`HackGen35`](https://github.com/yuru7/hackgen)

```sh
brew install font-hackgen
```

#### 🕶️ Icon Font: [`Nerd Fonts`](https://www.nerdfonts.com)

```sh
brew install 5ouma/tap/font-nerd-fonts
```

<br />

### 🐚 Shell: [`Zsh`](https://zsh.org)

#### 🔌 Plugin Manager: [`Sheldon`](https://github.com/rossmacarthur/sheldon)

```sh
brew install sheldon
```

> See plugins in **[`plugins.toml`]**
> or on **[`Zsh Plugins`]** _(GitHub Star List)_

[`plugins.toml`]: ./config/sheldon/.config/sheldon/plugins.toml
[`Zsh Plugins`]: https://github.com/stars/5ouma/lists/zsh-plugins

#### ❯ Theme: [`Powerlevel10k`](https://github.com/romkatv/powerlevel10k)

```sh
sheldon add powerlevel10k --github romkatv/powerlevel10k --apply source
```

<br />

### 🖌 Terminal Editor: [`Vim`](https://www.vim.org)

#### 🚀 Plugin Manager: [`Jetpack`](https://github.com/5ouma/vim-jetpack)

```sh
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}/vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim" --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
```

> See plugins in **[`plugins.vim`]**
> or on **[`Vim Plugins`]** _(GitHub Star List)_

[`plugins.vim`]: ./config/vim/.config/vim/plugins.vim
[`Vim Plugins`]: https://github.com/stars/5ouma/lists/vim-plugins

#### ✏️ Color Scheme: [`Pencil`](https://github.com/5ouma/vim-colors-pencil)

#### 💾 LSP: [`vim-lsp`](https://github.com/prabirshrestha/vim-lsp)

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

[#000000]: https://placehold.co/15/000000/000000.svg
[#686868]: https://placehold.co/15/686868/686868.svg
[#C51E14]: https://placehold.co/15/C51E14/C51E14.svg
[#FD6F6B]: https://placehold.co/15/FD6F6B/FD6F6B.svg
[#1DC121]: https://placehold.co/15/1DC121/1DC121.svg
[#67F86F]: https://placehold.co/15/67F86F/67F86F.svg
[#C7C329]: https://placehold.co/15/C7C329/C7C329.svg
[#FFFA72]: https://placehold.co/15/FFFA72/FFFA72.svg
[#0A2FC4]: https://placehold.co/15/0A2FC4/0A2FC4.svg
[#6A76FB]: https://placehold.co/15/6A76FB/6A76FB.svg
[#C839C5]: https://placehold.co/15/C839C5/C839C5.svg
[#FD7CFC]: https://placehold.co/15/FD7CFC/FD7CFC.svg
[#20C5C6]: https://placehold.co/15/20C5C6/20C5C6.svg
[#68FDFE]: https://placehold.co/15/68FDFE/68FDFE.svg
[#C7C7C7]: https://placehold.co/15/C7C7C7/C7C7C7.svg
[#FFFFFF]: https://placehold.co/15/FFFFFF/FFFFFF.svg
