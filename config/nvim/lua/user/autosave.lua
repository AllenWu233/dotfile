local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
  return
end

autosave.setup(
  {
        enabled = false,
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = { "plugins.lua" },
            filetype_is_not = {},
            modifiable = true
        },

    }
)
