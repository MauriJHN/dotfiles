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

-- RELOAD CONFIG
map("n", "<leader>rr", [[<Cmd>source ~/.config/nvim/init.lua<CR>]], opts)

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
map("n", "<leader>sc", [[<Cmd>let @/=""<CR>]], opts)
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
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- LSP --
map("n", "gr", [[<Cmd>lua vim.lsp.buf.references()<CR>]], opts)
map("n", "gd", [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts)
map("n", "<leader>hi", [[<Cmd>lua vim.lsp.buf.hover()<CR>]], opts)
map("n", "ca", [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
map("n", "ff", [[<Cmd>lua vim.lsp.buf.formatting()<CR>]], opts)
map("n", "<leader>rn", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], opts)

