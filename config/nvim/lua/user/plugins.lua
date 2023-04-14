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
  use({ "nvim-lua/popup.nvim" })    -- Have packer manage itself
  use({ "nvim-lua/plenary.nvim" })  -- Useful lua functions used by lots of plugins
  use("windwp/nvim-autopairs")
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/bufferline.nvim")
  use { 'ojroques/nvim-bufdel' }
  use({ "nvim-lualine/lualine.nvim", })
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("folke/which-key.nvim")

  -- cmp
  use("hrsh7th/nvim-cmp")         -- The completion plugin
  use("hrsh7th/cmp-buffer")       -- buffer completions
  use("hrsh7th/cmp-path")         -- path completions
  use("hrsh7th/cmp-cmdline")      -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use "lukas-reineke/cmp-under-comparator"


  -- snippets
  use("L3MON4D3/LuaSnip")             --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig")           -- enable LSP
  use('simrat39/rust-tools.nvim')
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
  use { "ray-x/lsp_signature.nvim", }
  use 'j-hui/fidget.nvim'
  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    --Please make sure you install markdown and markdown_inline parser
  })
  -- use "williamboman/mason.nvim" -- simple to use language server installer
  -- use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  -- use "SmiteshP/nvim-navic"

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-media-files.nvim")
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run =
  'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  --[[ use { ]]
  --[[   "nvim-telescope/telescope-frecency.nvim", ]]
  --[[   requires = { "kkharji/sqlite.lua" } ]]
  --[[ } ]]
  -- use "debugloop/telescope-undo.nvim"


  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring")



  -- other useful tool for better coding
  use("CRAG666/code_runner.nvim")
  use 'simrat39/symbols-outline.nvim'
  use { 'numToStr/Comment.nvim' }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons", }
  --[[ use { ]]
  --[[   'kosayoda/nvim-lightbulb', ]]
  --[[ } ]]
  --[[ use 'rmagatti/goto-preview' ]]
  --[[ use('mfussenegger/nvim-dap') ]]
  -- use("folke/neodev.nvim")


  -- useful features
  use({ 'norcalli/nvim-colorizer.lua' })
  use({ 'ggandor/leap.nvim' })
  use({ 'akinsho/toggleterm.nvim' })
  use({ 'windwp/nvim-spectre' })
  --[[ use({ 'ggandor/flit.nvim' }) ]]
  -- use({ 'tpope/vim-repeat' })

  -- enchancement
  use("Pocco81/auto-save.nvim")
  use { 'edluffy/specs.nvim' }
  use 'gelguy/wilder.nvim'
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use { 'kevinhwang91/nvim-hlslens' }
  use 'nacro90/numb.nvim'
  use {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
  --[[ use("nathom/filetype.nvim") ]]
  --[[ use { 'code-biscuits/nvim-biscuits', } ]]
  --[[ use({ 'karb94/neoscroll.nvim' }) ]]
  --[[ use "Pocco81/HighStr.nvim" ]]
  --[[ use("RRethy/vim-illuminate") ]]
  -- use "Pocco81/true-zen.nvim"


  -- markdown
  use("iamcco/mathjax-support-for-mkdp")
  use { 'iamcco/markdown-preview.nvim' }
  -- ********************************************************************************


  -- ********************************************************************************


  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
