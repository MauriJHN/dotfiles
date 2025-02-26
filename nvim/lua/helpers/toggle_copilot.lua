-- disable copilot on open
function toggle_copilot()
  vim.cmd("let b:copilot_enabled = get(b:, 'copilot_enabled', v:false) ? v:false : v:true")
  if vim.b.copilot_enabled then
    print("Copilot enabled")
  else
    print("Copilot disabled")
  end
end
