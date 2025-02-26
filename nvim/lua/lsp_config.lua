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

require'lspconfig'.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

require'lspconfig'.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
