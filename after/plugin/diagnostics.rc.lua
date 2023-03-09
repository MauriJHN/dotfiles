# NOTE: this config was taken from the following article: https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts/#severity_signs_in_nvim_lsp_diagnostics

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
