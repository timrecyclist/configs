-- All settings for plugins here should be done in the after/plugins folder
--------------------------------------------------------------------------
-- Automatically install packer if it's not already there
-- "data" directory is .local/share/nvim
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
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
------------------------------------------------------------------------------

-- Plugins
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  -- Colorscheme
  use 'EdenEast/nightfox.nvim'

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use 'petertriho/cmp-git'
  use 'prabirshrestha/vim-lsp'
  use 'dmitmel/cmp-vim-lsp'
  use 'kristijanhusak/vim-dadbod-completion'

  -- lua_snip
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Gitsigns
  use({ 'lewis6991/gitsigns.nvim' })

  -- Toggle Term
  use ({ 'akinsho/toggleterm.nvim' })

  -- Databases
  use({"https://github.com/tpope/vim-dadbod.git"})
  use({"kristijanhusak/vim-dadbod-ui"})

  -- Python REPL
  use({"geg2102/nvim-python-repl"})


  -- Automatically set up your configuration after cloning packer.nvim
  -- Keep this and the end of all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end

end)

