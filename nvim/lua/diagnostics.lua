vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Always show the source of the diagnostic
    severity = vim.diagnostic.severity.ERROR, -- Only show errors
    prefix = '☢ ', -- Prefix for virtual text diagnostics
    format = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return string.format("☢ : %s", diagnostic.source)
      end
      return diagnostic.message
    end
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- NOTE: this does not work for every LSP
-- Function to disable diagnostics from a specific LSP
local function disable_lsp_diagnostics(lsp_name)
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.name == lsp_name then
      print("publishDiagnostics handler for " ..
        lsp_name .. " " .. client.handlers["textDocument/publishDiagnostics"] .. " disabled")
      client.handlers["textDocument/publishDiagnostics"] = function() end
      print("Diagnostics disabled for " .. lsp_name)
    end
  end
end

-- Command to disable LSP diagnostics
vim.api.nvim_create_user_command(
  'DisableLSPDiagnostics',
  function(input)
    disable_lsp_diagnostics(input.args)
  end,
  { nargs = 1, desc = "Disable diagnostics from a specific LSP" }
)
