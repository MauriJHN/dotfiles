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

-- disable copilot on open
function toggle_copilot()
  vim.cmd("let b:copilot_enabled = get(b:, 'copilot_enabled', v:false) ? v:false : v:true")
  if vim.b.copilot_enabled then
    print("Copilot enabled")
  else
    print("Copilot disabled")
  end
end

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*",
    command = "let b:copilot_enabled = v:false"
})

vim.keymap.set('n', '<leader>cp', [[<cmd>lua toggle_copilot()<CR>]], def_opts)

vim.cmd("color nord")

-- colorizer setup
require'colorizer'.setup()
