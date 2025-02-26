-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Install lazy.nvim if it doesn't exist
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '

require('lazy').setup({
  'folke/which-key.nvim',
  'arcticicestudio/nord-vim',
  'preservim/nerdtree',
  'ryanoasis/vim-devicons',
  'tjdevries/colorbuddy.nvim',
  'lewis6991/gitsigns.nvim',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'folke/zen-mode.nvim',
  'rafamadriz/friendly-snippets',
  'simrat39/symbols-outline.nvim',
  'vim-airline/vim-airline',
  'norcalli/nvim-colorizer.lua',
  'neovim/nvim-lspconfig',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    run = ':set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr()',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
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
    build = ':UpdateRemotePlugins'
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        app = 'browser'
      })
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
})
