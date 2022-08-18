-- this script contains operations needed at the end of the config

local pattern_all = { "*" }

-- AUTOCMD

-- makes background transparent independent of theme
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    pattern = pattern_all,
    command = "hi Normal ctermbg=none guibg=none"
})

-- bind Jenkinsfiles to groovy syntax
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "Jenkinsfile", "Jenkinsfile_dev" },
    command = "setf groovy"
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.py" },
    command = "lua vim.lsp.buf.formatting_sync(nil, 100)"
})

vim.cmd "colo dracula"
