local on_attach = require('_lsp_config').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lazy-lsp').setup {
  excluded_servers = {
    'ccls', 'zk', 'sqls',
  },
  preferred_servers = {
    python = { 'pyright' },
    lua = { 'lua_ls' },
    vue = { 'vuels' }
  },
  default_config = {
    flags = { debounce_text_changes = 150 },
    on_attach = on_attach,
    capabilities = capabilities,
  },
  configs = {

    lua_ls = {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT', -- lua version
          },
          diagnostics = {
            globals = { 'vim' }, -- avoid `vim` global diagnostics
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false, -- do not send telemetry data
          },
        },
      },
    },

    pyright = {
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
    },

    vuels = {},
  },
}
