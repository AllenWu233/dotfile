local status_ok, biscuit = pcall(require, "nvim-biscuits")
if not status_ok then
  vim.notify("nvim-biscuits not found!")
  return
end

biscuit.setup({
  toggle_keybind = "<leader>cb",
  show_on_start = false, -- defaults to false
  cursor_line_only = true,
  on_events = { 'InsertLeave', 'CursorHoldI' },
  --[[ default_config = { ]]
  --[[   max_length = 12, ]]
  --[[   min_distance = 5, ]]
  --[[   prefix_string = " ✨ " ]]
  --[[ }, ]]
  language_config = {
    --[[ python = { ]]
    --[[   disabled = true ]]
    --[[ } ]]
  }
})
