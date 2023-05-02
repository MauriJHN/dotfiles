local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    'wbthomason/packer.nvim',

    -- THEMES
    'dracula/vim',
    -- 'ayu-theme/ayu-vim',
    'arcticicestudio/nord-vim',
    { 'svrana/neosolarized.nvim', dependencies = 'tjdevries/colorbuddy.nvim' },

    -- EDITING
    -- 'sbdchd/neoformat',
    'godlygeek/tabular',
    'preservim/nerdtree',
    'ryanoasis/vim-devicons',
    'simrat39/symbols-outline.nvim',
    'editorconfig/editorconfig-vim',
    'folke/zen-mode.nvim',
    -- 'nvim-treesitter/nvim-treesitter'
    -- 'sindrets/diffview.nvim'

    -- GIT --
    { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
    'airblade/vim-gitgutter',
    'tpope/vim-fugitive',
-- LANGUAGE SERVER
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    { 'hrsh7th/nvim-cmp',       dependencies = 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    'lewis6991/gitsigns.nvim',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'rafamadriz/friendly-snippets',
    {
        'Shougo/deoplete.nvim',
        cmd = 'UpdateRemotePlugins'
    },

    -- UI PLUGINS
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        cond = vim.fn.executable 'make' == 1,
        cmd = 'make'
    },
    'vim-airline/vim-airline',
})


