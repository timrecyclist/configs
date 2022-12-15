-- Bootstrap packer if not already installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Auto compile packer after saving
local packer_group = vim.api.nvim_create_augroup('packer_grp', {clear = true})
vim.api.nvim_create_autocmd({'BufWritePost'}, {
  pattern = 'packer.lua',
  group = packer_group,
  callback = function()
    dofile(vim.fn.expand('%'))  -- dofile reloads this script (%)
    vim.cmd[[PackerSync]]
  end,
})

return require('packer').startup({function(use)
  use('wbthomason/packer.nvim')

  -- Colors
  use('EdenEast/nightfox.nvim')
  use('sainnhe/everforest')

  -- LSP
  use({ 'williamboman/mason.nvim' , commit='b3c82a23b26818e18e20036452bdcf7821ddc37d'})
  use({'williamboman/mason-lspconfig.nvim', commit='e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526'})
  use({'neovim/nvim-lspconfig', commit='cbf8762f15fac03a51eaa2c6f983d4a5045c95b4'}) -- Configurations for Nvim LSPuse 'hrsh7th/nvim-cmp' -- Autocompletion plugin

  -- cmp
  use({'hrsh7th/nvim-cmp', commit='8a9e8a89eec87f86b6245d77f313a040a94081c1'}) -- Autocompletion plugin
  use({'hrsh7th/cmp-nvim-lsp', commit='78924d1d677b29b3d1fe429864185341724ee5a2'})-- LSP source for nvim-cmp
  use({'saadparwaiz1/cmp_luasnip', commit='18095520391186d634a0045dacaa346291096566'})-- Snippets source for nvim-cmp
  use({'L3MON4D3/LuaSnip', commit = '2172a95476715e86de2fc01972813ee2d018d72d'})-- Snippets plugin

  -- TreeSitter
  use({'nvim-treesitter/nvim-treesitter', commit='d31c71c959348b7b15f7e69608a47aea05ed7bc6'})

  -- Nvim-Tree
  use ({
    'nvim-tree/nvim-tree.lua', commit='0cd8ac4751c39440a1c28c6be4704f3597807d29',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  })
  
  -- Telescope
  use({'nvim-telescope/telescope.nvim', tag='0.1.0', commit='cabf991b1d3996fa6f3232327fc649bbdf676496',
       requires = {{'nvim-lua/plenary.nvim'}, { "kdheepak/lazygit.nvim" } },
       config = function()
          require("telescope").load_extension("lazygit")
       end,
     })

    -- Suggested plugins for telescope
    -- brew install fd: https://github.com/sharkdp/fd
    -- and ripgrep: https://github.com/BurntSushi/ripgrep
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- Gitsigns
  use { 'lewis6991/gitsigns.nvim', tag='v0.5' }

  -- Python REPL
  use({'geg2102/nvim-python-repl',
        commit='126792f6d165cd2f694bbeeda040133bd6a8019b'})

  -- Lualine
  use({'nvim-lualine/lualine.nvim',
       commit='9d177b668c18781c53abde92116f141f3d84b04c',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })

  -- Bufferline
  use({'akinsho/bufferline.nvim', 
        tag = "v3.*", 
        commit="4ecfa81e470a589e74adcde3d5bb1727dd407363",
        requires = 'nvim-tree/nvim-web-devicons',
  })

  -- vim-illuminate - light highlight all instances of a variable when cursor is on it
  use({'RRethy/vim-illuminate', commit='1aa7f68d3858e5409c4d99049c0703f15b70e735'})

  -- General Purpose REPL
  use {'hkupty/iron.nvim', tag = "v3.0"}

  -- Greeter
  use({'goolord/alpha-nvim', commit='0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31'})

  -- ToggleTerm
  use({'akinsho/toggleterm.nvim', commit='b02a1674bd0010d7982b056fd3df4f717ff8a57a'})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end,
  -- Open in floating window rather than vsplit
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }})
