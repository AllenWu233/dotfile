local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
  vim.notify("lightbulb not found!")
	return
end
lightbulb.setup {
    ignore = {},
    sign = {
        enabled = true,
        priority = 10,
    },
    float = {
        enabled = false,
        text = "",

        win_opts = {},
    },
    virtual_text = {
        enabled = true,
        text = "",
        hl_mode = "replace",
    },
    status_text = {
        enabled = false,
        text = "",
        text_unavailable = ""
    }
}

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
