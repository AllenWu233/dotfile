local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  { "catppuccin/nvim",      name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "shaunsingh/nord.nvim", lazy = false,        priority = 1000 },
  { "nvim-lua/plenary.nvim" },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  { 'akinsho/bufferline.nvim',            version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  --[[ 'famiu/bufdelete.nvim', ]]
    {"ojroques/nvim-bufdel",lazy = false},

  'nvim-lualine/lualine.nvim',
  "ahmedkhalf/project.nvim",
  { "lukas-reineke/indent-blankline.nvim" },
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --opts = { require'alpha.themes.startify'.config }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },


  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',
  "lukas-reineke/cmp-under-comparator",
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  "neovim/nvim-lspconfig",
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependenices = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons' }
  },

  'simrat39/rust-tools.nvim',
  "jose-elias-alvarez/null-ls.nvim",
  "ray-x/lsp_signature.nvim",
  'j-hui/fidget.nvim',
  -- use "williamboman/mason.nvim" -- simple to use language server installer
  -- use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  -- use "SmiteshP/nvim-navic"




  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  --[[ use { ]]
  --[[   "nvim-telescope/telescope-frecency.nvim", ]]
  --[[   requires = { "kkharji/sqlite.lua" } ]]
  --[[ } ]]
  -- use "debugloop/telescope-undo.nvim"



  { "CRAG666/code_runner.nvim", config = true },
  'simrat39/symbols-outline.nvim',
  'numToStr/Comment.nvim',
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  --[[ use { ]]
  --[[   'kosayoda/nvim-lightbulb', ]]
  --[[ } ]]
  --[[ use 'rmagatti/goto-preview' ]]
  --[[ use('mfussenegger/nvim-dap') ]]
  -- use("folke/neodev.nvim")

  "ggandor/leap.nvim",
  'norcalli/nvim-colorizer.lua',
  'akinsho/toggleterm.nvim',
  'nvim-pack/nvim-spectre',
  --[[ use({ 'ggandor/flit.nvim' }) ]]
  -- use({ 'tpope/vim-repeat' })


  {
    "Pocco81/auto-save.nvim",
    init = function()
      require("auto-save").setup {
        enabled = false,
      }
    end
  },
  'edluffy/specs.nvim',
  {'gelguy/wilder.nvim',build = ':UpdateRemotePlugins'},
  { 'kevinhwang91/nvim-ufo',    dependencies = 'kevinhwang91/promise-async' },
  'kevinhwang91/nvim-hlslens',
  'nacro90/numb.nvim',
  {
    'andymass/vim-matchup',
    lazy = false,
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
  --[[ use("nathom/filetype.nvim") ]]
  --[[ use { 'code-biscuits/nvim-biscuits', } ]]
  --[[ use({ 'karb94/neoscroll.nvim' }) ]]
  --[[ use "Pocco81/HighStr.nvim" ]]
  --[[ use("RRethy/vim-illuminate") ]]
  -- use "Pocco81/true-zen.nvim"
})

vim.g.matchup_matchparen_offscreen = { method = "popup" }
