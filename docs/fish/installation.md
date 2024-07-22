# Fish Installation Guide

## Debian

1. Run the following command to install the fish shell

   ```bash
   sudo apt update && sudo apt install fish
   ```

2. Run the following command to set fish as the default shell for alacritty:

   ```bash
   echo "/usr/local/bin/fish" >> /etc/shells &&
   chsh -s $(which fish)
   ```

3. Make sure to handle the exports inside `$HOME/.config/config.fish` by installing all the required packages and setting their location respectively
