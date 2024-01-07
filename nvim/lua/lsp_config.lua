local on_attach = require('_lsp_config').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

require('lazy-lsp').setup {
  excluded_servers = {
    'ccls', 'zk', 'sqls', 'pyright'
  },
  preferred_servers = {
    python = {},
    lua = { 'lua_ls' },
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


    volar = {
      completion = {
        triggerCharacters = { ".", ":", "<", ">", "/", "@" },
      },
      -- typescript = {
      --   preferences = {
      --     importModuleSpecifier = "relative",
      --   },
      -- },
      filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
      root_dir = lspconfig.util.root_pattern("package.json", "vite.config.js", "vite.config.ts"),
    },

    gopls = {
      root_dir = function()
        return vim.fn.getcwd()
      end,
    },

    denols = {
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
    },

    tsserver = {
      root_dir = lspconfig.util.root_pattern("package.json"),
      single_file_support = false
    },

  },
}

lspconfig.pyright.setup {
  flags = { debounce_text_changes = 150 },
  on_attach = on_attach,
  capabilities = capabilities,
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
        venvPath = "./venv/",
        venv = "venv"
      }
    },
    single_file_support = true
  }
}
