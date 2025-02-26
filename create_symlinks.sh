#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR=$(pwd)

# Function to create a symbolic link
create_symlink() {
    TARGET=$1
    LINK_NAME=$2

    # Check if the target file/directory exists
    if [ ! -e "$TARGET" ]; then
        echo "Target $TARGET does not exist."
        return
    fi

    # Create the parent directory of the symlink if it does not exist
    mkdir -p "$(dirname "$LINK_NAME")"

    # Remove existing symlink or file
    if [ -L "$LINK_NAME" ]; then
        rm "$LINK_NAME"
    elif [ -e "$LINK_NAME" ]; then
        echo "File $LINK_NAME already exists and is not a symlink. Skipping."
        return
    fi

    # Create the symlink
    ln -s "$TARGET" "$LINK_NAME"
    echo "Created symlink: $LINK_NAME -> $TARGET"
}

# Alacritty
create_symlink "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
create_symlink "$DOTFILES_DIR/alacritty/mau_theme.toml" ~/.config/alacritty/mau_theme.toml
create_symlink "$DOTFILES_DIR/alacritty/nord.toml" ~/.config/alacritty/nord.toml

# Tmux
create_symlink "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
sudo ln -s "$DOTFILES_DIR/tmux/devsplit.sh" /usr/local/bin/devsplit

# Neovim
create_symlink "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/init.lua

# Create symlinks for Neovim additional configurations, if they exist
create_symlink "$DOTFILES_DIR/nvim/lua" ~/.config/nvim/lua
create_symlink "$DOTFILES_DIR/nvim/colors" ~/.config/nvim/colors
create_symlink "$DOTFILES_DIR/nvim/after/plugin" ~/.config/nvim/after/plugin

# Fish
create_symlink "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/config.fish
create_symlink "$DOTFILES_DIR/fish/functions" ~/.config/fish/functions

echo "All symlinks created successfully."

