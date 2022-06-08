-- set global mapleader to spacebar

vim.g.mapleader = " "

-- wrapper function to set keymap
-- see h :map-commands for explanation of lhs & rhs
local function map(mode, lhs, rhs, opts)
	-- noremap means the mapping cannot be overwritten or nested
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	-- see :h nvim_set_keymap
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {}

-- dont copy any deleted text, this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line
map("n", "dd", [=[ "_dd ]=], opts)
map("v", "dd", [=[ "_dd ]=], opts)
map("v", "x", [=[ "_x ]=], opts)
this line too ]]

-- WINDOW NAV --
map("n", "<leader>h", [[<Cmd>wincmd h<CR>]], opts)
map("n", "<leader>j", [[<Cmd>wincmd j<CR>]], opts)
map("n", "<leader>k", [[<Cmd>wincmd k<CR>]], opts)
map("n", "<leader>l", [[<Cmd>wincmd l<CR>]], opts)

-- BUFFER MANAGEMENT --
map("n", "<leader>w", [[<Cmd>w<CR>]], opts)
map("n", "<leader>q", [[<Cmd>q<CR>]], opts)
map("n", "<leader>a", [[<Cmd>qa<CR>]], opts)
map("n", "<leader>ss", [[<Cmd>split<CR>]], opts)
map("n", "<leader>sv", [[<Cmd>vsplit<CR>]], opts)

-- OPEN TERMINALS --
map("n", "<leader>tt", [[<Cmd>split term://zsh<CR>]], opts)
map("n", "<leader>tv", [[<Cmd>vsplit term://zsh<CR>]], opts)

-- NETRW NAV --
map("n", "<leader>pv", [[<Cmd>Sex!<CR>]], opts)

-- EDITING --
map("n", "<leader>y", "\"*y", opts)
map("n", "<leader>p", "\"*p", opts)
map("n", "<leader>Y", "gg\"*yG", opts)
map("n", "<leader>/", [[<Cmd>let @/=""<CR>]], opts)
map("n", "<leader>ff", ":set foldmethod=indent<CR> :set foldmethod=manual<CR>", opts)
map("v", "<leader>y", "\"*y", opts)
map("v", "<leader>p", "\"*p", opts)

-- NERDTREE MAPPINGS
map("n", "<leader>nt", [[<Cmd>NERDTreeToggle<CR>]], opts)
map("n", "<leader>no", ":NERDTree ", opts)
map("n", "<leader>nb", ":Bookmark ", opts)
map("n", "<leader>nf", ":NERDTreeFind ", opts)

-- QUICK FIX --
map("n", "<leader>co", [[<Cmd>cope<CR>]], opts)
map("n", "<leader>cc", [[<Cmd>ccl<CR>]], opts)

-- FUZZY FINDER -- 
map("n", "<leader><leader>", [[<Cmd>FZF<CR>]], opts)

