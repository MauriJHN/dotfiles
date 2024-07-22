# Installation

This document contains instructions on the complete setup for alacritty on different systems

## Windows (Using WSL)

1. Go to the releases page in the repository: [Alacritty Release Files](https://github.com/alacritty/alacritty/releases)
2. Download and install `Alacritty-v#.##.#-installer.msi` (hashtags are version numbers)

## Linux (Debian)

### Installing Cargo

Install cargo using the following guide: [install cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)

### Install Alacritty

_Notes:_

- Installation guide: [installing alacritty using cargo](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#cargo-installation)
- Do not install alacritty using: `cargo install alacritty`
- Build from source using the guide below
  - See `Building` section in guide
  - Make sure to configure entry icon and any other post-build features
