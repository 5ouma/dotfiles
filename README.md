<br>

<div align="center">
  <img width=500 src="https://user-images.githubusercontent.com/101255979/187659228-d6105c84-d0e0-431c-8034-c132db2ca3c5.png#gh-light-mode-only" alt="DOTFILES - light">
  <img width=500 src="https://user-images.githubusercontent.com/101255979/187659366-ccd98f00-6ab3-4aa3-813b-46fdbbc3252a.png#gh-dark-mode-only" alt="DOTFILES - dark">
  <p><b>The most minimal and powerful dotfiles ever.</b><br>
  My config files and setup for CLI tools and GUI apps.</p>
</div>

<br><br>

## 🔐 Requirements

- **macOS** Big Sur `Version 11` or later
- Intel or Apple Silicon Mac

<br><br>

## 📥 Installation

Run [setup script](https://github.com/5ouma/dotfiles/blob/HEAD/setup) with `curl`, then you will be able to set up by operation.

```shell
zsh <(curl -sL dotup.vercel.app)
```

<br><br>

## 📊 Usage

### `setup --help`

```
Usage: setup

💻 The most minimal and powerful dotfiles ever.

Flags:
  -h, --help    Print help information
  -y, --yes     Start without confirming
  -s, --set     Set files to home directory
```

<br><br>

## 🌄 Screenshots

|            |                                                         Overview                                                         |                                                   Interacting with zsh                                                   | Vim with [NERDTree](https://github.com/preservim/nerdtree)                                                               |
| :--------: | :----------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------: | ------------------------------------------------------------------------------------------------------------------------ |
| Light Mode | ![Screenshot 1 - Light](https://raw.githubusercontent.com/5ouma/dotfiles/HEAD/images/screenshots/light/screenshot-1.png) | ![Screenshot 2 - Light](https://raw.githubusercontent.com/5ouma/dotfiles/HEAD/images/screenshots/light/screenshot-2.png) | ![Screenshot 3 - Light](https://raw.githubusercontent.com/5ouma/dotfiles/HEAD/images/screenshots/light/screenshot-3.png) |
| Dark Mode  |  ![Screenshot 1 - Dark](https://raw.githubusercontent.com/5ouma/dotfiles/HEAD/images/screenshots/dark/screenshot-1.png)  |  ![Screenshot 2 - Dark](https://raw.githubusercontent.com/5ouma/dotfiles/HEAD/images/screenshots/dark/screenshot-2.png)  | ![Screenshot 3 - Dark](https://raw.githubusercontent.com/5ouma/dotfiles/HEAD/images/screenshots/dark/screenshot-3.png)   |

<br><br>

## 📝 Detail

- ### Package Manager : [🍺 `Homebrew`](https://brew.sh)
  ```shell
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

<br>

- ### Runtime Manager : [📼 `rtx`](https://github.com/jdxcode/rtx)
  ```shell
  brew install jdxcode/tap/rtx
  ```

<br>

- ### Terminal : [📺 `iTerm2`](https://iterm2.com)

  ```shell
  brew install iterm2-beta
  ```

  - #### Font 1 : [🖋 `Fira Code`](https://github.com/tonsky/FiraCode)

    ```shell
    brew install font-firacode
    ```

  - #### Font 2 : [✒️ `HackGen35`](https://github.com/yuru7/hackgen)
    ```shell
    brew install font-hackgen font-hackgen-nerd
    ```

<br>

- ### Shell : [🐚 `Zsh`](https://zsh.org)

  - #### Plugin Manager : [🔌 `Fig`](https://fig.io)

    ```shell
    brew install fig
    ```

  - #### Theme : [❯ `Powerlevel10k`](https://github.com/romkatv/powerlevel10k)

    [![Powerlvel10k on Fig](https://fig.io/badges/install-with-fig.svg)](https://fig.io/plugins/other/powerlevel10k)

    ```shell
    fig plugins add powerlevel10k
    ```

<br>

- ### Terminal Editor : 🖌 `Vim`

  - #### Plugin Manager : [🚀 `Jetpack`](https://github.com/tani/vim-jetpack)

    ```shell
    curl -fLo ~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
    ```

  - #### Color Scheme : [✏️ `Pencil`](https://github.com/preservim/vim-colors-pencil)

<br><br>

## 📲 Other Apps

**Managing with [🍺 `Brewfile`](datas/Brewfile)**

<br><br>

## 🎨 ANSI Colors

|   \     |                                 Normal                                 |                                 Bright                                 |
| :-----: | :--------------------------------------------------------------------: | :--------------------------------------------------------------------: |
|  Black  | ![#000000](https://via.placeholder.com/15/000000/000000.png) `#000000` | ![#686868](https://via.placeholder.com/15/686868/686868.png) `#686868` |
|   Red   | ![#C51E14](https://via.placeholder.com/15/C51E14/C51E14.png) `#C51E14` | ![#FD6F6B](https://via.placeholder.com/15/FD6F6B/FD6F6B.png) `#FD6F6B` |
|  Green  | ![#1DC121](https://via.placeholder.com/15/1DC121/1DC121.png) `#1DC121` | ![#67F86F](https://via.placeholder.com/15/67F86F/67F86F.png) `#67F86F` |
| Yellow  | ![#C7C329](https://via.placeholder.com/15/C7C329/C7C329.png) `#C7C329` | ![#FFFA72](https://via.placeholder.com/15/FFFA72/FFFA72.png) `#FFFA72` |
|  Blue   | ![#0A2FC4](https://via.placeholder.com/15/0A2FC4/0A2FC4.png) `#0A2FC4` | ![#6A76FB](https://via.placeholder.com/15/6A76FB/6A76FB.png) `#6A76FB` |
| Magenta | ![#C839C5](https://via.placeholder.com/15/C839C5/C839C5.png) `#C839C5` | ![#FD7CFC](https://via.placeholder.com/15/FD7CFC/FD7CFC.png) `#FD7CFC` |
|  Cyan   | ![#20C5C6](https://via.placeholder.com/15/20C5C6/20C5C6.png) `#20C5C6` | ![#68FDFE](https://via.placeholder.com/15/68FDFE/68FDFE.png) `#68FDFE` |
|  White  | ![#C7C7C7](https://via.placeholder.com/15/C7C7C7/C7C7C7.png) `#C7C7C7` | ![#FFFFFF](https://via.placeholder.com/15/FFFFFF/FFFFFF.png) `#FFFFFF` |
