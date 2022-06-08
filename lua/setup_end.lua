-- this script contains operations needed at the end of the config

-- AUTOCMD
vim.api.nvim_command([[
au VimEnter * :NERDTree
]])

-- makes background transparent independent of theme
vim.api.nvim_command([[
au ColorScheme * hi Normal ctermbg=none guibg=none
]])

-- bind Jenkinsfiles to groovy syntax
vim.api.nvim_command([[
au BufNewFile,BufRead Jenkinsfile setf groovy
]])

vim.api.nvim_command([[
au BufNewFile,BufRead Jenkinsfile_dev setf groovy
]])

vim.cmd "colo dracula"
