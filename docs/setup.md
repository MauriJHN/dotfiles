# Neovim Setup

This document contains a detailed step-by-step guide on how to setup neovim properly on any computer.

## Pre-requisites

1. Make sure you have an [ssh-key generated](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) for your system to communicate with github
2. (**Windows Only**) Install WSL using this guide: [Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
3. [Install Ubuntu on the WSL system](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10#1-overview)

## Main Steps

The following are a summary of the main steps needed for the complete setup:

1. Clone repository
2. Install alacritty
   1. Set up Nerd Font
   2. Set up theme
3. Install tmux in alacritty
   1. Install `tpm` package manager
   2. Install `nord` theme
4. Install fish
5. Install neovim and set up for plugins

## Downloading Repository

Anywhere in your system, execute the following command to clone the repository:

```shell
git clone git@github.com:MauriJHN/mauri-config.git $HOME/.config
```

## Installing Alacritty

- Install alacritty for different platforms using [this doc](alacritty/installation.md)
- Alacritty has a `.toml` configuration that needs to be placed in different locations depending on the platform

### Alacritty Configuration - WSL

For alacritty to work on Windows, copy and paste the `.toml` file from the repo location to `AppData/alacritty/` using the WSL terminal

In the following commands, replace `__username__` with your Windows username.

**Note**: you might need to create the directory for alacritty first: `mkdir /mnt/c/Users/__username__/AppData/Roaming/`

```shell
cp $HOME/.config/alacritty/alacritty.toml /mnt/c/Users/__username__/AppData/Roaming/alacritty/
```

### Alacritty Configuration - MacOS & Linux

For MacOS and Linux systems, leave the configuration file under `$HOME/.config/alacritty/alacritty.toml`

## Installing Tmux

1. Install fish and tmux:

   ```bash
    sudo apt-get update && sudo apt update
    sudo apt install fish tmux
   ```

2. Install the tpm package manager for tmux:

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

3. Reload the tmux configuration by pressing `Ctrl+b` and `Shift+I`

## Installing Neovim

Install neovim using this guide: [Neovim Installation](installation.md)