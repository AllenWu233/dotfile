local configs = require("nvim-treesitter.configs")
configs.setup {
--[[ ensure_installed = "maintained", ]]
--  ensure_installed = "maintained",
  sync_install = true, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "typst" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
