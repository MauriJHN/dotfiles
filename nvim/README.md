# Nvim Config

This repository contains a personalized configuration used by mau. The following are some guidelines to use the configuration files.

## Setting Up Config After Cloning

After this project is cloned to a local environment, make sure to rename the `mauri-nvim-config` folder to `nvim`. Use the following command to setup the project properly:

```shell
git clone git@github.com:MauriJHN/mauri-nvim-config.git && mv mauri-nvim-config $HOME/.config/nvim
```

## Setting Up Packer Plugin Manager

For more detailed info on how to use Packer, read the [project's documentation](https://github.com/wbthomason/packer.nvim)

Run the following commands in order to setup packer for nvim config:

### Unix Installation

```shell
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

```

### Windows Installation

```shell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

### Install Plugins

In order to install the plugins, open the nvim editor and run the following commands inside it:

```shell
:PackerCompile
:PackerInstall
```
