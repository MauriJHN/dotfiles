# Installing Language Servers

This document contains the steps taken to install language servers and set them up to work with neovim.

**NOTES**

- Always consule neovim's docs for details on installing/configuring language servers: `:help lspconfig-all`
- Make sure the `.setup` function is in neovim's configuration to register the language server
- Run `:LspInstallInfo` for a reference to the options available for the `.setup` configuration table

## pyright

**documentation**: [pyright](https://microsoft.github.io/pyright/#/installation) *(follow the npm install section)*

To install pyright, execute the following commands:

```shell
sudo npm install -g pyright
```

To make sure the language server is working properly run the following:

```shell
pyright-langserver --stdio
```

## lua_ls

**documentation**: [lua_ls build](https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#build)

Follow the steps in the documentation above and make sure to add it path.

Or for a quick setup, run these commands in order displayed:

```shell
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
./make.sh

# add the bin file to PATH
echo 'export PATH="$PATH:$(pwd)/bin" >> ~/.zshrc' # or .zsh_exports
```