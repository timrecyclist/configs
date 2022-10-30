-- NOTE: LSP keybindings are in lsp/handlers.lua
local keymap = vim.keymap.set
local opts = { noremap = true }  -- silent = true

-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Getting Normal
keymap('i', 'jk', '<ESC>', opts)
keymap('v', 'jk', '<ESC>', opts)

-- netrw
keymap('n', '<leader>nrw', '<cmd>Vex<CR>', opts)
keymap('n', '<leader>nnrw', '<cmd>Ex<CR>', opts)

-- Buffers
keymap('n', '<S-b>', '<cmd>bprevious<CR>', opts)
keymap('n', '<S-n>', '<cmd>bnext<CR>', opts)
keymap('n', '<S-x>', '<cmd>bdelete!<CR>', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resizing
keymap('n', '<Up>k', '<cmd>resize -2<CR>', opts)
keymap('n', '<Down>j', '<cmd>resize +2<CR>', opts)
keymap('n', '<Left>h', '<cmd>vertical resize -2<CR>', opts)
keymap('n', '<Right>l', '<cmd>vertical resize +2<CR>', opts)

-- Gitsigns Toggles
keymap('n', '<leader>gst', '<cmd>Gitsigns toggle_signs<CR>', opts)
keymap('n', '<leader>gsn', '<cmd>Gitsigns toggle_numhl<CR>', opts)
keymap('n', '<leader>gsl', '<cmd>Gitsigns toggle_linehl<CR>', opts)
keymap('n', '<leader>gsd', '<cmd>Gitsigns toggle_word_diff<CR>', opts)
keymap('n', '<leader>gsb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)

-- Quick Edits
keymap('n', '<leader>ekb', '<cmd>vs ~/.config/nvim/lua/tim/keymaps.lua<CR>', opts)
keymap('n', '<leader>eop', '<cmd>vs ~/.config/nvim/lua/tim/options.lua<CR>', opts)
keymap('n', '<leader>pack', '<cmd>vs ~/.config/nvim/lua/tim/plugins.lua<CR>', opts)
keymap('n', '<leader>after', '<cmd>Ex ~/.config/nvim/after/plugin/<CR>', opts)

keymap('n', '<leader>so', '<cmd>so $MYVIMRC<CR>', opts)

-- Database --> pg.nvim
keymap('n', '<leader>qc', '<cmd>PGConnectBuffer<cr>')
keymap('v', '<leader>qq', '<cmd>exec "PGRunQuery"<cr>')
