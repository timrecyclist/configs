local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }


-- Leader keys
map('', "<space>", "<nop>", opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Normal Mode
map('i', 'jk', '<esc>', opts)
map('v', 'jk', '<esc>', opts)

-- Splits
map('n', '<leader>v', '<cmd>vs<cr><cmd>bn<cr>', opts)
map('n', '<leader>s', '<cmd>sp<cr><cmd>bn<cr>', opts)
map('n', '<leader>x', '<cmd>tabclose!<cr>', opts)
map('n', '<leader>X', '<cmd>bdelete!<cr>', opts)

-- Window Navigation
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- Resize windows
map('n', '<up>', '<cmd>resize -2<cr>', opts)
map('n', '<down>', '<cmd>resize -2<cr>', opts)
map('n', '<left>', '<cmd>vertical resize -2<cr>', opts)
map('n', '<right>', '<cmd>vertical resize -2<cr>', opts)

-- Open up terminals
map('n', '<leader>tv', '<cmd>vs | term<cr>a', opts) -- vs
map('n', '<leader>ts', '<cmd>sp | term<cr>a', opts) -- sp

-- Buffer Navigation
map('n', '<S-h>', '<cmd>bprevious<cr>', opts) 
map('n', '<S-l>', '<cmd>bnext<cr>', opts) 

-- Terminal Navigation
map('t', '<c-h>', '<c-\\><c-n><c-w>h', opts) 
map('t', '<c-j>', '<c-\\><c-n><c-w>j', opts) 
map('t', '<c-k>', '<c-\\><c-n><c-w>k', opts) 
map('t', '<c-l>', '<c-\\><c-n><c-w>l', opts) 

-- Better indentation
map('v', '<', '<gv', opts) 
map('v', '>', '>gv', opts) 

-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts) 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

