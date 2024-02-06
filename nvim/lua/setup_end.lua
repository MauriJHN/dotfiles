-- this script contains operations needed at the end of the config
local pattern_all = { "*" }

-- AUTOCMD

-- makes background transparent when setting color scheme
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    pattern = pattern_all,
    command = "hi Normal ctermbg=none guibg=none"
})

-- bind Jenkinsfiles to groovy syntax
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "Jenkinsfile", "Jenkinsfile_dev" },
    command = "setf groovy"
})

-- bind .pylintrc to toml syntax
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = ".pylintrc",
    command = "setf toml"
})

-- for python linting on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.py" },
    command = "Neomake"
})

-- use the windows clipboard when yanking to * registry ONLY in wsl
if vim.fn.has("wsl") then
    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
        pattern = { "*" },
        command = "call system('/mnt/c/windows/system32/clip.exe ',@\")"
    })
end

vim.cmd "colo nord"

-- colorizer setup
require'colorizer'.setup()
