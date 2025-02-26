-- this script contains operations needed at the end of the config

-- AUTOCMD

-- makes background transparent when setting color scheme
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    pattern = "*",
    command = "hi Normal ctermbg=none guibg=none"
})

-- bind Jenkinsfiles to groovy syntax
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "Jenkinsfile", "Jenkinsfile_dev" },
    command = "setf groovy"
})

-- use the windows clipboard when yanking to * registry ONLY in wsl
if vim.fn.has("wsl") then
    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        pattern = { "*" },
        command = "call system('/mnt/c/windows/system32/clip.exe ',@\")"
    })
end

-- do the same for codeium
function toggle_codeium()
  vim.cmd("let b:codeium_enabled = get(b:, 'codeium_enabled', v:false) ? v:false : v:true")
  if vim.b.codeium_enabled then
    print("Codeium enabled")
  else
    print("Codeium disabled")
  end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    command = "let b:codeium_enabled = v:false"
})

vim.keymap.set('n', '<leader>cp', [[<cmd>lua toggle_codeium()<CR>]], def_opts)

vim.cmd("color nord")

-- colorizer setup
require'colorizer'.setup()

vim.api.nvim_set_keymap('n', '<leader>po', ':PeekOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pc', ':PeekClose<CR>', { noremap = true, silent = true })

