-- Function to format the current buffer with autopep8
function format_with_autopep8()
    vim.cmd('write')
    vim.cmd('silent !autopep8 --in-place ' .. vim.fn.shellescape(vim.fn.expand('%:p')))
    vim.cmd('edit')
end

-- Function to lint the current buffer with pycodestyle
function lint_with_pylint()
      -- Define the command to run pylint
    local cmd = 'pylint ' .. vim.fn.shellescape(vim.fn.expand('%:p'))
    -- Run pylint and capture the output
    vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                -- Write the pylint output to a temporary file
                local tempfile = vim.fn.expand('%:p') .. '.pylint'
                vim.fn.writefile(data, tempfile)
                -- Load the pylint output into the quickfix list
                vim.cmd('cfile ' .. tempfile)
                -- Open the quickfix window
                vim.cmd('copen')
            end
        end,
    })
end


vim.keymap.set('n', '<space>pf', ':lua format_with_autopep8()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<space>pl', ':lua lint_with_pylint()<CR>', { noremap = true, silent = false })

-- bind .pylintrc to toml syntax
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { ".pylintrc" },
    command = "setf toml"
})

-- function to delete .pylint files
function delete_pylint()
    local file = vim.fn.expand("%:p")
    local pylint_file = file .. ".pylint"
    if vim.fn.filereadable(pylint_file) == 1 then
        vim.fn.delete(pylint_file)
    end
end

-- delete .pylint files when buffer is deleted or exited
vim.api.nvim_create_autocmd({ "BufWritePost", "BufDelete", "VimLeave" }, {
    pattern = { "*.py", "*.pylint" },
    -- remove file using lua function
    command = "lua delete_pylint()"
})

