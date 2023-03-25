-- Import the map function from utils
-- local map = require('core.utils').map
local default_opts = { noremap=true }

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Getting back to normal
vim.keymap.set({"v",  "i"}, "jk", "<esc>", default_opts)
vim.keymap.set({"t"}, "<leader>jk", "<C-\\><C-N>", default_opts)

-- Better j,k movement
vim.keymap.set({"n", "v"}, "j", "gj", default_opts)
vim.keymap.set({"n", "v"}, "k", "gk", default_opts)

-- Better tabbing
vim.keymap.set({"v"}, "<", "<gv", default_opts)
vim.keymap.set({"v"}, ">", ">gv", default_opts)
vim.keymap.set({"n"}, "<", "<<", default_opts)
vim.keymap.set({"n"}, ">", ">>", default_opts)

-- Window Management
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", default_opts)
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", default_opts)
vim.keymap.set("n", "<leader>v", "<cmd>vs<cr>", default_opts)
vim.keymap.set("n", "<leader>s", "<cmd>sp<cr>", default_opts)
vim.keymap.set("n", "<leader>Q", "<cmd>qall!<cr>", default_opts)

-- Window Navigation
vim.keymap.set({"n", "t"}, "<C-h>", "<C-w>h", default_opts)
vim.keymap.set({"n", "t"}, "<C-j>", "<C-w>j", default_opts)
vim.keymap.set({"n", "t"}, "<C-k>", "<C-w>k", default_opts)
vim.keymap.set({"n", "t"}, "<C-l>", "<C-w>l", default_opts)

-- Window resizing
vim.keymap.set("n", "<Left>", "<cmd>vertical resize +1<cr>", default_opts)
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -1<cr>", default_opts)
vim.keymap.set("n", "<Up>", "<cmd>resize +1<cr>", default_opts)
vim.keymap.set("n", "<Down>", "<cmd>resize -1<cr>", default_opts)

-- Open a terminal
vim.keymap.set({"n"}, "<leader>tv", "<cmd>vs | terminal<cr>", default_opts)
vim.keymap.set({"n"}, "<leader>ts", "<cmd>sp | terminal<cr>", default_opts)

-- Buffers
vim.keymap.set({"n"}, "<S-h>", "<cmd>bp<cr>", default_opts)
vim.keymap.set({"n"}, "<S-l>", "<cmd>bn<cr>", default_opts)
vim.keymap.set({"n"}, "<leader>x", "<cmd>bdelete<cr>", default_opts)

-- GitUI
vim.keymap.set({"n"}, "<leader>gg", "<cmd>tabnew | terminal gitui<cr>a", default_opts)

-- Protip: use :verbose nmap to see all keymappings and where they were set from
-- Or :Telescope keymap

-- Ipython autoreload modules
vim.keymap.set({"n"}, "<leader>ipy", "<esc>a%load_ext autoreload<cr>%autoreload 2<cr>%reload_ext autoreload<cr>", default_opts)
