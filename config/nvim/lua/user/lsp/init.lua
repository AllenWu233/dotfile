local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
local util = require 'lspconfig/util'
--[[ require("user.lsp.lsp-installer") ]]
require "user.lsp.mason"
require("user.lsp.handlersmason").setup()
require 'lspconfig'.grammarly.setup {
  cmd = { "grammarly-languageserver", "--stdio" },
  --[[ filetypes = { "tex", "markdown", "text",'md' }, ]]
  init_options = {
    clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
  },
  single_file_support = true,
  root_dir =util.find_git_ancestor,
}


require 'lspconfig'.typst_lsp.setup {
  cmd = { "~/SourceFile/bin/typst-lsp" },
  filetypes = { "typst" },
  single_file_support = true,
  root_dir =util.find_git_ancestor,
}

require "lsp_signature".setup {}
require "fidget".setup {}

require 'lspconfig'.html.setup {}
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.cmake.setup {}
require 'lspconfig'.jdtls.setup {}
require 'lspconfig'.jedi_language_server.setup {}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.marksman.setup {}
--[[ require'lspconfig'.pyright.setup{} ]]
--[[ require'lspconfig'.pylsp.setup{} ]]
require 'lspconfig'.r_language_server.setup {}
require 'lspconfig'.rust_analyzer.setup {}
require 'lspconfig'.cssls.setup {}
require 'lspconfig'.texlab.setup {}

require "user.lsp.null-ls"
--[[ local navic = require("nvim-navic") ]]
--[[]]
--[[ require("lspconfig").clangd.setup { ]]
--[[     on_attach = function(client, bufnr) ]]
--[[         navic.attach(client, bufnr) ]]
--[[     end ]]
--[[ } ]]
