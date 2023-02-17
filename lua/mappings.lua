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
map("n", "ca", [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
map("n", "ff", [[<Cmd>lua vim.lsp.buf.format_sync()<CR>]], opts)
map("n", "<leader>rn", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], opts)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>sl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
