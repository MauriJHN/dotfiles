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
    command = "source <afile> | PackerSync"
})


return require('packer').startup(function()

    use {
        'wbthomason/packer.nvim',

        -- THEMES
        -- 'dracula/vim',
        -- 'ayu-theme/ayu-vim',
        'arcticicestudio/nord-vim',

        -- EDITING
        -- use 'sbdchd/neoformat'
        -- use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
        -- use 'godlygeek/tabular'
        -- use 'plasticboy/vim-markdown'
        'preservim/nerdtree',
        'ryanoasis/vim-devicons',
        -- use 'editorconfig/editorconfig-vim'
        -- use 'nvim-treesitter/nvim-treesitter'
        -- use 'sindrets/diffview.nvim'

        -- GIT --
        { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
        'airblade/vim-gitgutter',
        'tpope/vim-fugitive',

        -- LANGUAGE SERVER
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',

        -- UI PLUGINS
        'vim-airline/vim-airline',
        { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    }
end)
