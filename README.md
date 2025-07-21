# Dotfiles

![Qtile screenshot](.files/qtile.png 'Qtile screenshot')

This is a collection of my dotfiles. These configuration files are based on Qtile. Feel free to use them as you like.

## Table of contents

- [Dotfiles](#dotfiles)
  - [Table of contents](#table-of-contents)
  - [Setup](#setup)
    - [1. Update the system](#1-update-the-system)
    - [2. Sign in to your GitHub account (Optional)](#2-sign-in-to-your-github-account-optional)
    - [3. Clone the repository and restore the dotfiles](#3-clone-the-repository-and-restore-the-dotfiles)
    - [4. Install the required packages](#4-install-the-required-packages)
    - [5. Git \& fish](#5-git--fish)
    - [6. Activate nvidia hybrid graphics](#6-activate-nvidia-hybrid-graphics)
    - [7. Work with multiple monitors](#7-work-with-multiple-monitors)
    - [8. Install the themes and icons](#8-install-the-themes-and-icons)
    - [9. Wallpapers](#9-wallpapers)
    - [10. Grub](#10-grub)
    - [11. SDDM](#11-sddm)
  - [Automatic restore script](#automatic-restore-script)
  - [Keybindings](#keybindings)
  - [Extra Configuration](#extra-configuration)

## Setup

First of all, I recommend you to use the Manjaro Xfce iso to use these dotfiles. If you want to download it, it's available [here](https://manjaro.org/products/download/x86).

### 1. Update the system

Before you start, make sure your system is up to date.

```bash
sudo pacman -Syu
# Or
sudo pamac update
```

### 2. Sign in to your GitHub account (Optional)

Generate a new SSH key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Once you've generate it, you must copy the public key and paste it in `https://github.com/settings/keys`.

### 3. Clone the repository and restore the dotfiles

To use these dotfiles, I encourage you to clone this repository like bare repository.

```bash
cd ~
git clone --bare git@github.com:aluissp/dotfiles.git .dotfiles
```

To make it easier to work with the dotfiles, you can define an alias in your shell configuration file.
Open `.bashrc` and add the following line:

```bash
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
```

After that, reboot your terminal or run `source ~/.bashrc` to apply the changes.

Now you can use the `dotfiles` alias to manage your dotfiles. To restore the dotfiles, you can use the following command:

```bash
dotfiles checkout -f --
```

Once you have restored the dotfiles, reboot your system to apply the changes.

### 4. Install the required packages

To install the required packages, you can use the following command:

```bash
sudo pacman -S --needed - < .pkgs
for x in $(< .aur-pkgs); do yay -S $x; done
```

### 5. Git & fish

You can customize the git prompt and activate fish shell.

```bash
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
&& mv git-prompt.sh .git-prompt.sh

chmod +x .git-prompt.sh
./.git-prompt.sh

sudo chsh $USER -s /usr/bin/fish
```

### 6. Activate nvidia hybrid graphics

If you have open source nvidia graphics you can skip this step, however, if you have another type of nvidia graphics you must install `optimus-manager-qt` and `optimus-manager`. Then, you need comment the following lines in `/etc/sddm.conf`:

```bash
# DisplayCommand=/usr/share/sddm/scripts/Xsetup
# DisplayStopCommand=/usr/share/sddm/scripts/Xstop
```

After that, reboot your system and open the `optimus-manager-qt` to activate the hybrid graphics. To apply the changes, reboot your system again.
If you have any problem, you can check the [official documentation](https://github.com/Askannz/optimus-manager?tab=readme-ov-file#kde)

### 7. Work with multiple monitors

If you have multiple monitors, you can use the `arandr` tool, simply run it and save the configuration like `~/.screenlayout/monitors.sh`. After that, reboot your system to apply the changes.

### 8. Install the themes and icons

There're many themes and icons that you can see [here](https://www.gnome-look.org/browse/). However, the themes and icons that I use are the following:

- Cursor: Bivata-Modern-Ice
- Theme: [Orchis-Dark](https://www.pling.com/p/1357889/)
- Icons: [Tela-dark](https://www.pling.com/p/1279924/)

Once you have downloaded, use the following commands to install them:

```bash
cd /usr/share/themes/
sudo mv ~/Downloads/Orchis.tar.xz .
sudo tar -xvf Orchis.tar.xz

cd /usr/share/icons/
sudo mv ~/Downloads/01-Tela.tar.xz .
sudo tar -xvf 01-Tela.tar.xz
```

Finally, you can use the `lxappearance` tool to apply the changes. Remember to reboot your system to apply the changes.

### 9. Wallpapers

By default there're some wallpapers. However, you can download more from [here](https://github.com/antoniosarosi/Wallpapers.git)
Or you can clone with git and use the nitrogen tool to apply the changes.

```bash
cd Pictures
git clone https://github.com/antoniosarosi/Wallpapers.git
nitrogen
```

### 10. Grub

There's a amazing tool to customize the grub. The `Grub Customizer` helps you to change the background, the colors, the fonts, etc. Open rofi and type `Grub Customizer` to open it.

### 11. SDDM

SDDM is a nice display manager. Open the `/etc/sddm.conf` and update this line to change the sddm theme:

```bash
[Theme]
# Current theme name
Current=Sugar-Candy # SDDM theme
```

I've applied the theme `sugar-candy`. If you want to change the background, open the configuration file `/usr/share/sddm/themes/Sugar-Candy/theme.conf`. And set the background like this:

```bash
# change this
Background="/usr/share/backgrounds/archlinux-login-backgrounds/att-05.jpg"
```

## Automatic restore script

To speed up the process of restoring the dotfiles, you can use the `.restore` script. This script will automatically restore the dotfiles, install the required packages, and set up the system interactively. To use it, simply run the following command:

```bash
bash .restore
```

## Keybindings

There's common keybindings that you can use:
| Key | Action |
| ----------------------- | -------------------------------- |
| **mod + j** | next window (down) |
| **mod + k** | next window (up) |
| **mod + shift + h** | decrease master |
| **mod + shift + l** | increase master |
| **mod + shift + j** | move window down |
| **mod + shift + k** | move window up |
| **mod + shift + f** | toggle floating |
| **mod + tab** | change layout |
| **mod + [1-9]** | Switch to workspace N (1-9) |
| **mod + shift + [1-9]** | Send Window to workspace N (1-9) |
| **mod + period** | Focus next monitor |
| **mod + comma** | Focus previous monitor |
| **mod + w** | kill window |
| **mod + ctrl + r** | restart wm |
| **mod + ctrl + q** | quit |

## Extra Configuration

You can check this [file](.files/extra-config.md) to configure tools that is useful to work.
