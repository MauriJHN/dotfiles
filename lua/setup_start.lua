g = vim.g

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

-- set editor, buffer and window options
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
	scopes[scope][key] = value
    -- even if the option is not for the editor, set for the editor
	if scope ~= "o" then
		scopes["o"][key] = value
	end
end

opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("w", "number", true)
opt("o", "numberwidth", 2)
opt("w", "cul", true)
opt("w", "signcolumn", "yes")
opt("o", "updatetime", 250)
opt("o", "timeoutlen", 500)
opt("b", "expandtab", true)
opt("b", "shiftwidth", 4)
opt("b", "tabstop", 4)
opt("o", "completeopt", "menuone,noselect")

