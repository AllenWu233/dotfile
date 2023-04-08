local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local function diagnostics_indicator(num, _, diagnostics, _)
  local result = {}
  local symbols = {
    error = "",
    warning = "",
    info = "",
  }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. " " .. count)
    end
  end
  result = table.concat(result, " ")
  return #result > 0 and result or ""
end

bufferline.setup {
  options = {
    mode = "buffers",                        -- set to "tabs" to only show tabpages instead
    numbers = "none",                        -- can be "none" | "ordinal" | "buffer_id" | "both" | function
    right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",        -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,              -- can
    indicator = {
      icon = "▎",                          -- this should be omitted if indicator style is not 'icon'
      style = "icon",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true,  -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = diagnostics_indicator,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "PanelHeading",
        padding = 1,
      },

    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    hover = {
      enabled = false, -- requires nvim 0.8+
      delay = 200,
      reveal = { "close" },
    },
    sort_by = "id",
  },

}
