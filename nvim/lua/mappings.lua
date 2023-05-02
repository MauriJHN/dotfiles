-- set global mapleader to spacebar
vim.g.mapleader = " "

local options = {noremap = true, nowait = true}

-- wrapper function to set keymap
-- see h :map-commands for explanation of lhs & rhs
local function map(mode, lhs, rhs, opts)
	-- noremap means the mapping cannot be overwritten or nested
	local options = {noremap = true, nowait = true}
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	-- see :h nvim_set_keymap
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {}

-- WINDOW NAV --
vim.keymap.set('n', '<leader>h', "<cmd>wincmd h<cr>", opts)
vim.keymap.set('n', '<leader>j', [[<cmd>wincmd j<cr>]], opts)
vim.keymap.set('n', '<leader>k', [[<cmd>wincmd k<cr>]], opts)
vim.keymap.set('n', '<leader>l', [[<cmd>wincmd l<cr>]], opts)

-- BUFFER MANAGEMENT --
vim.keymap.set('n', '<leader>ss', [[<Cmd>split<CR>]], opts)
vim.keymap.set('n', '<leader>sv', [[<Cmd>vsplit<CR>]], opts)

-- OPEN TERMINALS --
vim.keymap.set('n', '<leader>tt', [[<Cmd>split term://zsh<CR>]], opts)
vim.keymap.set('n', '<leader>tv', [[<Cmd>vsplit term://zsh<CR>]], opts)

-- NETRW NAV --
vim.keymap.set('n', '<leader>pv', [[<Cmd>Sex!<CR>]], opts)
-- EDITING --
vim.keymap.set('n', '<leader>y', '"*y', opts)
vim.keymap.set('n', '<leader>p', '"*p', opts)
vim.keymap.set('n', '<leader>Y', 'gg"*yG', opts)
vim.keymap.set('n', '<leader>sc', [[<Cmd>let @/=''<CR>]], opts)
vim.keymap.set('n', '<leader>ff', ':set foldmethod=indent<CR> :set foldmethod=manual<CR>', opts)
vim.keymap.set('v', '<leader>y', '"*y', opts)
vim.keymap.set('v', '<leader>p', '"*p', opts)
vim.keymap.set('n', '<leader>zm', [[<Cmd>ZenMode<CR>]], opts)

-- NERDTREE MAPPINGS
vim.keymap.set('n', '<leader>nt', [[<Cmd>NERDTreeToggle<CR>]], opts)
vim.keymap.set('n', '<leader>no', ':NERDTree ', opts)
vim.keymap.set('n', '<leader>nb', ':Bookmark ', opts)
vim.keymap.set('n', '<leader>nf', ':NERDTreeFind ', opts)

-- QUICK FIX --
vim.keymap.set('n', '<leader>co', [[<Cmd>cope<CR>]], opts)
vim.keymap.set('n', '<leader>cc', [[<Cmd>ccl<CR>]], opts)

-- OUTLINE TOGGLE
vim.keymap.set('n', '<leader>out', [[<Cmd>SymbolsOutline<CR>]], opts)

-- EXEC PYTHON
vim.keymap.set('n', '<leader>xx', [[<Cmd>!python3 %<CR>]], opts)

-- TOGGLE CMP
-- solution in thread: https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-1461862723
vim.keymap.set('n', '<leader>ua', [[<Cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle; <CR>]], { desc = 'toggle nvim-cmp' })

--TOGGLE PYTHON FORMATTING
vim.g.pythonformatting = true
vim.keymap.set('n', '<leader>df', [[<Cmd>lua vim.g.pythonformatting = not vim.g.pythonformatting<CR>]], { desc = 'toggle python-formatting' })

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

local lspconfig = require('lspconfig')
local servers = { 'lua_ls', 'pyright' }
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- to load vs code snippets: https://github.com/L3MON4D3/LuaSnip#add-snippets
require('luasnip.loaders.from_vscode').lazy_load()

for k,server in ipairs(servers) do
    -- NOTE: uncomment to see which server is causing issues
    -- print('adding mappings to server: ' .. server)
    lspconfig[server].setup{
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    }
end
