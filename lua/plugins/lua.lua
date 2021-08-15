return require('packer').startup(function()

    use 'wbthomason/packer.nvim'

	-- use 'phanviet/vim-monokai-pro'
	-- use 'sainnhe/gruvbox-material'
	use 'gruvbox-community/gruvbox'
	-- use 'lifepillar/vim-solarized8'
	-- use 'glepnir/oceanic-material'
	-- use 'tyrannicaltoucan/vim-deep-space'
	use 'arcticicestudio/nord-vim'
	use 'dracula/vim' -- , { 'name': 'dracula' }

	-- EDITING PLUGINS
	-- use 'sbdchd/neoformat'
	-- use 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    use 'godlygeek/tabular'
    use 'plasticboy/vim-markdown'
	use 'preservim/nerdtree'
	use 'ryanoasis/vim-devicons'
	use 'tpope/vim-fugitive'
	use 'editorconfig/editorconfig-vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sindrets/diffview.nvim'

    -- GIT --
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use 'airblade/vim-gitgutter'

    -- LANGUAGE SERVER
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'

    -- UI PLUGINS
	use 'vim-airline/vim-airline'
	use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
end)
