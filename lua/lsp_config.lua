-- NOTE: commenting block below to test if nvim-lsp-installer setup overrides behaviour
local lspconfig = require('lspconfig')
local cmp = require('cmp')

lspconfig.pyright.setup{
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

lspconfig.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

-- lspconfig.sumneko_lua.setup{
--     Lua = {
--         completion = "autoRequire"
--     }
-- }

-- NOTE: to install lua_ls follow the build guide and add to PATH: https://github.com/LuaLS/lua-language-server/wiki/Getting-Started#build
lspconfig.lua_ls.setup {}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, {
            { name = 'buffer' },
            { name = 'path' },
            { name = 'cmdline' },
        }, {
            { name = 'nvim_lsp' }
        }
    )
})

