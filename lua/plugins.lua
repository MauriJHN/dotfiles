-- the following snippet makes sure packer is installed before attempting to install plugins
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- reload packages when this script is updated
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    command = "source % | PackerSync"
})


return require('packer').startup(function()

    use {
        'wbthomason/packer.nvim',

        -- THEMES
        -- 'dracula/vim',
        -- 'ayu-theme/ayu-vim',
        'arcticicestudio/nord-vim',

        -- EDITING
        -- 'sbdchd/neoformat',
        'godlygeek/tabular',
        'preservim/nerdtree',
        'ryanoasis/vim-devicons',
        'simrat39/symbols-outline.nvim',
        'editorconfig/editorconfig-vim',
        -- 'nvim-treesitter/nvim-treesitter'
        -- 'sindrets/diffview.nvim'

        -- GIT --
        { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
        'airblade/vim-gitgutter',
        'tpope/vim-fugitive',

        -- LANGUAGE SERVER
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        { 'hrsh7th/nvim-cmp', requires = 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        'lewis6991/gitsigns.nvim',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        { 'Shougo/deoplete.nvim', run = function() vim.cmd(':UpdateRemotePlugins') end },

        -- UI PLUGINS
        -- Fuzzy Finder (files, lsp, etc)
        { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } },

        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 },

        'vim-airline/vim-airline',
        -- { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    }
end)
