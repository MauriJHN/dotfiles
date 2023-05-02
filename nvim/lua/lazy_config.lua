-- Project Link: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
    "folke/which-key.nvim",
    "arcticicestudio/nord-vim",
    "preservim/nerdtree",
    "ryanoasis/vim-devicons",
    "neovim/nvim-lspconfig",
    "tjdevries/colorbuddy.nvim",
    "lewis6991/gitsigns.nvim",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "folke/zen-mode.nvim",
    "rafamadriz/friendly-snippets",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },
	{
        'Shougo/deoplete.nvim',
        build = ":UpdateRemotePlugins"
    },
})
