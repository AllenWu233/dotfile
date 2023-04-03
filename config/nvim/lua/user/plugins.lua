local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  --colorscheme
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'folke/tokyonight.nvim'
  use({ "shaunsingh/nord.nvim" })



  -- basic tool
  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/popup.nvim" }) -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
  use("windwp/nvim-autopairs")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use({ "nvim-lualine/lualine.nvim", })
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim")
  use("folke/which-key.nvim")

  -- cmp
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")



  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use('simrat39/rust-tools.nvim')
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use { "ray-x/lsp_signature.nvim", }
  use 'j-hui/fidget.nvim'
  use "SmiteshP/nvim-navic"

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-media-files.nvim")
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" }
  }
  use "debugloop/telescope-undo.nvim"

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")


  -- other useful tool for better coding
  use("CRAG666/code_runner.nvim")
  use('mfussenegger/nvim-dap')
  use 'simrat39/symbols-outline.nvim'
  use { 'numToStr/Comment.nvim' }
  use 'rmagatti/goto-preview'
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }
  use("folke/neodev.nvim")
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons", }

  -- useful features
  use({ 'norcalli/nvim-colorizer.lua' })
  use({ 'ggandor/leap.nvim' })
  use({ 'ggandor/flit.nvim' })
  use({ 'tpope/vim-repeat' })
  use({ 'akinsho/toggleterm.nvim' })
  use({ 'windwp/nvim-spectre' })

  -- enchancement
  use("Pocco81/auto-save.nvim")
  use("nathom/filetype.nvim")
  use { 'code-biscuits/nvim-biscuits', }
  use({ 'karb94/neoscroll.nvim' })
  use "Pocco81/HighStr.nvim"
  use { 'edluffy/specs.nvim' }
  use 'gelguy/wilder.nvim'
  use "Pocco81/true-zen.nvim"
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { 'kevinhwang91/nvim-hlslens' }
  use 'nacro90/numb.nvim'


  use { 'kaarmu/typst.vim', ft = { 'typ' } }


  -- markdown
  use("iamcco/mathjax-support-for-mkdp")
  --[[ use({ ]]
  --[[   "iamcco/markdown-preview.nvim", ]]
  --[[   run = "cd app && npm install", ]]
  --[[   ft = { "markdown" }, ]]
  --[[ }) ]]
  use { 'iamcco/markdown-preview.nvim' }
  -- ********************************************************************************

  --[[ use({ 'jakewvincent/mkdnflow.nvim', ]]
  --[[   ft = "markdown", ]]
  --[[ rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed ]]
  --[[ config = function() ]]
  --[[   require('mkdnflow').setup({}) ]]
  --[[ end ]]
  --[[ }) ]]
  --[[ use("RRethy/vim-illuminate") ]]
  -- ********************************************************************************


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
