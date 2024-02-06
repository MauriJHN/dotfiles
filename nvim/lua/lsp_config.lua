local on_attach = require('_lsp_config').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
local get_typescript_server_path = require('helpers.search_ts_global')

require('lazy-lsp').setup {
  excluded_servers = {
    'ccls', 'zk', 'sqls', 'pyright', 'vuels'
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
      cmd = { "vue-language-server", "--stdio" },
      completion = {
        triggerCharacters = { ".", ":", "<", ">", "/", "@" },
      },
      -- typescript = {
      --   preferences = {
      --     importModuleSpecifier = "relative",
      --   },
      -- },
      root_dir = lspconfig.util.root_pattern("package.json", "vite.config.js", "vite.config.ts"),
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
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
  root_dir = lspconfig.util.root_pattern("pyrightconfig.json", ".git"),
  filetypes = { "python" },
  -- NOTE: commenting this out to test virtualenv definition with local config file
  settings = {
    python = {
      venvPath = "/home/mau/.pyenv/versions/3.10.13/envs",
    },
    single_file_support = true
  }
}
