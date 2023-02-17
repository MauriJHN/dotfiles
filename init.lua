require("plugins")
require("setup_start")
require("lsp_config")
require("mappings")
require("setup_end")

require("lspconfig")["pyright"].setup{
    cmd = { "pyright-langserver", "--stdio" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    files = { "python" },
    pyright = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
            venvPath = "venv"
        }
    },
    single_file_support = true
}
print("configured pyright from init.lua")
