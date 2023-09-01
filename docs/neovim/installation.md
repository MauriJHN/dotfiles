# Neovim Preferred Installation

- This installation is preferred as it builds the editor straight from the source code
- This installation is one of the quickest and safest

## Installation nvim Via Build (Linux/UNIX)

**These steps are as of: 2023-01-29**

Follow the instructions outlined [here](https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start)

Or for a quickstart, follow these steps:

1. Change to your home directory
2. Install all the pre-requisites:
   ```bash
   sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
   ```

3. Clone or update the neovim project in your development directory: 
   ```bash
   # bash
   sudo git clone https://github.com/neovim/neovim /usr/local/lib/nvim/ && cd /usr/local/lib/nvim/
   # fish
   sudo git clone https://github.com/neovim/neovim /usr/local/lib/nvim/; cd /usr/local/lib/nvim/

   # or, to update
   cd neovim
   git pull
   ```

5. Always choose stable version:
   ```bash
   sudo git checkout stable
   ```

6. Build the neovim stable version (or see optional step below for additional functionality):
   ```bash
   make CMAKE_BUILD_TYPE=RelWithDebInfo &&
   sudo make install
   ```

7. (**Alternative**) use the following instead of the commands above to install neovim on a custom location:
   ```bash
   sudo make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local/lib/nvim" &&
   sudo make install &&
   sudo ln -s /usr/local/lib/nvim/bin/nvim /usr/local/bin/nvim # makes nvim command
   ```