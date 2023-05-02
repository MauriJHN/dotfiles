-- object containing global variables
g = vim.g

-- GLOBAL VARIABLES

-- nerdtree
g.NERDTreeShowHidden = 1
g.NERDTreeMinimalMenu = 1

-- netrw file ex
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_browse_split = 4
g.netrw_liststyle = 1 -- long listing (one file per line)
g.netrw_fastbrowse = 2 -- efficient browsing, see :h g:netrw_fastbrowse

-- vim.o: editor scope
-- vim.bo: buffer scope
-- vim.wo: window scope
local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
local function set_editor_option(scope, field, value)
	scopes[scope][field] = value

	if scope ~= "o" then
		scopes["o"][field] = value
	end
end

set_editor_option("o", "hidden", true)
set_editor_option("o", "ignorecase", true)
set_editor_option("o", "splitbelow", true)
set_editor_option("o", "splitright", true)
set_editor_option("o", "termguicolors", true)
set_editor_option("w", "number", true)
set_editor_option("o", "numberwidth", 2)
set_editor_option("w", "cul", true)
set_editor_option("w", "signcolumn", "yes")
set_editor_option("o", "updatetime", 250)
set_editor_option("o", "timeoutlen", 500)
set_editor_option("b", "expandtab", true)
set_editor_option("b", "shiftwidth", 4)
set_editor_option("b", "tabstop", 4)
set_editor_option("b", "smartindent", true)
set_editor_option("o", "completeopt", "menuone,preview,noselect") -- do not select 
set_editor_option("o", "encoding", "utf8") -- for vim devicons
