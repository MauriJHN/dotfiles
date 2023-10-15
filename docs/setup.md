# Neovim Setup

This document contains a detailed step-by-step guide on how to setup neovim properly on any computer.

## Linux (Also WSL)

### Installing WSL

Install WSL using this guide: [Install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

### Installing Neovim with Alacritty

1. Clone this repository to `$HOME/.config`:

   ```shell
   git clone git@github.com:MauriJHN/mauri-config.git $HOME/.config
   ```

2. Install alacritty using this guide: [Alacritty Installation](alacritty/installation.md)
3. Install neovim using this guide: [Neovim Installation](installation.md)
4. Install fish and tmux:

   ```bash
    sudo apt-get update && sudo apt update
    sudo apt install fish tmux
   ```

5. Install the tpm package manager for tmux:

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

6. Reload the tmux configuration by pressing `Ctrl+b` and `Shift+I`
