local cmp = require('cmp')
vim.g.cmptoggle = true

cmp.setup {
  enabled = function()
    return vim.g.cmptoggle
  end,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-s>'] = cmp.mapping.complete({
      config = {
        sources = {
          { name = 'nvim_lsp' },
        }
      }
    }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }), -- only accept if explicitly selected
    ['<C-j>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-k>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'cmdline' },
    }
  )
}

-- `/` cmdline setup. see :h cmp-usage
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup. see :h cmp-usage
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- https://github.com/L3MON4D3/LuaSnip#add-snippets
require('luasnip.loaders.from_vscode').lazy_load()
