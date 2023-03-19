-- Bootstrap packer if not already installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Auto compile packer after saving
local packer_group = vim.api.nvim_create_augroup("packer_grp", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "packer.lua",
	group = packer_group,
	callback = function()
		dofile(vim.fn.expand("%")) -- dofile reloads this script (%)
		vim.cmd([[PackerSync]])
	end,
})

return require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- Dependencies a lot of plugins depend on
		use({
			"nvim-lua/plenary.nvim", -- 'All the lua functions I don't wanna rewrite'
			commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
		})

		-- use({'MunifTanjim/nui.nvim', -- A ui interface for neovim
		--      commit='e67310b23d21ebe8b12d9dbadb3dfa562dda5057'})
		-- Autopairs
		-- use({"windwp/nvim-autopairs"})

		-- Colors
		use("EdenEast/nightfox.nvim")
		use("sainnhe/everforest")
		use("sainnhe/sonokai")
		use("folke/tokyonight.nvim")
		use("rose-pine/neovim")
		use("catppuccin/nvim")
		use("ellisonleao/gruvbox.nvim")

		-- LSP
		use({
			"williamboman/mason.nvim",
			commit = "b3c82a23b26818e18e20036452bdcf7821ddc37d",
		})
		use({
			"williamboman/mason-lspconfig.nvim",
			commit = "e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526",
		})
		use({
			"neovim/nvim-lspconfig",
			commit = "cbf8762f15fac03a51eaa2c6f983d4a5045c95b4",
		})

		-- Code formatting
		use("jose-elias-alvarez/null-ls.nvim")
		use("MunifTanjim/prettier.nvim")

		-- cmp
		use({
			"hrsh7th/nvim-cmp", -- Autocompletion plugin
			commit = "8a9e8a89eec87f86b6245d77f313a040a94081c1",
		})
		use({
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			commit = "78924d1d677b29b3d1fe429864185341724ee5a2",
		})
		use({
			"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
			commit = "18095520391186d634a0045dacaa346291096566",
		})
		use({
			"L3MON4D3/LuaSnip", -- Snippets plugin
			commit = "2172a95476715e86de2fc01972813ee2d018d72d",
		})
		use({ "rafamadriz/friendly-snippets" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-cmdline" })

		-- TreeSitter
		use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

		-- Nvim-Tree
		use({
			"nvim-tree/nvim-tree.lua",
			tag = "nightly", -- optional, updated every week. (see issue #1193)
			requires = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { "nvim-lua/plenary.nvim" },
		})

		-- Suggested plugins for telescope - brew install them
		-- fd: https://github.com/sharkdp/fd
		-- ripgrep: https://github.com/BurntSushi/ripgrep
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = [[cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
                 && cmake --build build --config Release &&
                 cmake --install build --prefix build]],
		})
		-- Gitsigns
		use({ "lewis6991/gitsigns.nvim", tag = "v0.5" })

		-- Trying out new repl
		use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })
		use({ "pappasam/nvim-repl", commit = "bd937ea732df11bc06abff925434a32c572ad4ac" })

		-- Lualine
		use({
			"nvim-lualine/lualine.nvim",
			commit = "9d177b668c18781c53abde92116f141f3d84b04c",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- Bufferline
		--   use({'akinsho/bufferline.nvim',
		--         tag = 'v3.*',
		--         requires = 'nvim-tree/nvim-web-devicons',
		--   })
		--
		-- vim-illuminate
		use({
			"RRethy/vim-illuminate", -- highlight all instances when cursor is on it
			commit = "1aa7f68d3858e5409c4d99049c0703f15b70e735",
		})

		-- ToggleTerm
		use({
			"akinsho/toggleterm.nvim",
			commit = "b02a1674bd0010d7982b056fd3df4f717ff8a57a",
		})

		-- Colorizer
		use({ "norcalli/nvim-colorizer.lua" })

		-- vim-startify
		use({ "mhinz/vim-startify" })

		-- Github Copilot
		-- use('github/copilot.vim')

		-- Notetaking
		use({ "vimwiki/vimwiki" })

		-- Harpoon
		use({ "ThePrimeagen/harpoon" })

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	-- Open in floating window rather than vsplit
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
