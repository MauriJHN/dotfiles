require "plugins.lua"
require "misc-utils.lua"

local cmd = vim.cmd
local g = vim.g

cmd "syntax on"

-- GENERAL
g.mapleader = " "
g.auto_save = 0

-- NERDTREE
g.NERDTreeShowBookmarks = 1
g.NERDTreeShowHidden = 1

-- NETRW FILE EX
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_browse_split = 4
g.netrw_liststyle = 1
g.netrw_fastbrowse = 2

-- GRUVBOX
g.gruvbox_transparent_bg = 1

require "mappings.lua"

-- AUTOCMD
vim.api.nvim_command([[
au VimEnter * :NERDTree
]])

vim.api.nvim_command([[
au ColorScheme * hi Normal ctermbg=none guibg=none
]])

vim.api.nvim_command([[
au BufNewFile,BufRead Jenkinsfile setf groovy
]])

cmd "colo gruvbox"

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require'lspconfig'.pyright.setup{}
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

require "lsp-config.lua"
