local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require 'lspconfig'.grammarly.setup {
  cmd = { "/home/charles/.npm-global/bin/grammarly-languageserver", "--stdio" },
  filetypes = { "markdown", "text","tex" },
  init_options = {
    clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
  },
}
require 'lspconfig'.pyright.setup {}
require "user.lsp.null-ls"
require "lsp_signature".setup{}
require"fidget".setup{}

--[[ local navic = require("nvim-navic") ]]
--[[]]
--[[ require("lspconfig").clangd.setup { ]]
--[[     on_attach = function(client, bufnr) ]]
--[[         navic.attach(client, bufnr) ]]
--[[     end ]]
--[[ } ]]
