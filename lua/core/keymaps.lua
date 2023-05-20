-- Import the map function from utils
-- local map = require('core.utils').map
local default_opts = { noremap = true }

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Getting back to normal
vim.keymap.set({ "v", "i" }, "jk", "<esc>", default_opts)
vim.keymap.set({ "t" }, "<leader>jk", "<C-\\><C-N>", default_opts)

-- Better j,k movement
vim.keymap.set({ "n", "v" }, "j", "gj", default_opts)
vim.keymap.set({ "n", "v" }, "k", "gk", default_opts)

-- Better tabbing
vim.keymap.set({ "v" }, "<", "<gv", default_opts)
vim.keymap.set({ "v" }, ">", ">gv", default_opts)
vim.keymap.set({ "n" }, "<", "<<", default_opts)
vim.keymap.set({ "n" }, ">", ">>", default_opts)

-- Window Management
vim.keymap.set("n", "<leader>qq", "<cmd>q!<cr>", default_opts)
vim.keymap.set("n", "<leader>ww", "<cmd>w<cr>", default_opts)
vim.keymap.set("n", "<leader>vv", "<cmd>vs<cr>", default_opts)
vim.keymap.set("n", "<leader>ss", "<cmd>sp<cr>", default_opts)
vim.keymap.set("n", "<leader>QQ", "<cmd>wall<cr><cmd>qall<cr>", default_opts)
vim.keymap.set("n", "<leader>vn", "<cmd>vnew<cr>", default_opts)
vim.keymap.set("n", "<leader>sn", "<cmd>new<cr>", default_opts)

-- Window Navigation
vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>wincmd h<cr>", default_opts)
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>wincmd j<cr>", default_opts)
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>wincmd k<cr>", default_opts)
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>wincmd l<cr>", default_opts)

-- Window resizing
vim.keymap.set("n", "<Left>", "<cmd>vertical resize +1<cr>", default_opts)
vim.keymap.set("n", "<Right>", "<cmd>vertical resize -1<cr>", default_opts)
vim.keymap.set("n", "<Up>", "<cmd>resize +1<cr>", default_opts)
vim.keymap.set("n", "<Down>", "<cmd>resize -1<cr>", default_opts)

-- Buffers
vim.keymap.set({ "n" }, "<S-h>", "<cmd>bp<cr>", default_opts)
vim.keymap.set({ "n" }, "<S-l>", "<cmd>bn<cr>", default_opts)

-- Terminal
-- More terminal keymappings are in vim-slime
vim.keymap.set({ "n" }, "<leader>tt", "<cmd>term<cr>", default_opts)
vim.keymap.set({ "n" }, "<leader>st", "<cmd>sp|term<cr>", default_opts)
vim.keymap.set({ "n" }, "<leader>vt", "<cmd>vs|term<cr>", default_opts)

-- GitUI
-- vim.keymap.set({"n"}, "<leader>gg", "<cmd>tabnew | terminal gitui<cr>a", default_opts)

-- Protip: use :verbose nmap to see all keymappings and where they were set from
-- Or :Telescope keymap

-- Ipython autoreload modules
vim.keymap.set(
  { "n" },
  "<leader>ipy",
  "<esc>a%load_ext autoreload<cr>%autoreload 2<cr>%reload_ext autoreload<esc><S-v><up><up>",
  default_opts
)

-- Create a new tab
-- Tabnext - does all this shifiting around because visidata gets glitchy
-- unless you do
vim.keymap.set({ "n" }, "<leader>tn", "<cmd>tabnew %<cr><cmd>bp<cr><cmd>tabprev<cr><cmd>tabnext<cr>", default_opts)
vim.keymap.set({ "n" }, "<leader>tc", "<cmd>tabclose<cr>", default_opts)

-- Keymap to tabnext
vim.keymap.set({ "n" }, "<C-]>", "<cmd>tabnext<cr>", default_opts)
vim.keymap.set({ "n" }, "<C-[>", "<cmd>tabprev<cr>", default_opts)
vim.keymap.set({ "t" }, "<C-]>", "q<BS><cmd>tabnext<cr>", default_opts)
vim.keymap.set({ "t" }, "<C-[>", "q<BS><cmd>tabprev<cr>", default_opts)

vim.keymap.set({ "n", "t" }, "<C-t>", "<cmd>echo &channel<cr>", default_opts)

-- Running to-do list
vim.keymap.set({"n", "v", "t"}, "<leader>rtd", "<cmd>tabnew ~/Documents/rtd/rtd.md<cr>", default_opts)

-- Notes
-- vim.keymap.set({"n", "v"}, "<leader>not", "<cmd>tabnew ~/Documents/rtd/notes.md<cr>", default_opts)
vim.keymap.set({"n"}, "<leader>dd", function() vim.cmd("pu=strftime('%Y-%m-%d')" ) end)
-- vim.keymap.set({"n"}, "tt", function() vim.cmd("pu=strftime('%T')" ) end)
vim.keymap.set({"n"}, "<leader>hud", "<cmd>tabnew ~/Documents/rtd/rtd.md<cr><cmd>vs ~/Documents/rtd/notes.md<cr>")

