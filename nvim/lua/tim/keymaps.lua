-- NOTE: LSP keybindings are in lsp/handlers.lua
local keymap = vim.keymap.set
local opts = { noremap = true }  -- silent = true

-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Normal Mode
keymap('i', 'jk', '<esc>', opts)
keymap('v', 'jk', '<esc>', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- netrw
-- keymap('n', '<leader>nrw', '<cmd>Vex<cr>', opts)
-- keymap('n', '<leader>nnrw', '<cmd>Ex<cr>', opts)

-- nvim-tree
keymap('n', '<leader>nvt', '<cmd>NvimTreeToggle<cr>', opts)
keymap('n', '<leader>nvtr', '<cmd>NvimTreeRefresh<cr>', opts)

-- Buffers
-- Swap buffer in window
keymap('n', '<S-b>', '<cmd>bprevious<cr>', opts)
keymap('n', '<S-n>', '<cmd>bnext<cr>', opts)
-- Delete buffer
keymap('n', '<S-x>', '<cmd>bdelete!<cr><cmd>bprevious<cr>', opts)
-- Open next buffer in vsplit
keymap('n', '<S-s>b', '<cmd>vs | bnext<cr>', opts)

-- Window Navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resizing
keymap('n', '<Up>', '<cmd>resize -2<cr>', opts)
keymap('n', '<Down>', '<cmd>resize +2<cr>', opts)
keymap('n', '<Left>', '<cmd>vertical resize -2<cr>', opts)
keymap('n', '<Right>', '<cmd>vertical resize +2<cr>', opts)

-- Gitsigns Toggles
keymap('n', '<leader>gst', '<cmd>Gitsigns toggle_signs<cr>', opts)
keymap('n', '<leader>gsn', '<cmd>Gitsigns toggle_numhl<cr>', opts)
keymap('n', '<leader>gsl', '<cmd>Gitsigns toggle_linehl<cr>', opts)
keymap('n', '<leader>gsd', '<cmd>Gitsigns toggle_word_diff<cr>', opts)
keymap('n', '<leader>gsb', '<cmd>Gitsigns toggle_current_line_blame<cr>', opts)

-- Quick Edits
keymap('n', '<leader>ekb', '<cmd>vs ~/.config/nvim/lua/tim/keymaps.lua<cr>', opts)
keymap('n', '<leader>eop', '<cmd>vs ~/.config/nvim/lua/tim/options.lua<cr>', opts)
keymap('n', '<leader>pack', '<cmd>vs ~/.config/nvim/lua/tim/plugins.lua<cr>', opts)
keymap('n', '<leader>after', '<cmd>NvimTreeOpen ~/.config/nvim/after/plugin/<cr>', opts)

-- Database --> pg.nvim
-- keymap('v', '<leader>qq', '<cmd><c-u>exec "PGRunQuery"<cr>', opts)
-- keymap('n', '<leader>qc', '<cmd>PGConnectBuffer<cr>', opts)

-- Run .py
keymap ('n', '<leader>rp', '<cmd>w<cr><cmd>sp | term python %<cr>', opts)

-- Live server for current directory
keymap('n', '<leader>rls', '<cmd>term live-server %<cr><cmd>bp<cr>', opts)

-- lazygit
keymap('n', '<leader>lg', '<cmd>term lazygit<cr>', opts)

-- Packer
keymap('n', '<leader>pki', '<cmd>PackerInstall<cr>', opts)
keymap('n', '<leader>pkc', '<cmd>PackerClean<cr>', opts)

-- Open a link when clicking on it
-- keymap('n', 'gx', 

-- Telescope
-- files
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
-- git
keymap('n', '<leader>commit', '<cmd>Telescope git_commits<cr>', opts)
keymap('n', '<leader>branch', '<cmd>Telescope git_branches<cr>', opts)
keymap('n', '<leader>status', '<cmd>Telescope git_status<cr>', opts)
keymap('n', '<leader>stash', '<cmd>Telescope git_stash<cr>', opts)
-- grep, buffers, keymaps, and options
keymap('n', '<leader>grep', '<cmd>Telescope grep_string<cr>', opts)
keymap('n', '<leader>lgrep', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<leader>buf', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>map', '<cmd>Telescope keymaps<cr>', opts)
keymap('n', '<leader>opt', '<cmd>Telescope vim_options<cr>', opts)

