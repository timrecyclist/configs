-- Bootstrap lazy
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

require("lazy").setup({

  -- Frequently used by other plugins
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/null-ls.nvim",

  -- TreeSitter
  "nvim-treesitter/nvim-treesitter",

  -- Autocompletion
  'hrsh7th/nvim-cmp', -- engine
  'hrsh7th/cmp-nvim-lsp', -- things that go in the engine
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',

  -- Autopairs
  'windwp/nvim-autopairs',

  -- Better ordering for completions
  "lukas-reineke/cmp-under-comparator",

  -- Debugging
	"mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  "mfussenegger/nvim-dap-python",

  -- Recommended by nvim-dap-ui
  "folke/neodev.nvim",


  -- Colorschemes
  'EdenEast/nightfox.nvim',
  'sainnhe/everforest',
  'sainnhe/gruvbox-material',
  'ellisonleao/gruvbox.nvim',
  'sam4llis/nvim-tundra',

  -- myNvimPlugins
  {dir = '~/myNvimPlugins/myRepl'},
  "tpope/vim-repeat",
  "pappasam/nvim-repl",

  -- lua-dev
  "bfredl/nvim-luadev",

  -- File Explorer
  { "nvim-neo-tree/neo-tree.nvim",
    requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
    }
  },

  -- Telescope
  {'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Zen
  "Pocco81/true-zen.nvim",

  -- DB
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',

  -- VimFugitive
  'tpope/vim-fugitive',
})
