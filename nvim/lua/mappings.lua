-- set global mapleader to spacebar
vim.g.mapleader = " "

local def_opts = { noremap = true, nowait = true }
local function opts(extra_opts)
  return vim.list_extend(def_opts, extra_opts)
end

vim.keymap.set('n', '<leader>h', [[<cmd>wincmd h<cr>]], def_opts)
vim.keymap.set('n', '<leader>j', [[<cmd>wincmd j<cr>]], def_opts)
vim.keymap.set('n', '<leader>k', [[<cmd>wincmd k<cr>]], def_opts)
vim.keymap.set('n', '<leader>l', [[<cmd>wincmd l<cr>]], def_opts)
vim.keymap.set('n', '<leader>ss', [[<cmd>split<cr>]], def_opts)
vim.keymap.set('n', '<leader>sv', [[<cmd>vsplit<cr>]], def_opts)

vim.keymap.set('n', '<leader>y', '"*y', def_opts)
vim.keymap.set('n', '<leader>p', '"*p', def_opts)
vim.keymap.set('n', '<leader>Y', 'gg"*yG', def_opts)
vim.keymap.set('n', '<leader>sc', [[<cmd>let @/=''<CR>]], def_opts)
vim.keymap.set('n', '<leader>ff', ':set foldmethod=indent<CR> :set foldmethod=manual<CR>', def_opts)
vim.keymap.set('v', '<leader>y', '"*y', def_opts)
vim.keymap.set('v', '<leader>p', '"*p', def_opts)

vim.keymap.set('n', '<leader>nt', [[<cmd>NERDTreeToggle<CR>]], def_opts)
vim.keymap.set('n', '<leader>no', ':NERDTree ', def_opts)
vim.keymap.set('n', '<leader>nb', ':Bookmark ', def_opts)
vim.keymap.set('n', '<leader>nf', ':NERDTreeFind ', def_opts)

vim.keymap.set('n', '<leader>co', [[<cmd>cope<CR>]], def_opts)
vim.keymap.set('n', '<leader>cc', [[<cmd>ccl<CR>]], def_opts)

-- custom
vim.keymap.set('n', '<leader>out', [[<cmd>SymbolsOutline<CR>]], def_opts) -- outline toggle
vim.keymap.set('n', '<leader>xx', [[<cmd>!python3 %<CR>]], def_opts) -- exec python
vim.keymap.set('n', '<leader>zm', [[<cmd>ZenMode<CR>]], def_opts)
vim.keymap.set('n', '<leader>tt', [[<cmd>split term://zsh<CR>]], def_opts)
vim.keymap.set('n', '<leader>tv', [[<cmd>vsplit term://zsh<CR>]], def_opts)
vim.keymap.set('n', '<leader>pv', [[<cmd>Sex!<CR>]], def_opts)
-- solution: https://github.com/hrsh7th/nvim-cmp/issues/261#issuecomment-1461862723
vim.keymap.set('n', '<leader>ua', [[<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle; <CR>]], opts({ desc = 'toggle nvim-cmp' }))

vim.g.pythonformatting = true
vim.keymap.set(
  'n',
  '<leader>df', [[<cmd>lua vim.g.pythonformatting = not vim.g.pythonformatting<CR>]],
  opts({ desc = 'toggle python-formatting' })
)

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

pcall(require('telescope').load_extension, 'fzf') -- enable native if installed

-- see `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- see `:h telescope.themes`
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, opts({ desc = '[/] Fuzzily search in current buffer]' }))

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, opts({ desc = '[S]earch [F]iles' }))
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, opts({ desc = '[S]earch [H]elp' }))
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, opts({ desc = '[S]earch current [W]ord' }))
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, opts({ desc = '[S]earch by [G]rep' }))
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, opts({ desc = '[S]earch [D]iagnostics' }))

-- see `:help vim.diagnostic.*`
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, def_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, def_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, def_opts)
vim.keymap.set('n', '<leader>sl', vim.diagnostic.setloclist, def_opts)
