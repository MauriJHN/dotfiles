local on_attach = require('_lsp_config').on_attach
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
local merge_tables = require('helpers.luatools').merge_tables

lspconfig.pyright.setup {
  flags = { debounce_text_changes = 150 },
  on_attach = on_attach,
  capabilities = merge_tables(capabilities, {
    textDocument = {
      formatting = {
        dynamicRegistration = false
      }
    }
  }),
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = lspconfig.util.root_pattern("pyrightconfig.json", ".pylintrc", ".git"),
  filetypes = { "python" },
  settings = {
    python = {
      venvPath = "/home/mau/.pyenv/versions/3.10.13/envs",
    },
    single_file_support = true
  }
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}
