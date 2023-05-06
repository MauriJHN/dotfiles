local lspconfig = require('lspconfig')
local cmp = require('cmp')
local lsp_flags = { debounce_text_changes = 150 }
local on_attach = require('_lsp_config').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- NOTE: to install lua_ls follow the build guide and add to PATH: https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#build
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,

  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- lua version
      },
      diagnostics = {
        globals = { 'vim' }, -- to avoid vim global error message
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- find all neovim runtime files
      },
      telemetry = {
        enable = false, -- do not send telemetry data
      },
    },
  }
}

lspconfig.pyright.setup {
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        venvPath = function()
          return "./venv/"
        end,
        venv = "venv"
      }
    },
    single_file_support = true
  }
}

lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

