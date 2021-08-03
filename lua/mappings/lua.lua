local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line
map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)
this line too ]]

-- WINDOW NAV --
map("n", "<leader>h", [[<Cmd>wincmd h<CR>]], opt)
map("n", "<leader>j", [[<Cmd>wincmd j<CR>]], opt)
map("n", "<leader>k", [[<Cmd>wincmd k<CR>]], opt)
map("n", "<leader>l", [[<Cmd>wincmd l<CR>]], opt)

-- BUFFER MANAGEMENT --
map("n", "<leader>w", [[<Cmd>w<CR>]], opt)
map("n", "<leader>q", [[<Cmd>q<CR>]], opt)
map("n", "<leader>a", [[<Cmd>qa<CR>]], opt)
map("n", "<leader>ss", [[<Cmd>split<CR>]], opt)
map("n", "<leader>sv", [[<Cmd>vsplit<CR>]], opt)

-- OPEN TERMINALS --
map("n", "<leader>tt", [[<Cmd>split term://zsh<CR>]], opt)
map("n", "<leader>tv", [[<Cmd>vsplit term://zsh<CR>]], opt)

-- NETRW NAV --
map("n", "<leader>pv", [[<Cmd>Sex!<CR>]], opt)

-- EDITING --
map("n", "<leader>y", "\"*y", opt)
map("n", "<leader>p", "\"*p", opt)
map("n", "<leader>Y", "gg\"*yG", opt)
map("n", "<leader>/", [[<Cmd>let @/=""<CR>]], opt)
map("n", "<leader>ff", ":set foldmethod=indent<CR> :set foldmethod=manual<CR>", opt)
map("v", "<leader>y", "\"*y", opt)
map("v", "<leader>p", "\"*p", opt)

-- NERDTREE MAPPINGS
map("n", "<leader>nt", [[<Cmd>NERDTreeToggle<CR>]], opt)
map("n", "<leader>no", ":NERDTree ", opt)
map("n", "<leader>nb", ":Bookmark ", opt)
map("n", "<leader>nf", ":NERDTreeFind ", opt)

-- QUICK FIX --
map("n", "<leader>co", [[<Cmd>cope<CR>]], opt)
map("n", "<leader>cc", [[<Cmd>ccl<CR>]], opt)

-- FUZZY FINDER -- 
map("n", "<leader><leader>", [[<Cmd>FZF<CR>]], opt)

