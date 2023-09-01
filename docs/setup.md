# Neovim Setup

This document contains a detailed step-by-step guide on how to setup neovim properly on any computer.

## On Windows Linux Subsystem

1. Install WSL using this guide: [Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
2. Clone this repository to `$HOME/.config`:

   ```shell
   git clone git@github.com:MauriJHN/mauri-config.git $HOME/.config
   ```

3. Install alacritty using this guide: [Alacritty Installation](alacritty/installation.md)
4. Install neovim using this guide: [Neovim Installation](installation.md)
5. Install fish and tmux:

   ```bash
    sudo apt-get update && sudo apt update
    sudo apt install fish tmux
   ```
6. Install the tpm package manager for tmux:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```