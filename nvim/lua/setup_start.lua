vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalMenu = 1
vim.g.NERDTreeDirArrowExpandable = ' '
vim.g.NERDTreeDirArrowCollapsible = ' '

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 1 -- long.listing (one file per line)
vim.g.netrw_fastbrowse = 2 -- efficient browsing
vim.g.smarttab = true
vim.g.backup = false
vim.opt.wildoptions = 'pum'


local scopes = { o = vim.o, b = vim.bo, w = vim.wo } -- scopes: { editor, buffer, window }
local function set_editor_option(scope, field, value)
	scopes[scope][field] = value

	if scope ~= 'o' then
		scopes['o'][field] = value
	end
end

set_editor_option('o', 'hidden', true)
set_editor_option('o', 'ignorecase', true)
set_editor_option('o', 'splitbelow', true)
set_editor_option('o', 'splitright', true)
set_editor_option('o', 'termguicolors', true)
set_editor_option('w', 'number', true)
set_editor_option('o', 'numberwidth', 2)
set_editor_option('w', 'cursorline', true)
set_editor_option('w', 'signcolumn', 'yes')
set_editor_option('o', 'updatetime', 250)
set_editor_option('o', 'timeoutlen', 500)
set_editor_option('b', 'shiftwidth', 2)
set_editor_option('b', 'tabstop', 2)
set_editor_option('b', 'expandtab', true)
set_editor_option('b', 'smartindent', true)
set_editor_option('o', 'completeopt', 'menuone,preview,noselect')
set_editor_option('o', 'encoding', 'UTF-8') -- for vim devicons
set_editor_option('o', 'fileencoding', 'UTF-8') -- for vim devicons
--set_editor_option('o', 'scriptencoding', 'utf-8') -- for vim devicons
set_editor_option('o', 'wrap', false) -- for vim devicons
