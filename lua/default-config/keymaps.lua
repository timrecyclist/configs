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
map('n', '<leader>x', '<cmd>bdelete!<cr><cmd>bnext<cr>', opts)

-- Remove highlighting
map('n', '<leader>hl', '<cmd>nohl<cr>', opts)

-- Quick save and exit
map('n', '<leader>wq', '<cmd>w<cr><cmd>bdelete!<cr><cmd>bnext<cr>', opts)

-- Window Navigation for cursor
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- Moving Windows around
map('n', '<leader><s-h>', '<c-w>K', opts)
map('n', '<leader><s-k>', '<c-w>H', opts)
map('n', '<leader><s-s>', '<c-w>x', opts) -- swap windows around

-- Resize windows
map('n', '<up>', '<cmd>resize +2<cr>', opts)
map('n', '<down>', '<cmd>resize -2<cr>', opts)
map('n', '<left>', '<cmd>vertical resize -2<cr>', opts)
map('n', '<right>', '<cmd>vertical resize +2<cr>', opts)

-- Open up terminals
map('n', '<leader>tv', '<cmd>vs | term<cr>a', opts) -- vs
map('n', '<leader>ts', '<cmd>sp | term<cr>a', opts) -- sp

-- Buffer Navigation
map('n', '<S-h>', '<cmd>bprevious<cr>', opts) 
map('n', '<S-l>', '<cmd>bnext<cr>', opts) 
map('n', '<S-m>', '<cmd>tab split<cr>', opts)
map('n', '<S-b>', '<cmd>ball<cr>', opts)

-- Terminal Navigation
-- map('t', '<c-h>', '<c-\\><c-n><c-w><c-h>', opts)
-- map('t', '<c-j>', '<c-\\><c-n><c-w><c-j>', opts)
-- map('t', '<c-k>', '<c-\\><c-n><c-w><c-k>', opts)
-- map('t', '<c-l>', '<c-\\><c-n><c-w><c-l>', opts)

-- Better indentation
map('v', '<', '<gv', opts) 
map('v', '>', '>gv', opts) 

-- Paste over currently selected text without yanking it - i.e. you can paste repeatedly now
map('v', 'p', "'_dP", opts)

-- Center search results
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

-- Run a live server
map('n', '<leader>rls', '<cmd>term live-server %<cr><cmd>bp<cr>', opts)



--[[ Plugins ]]--
-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', opts)

-- Telescope
-- vim.keymap.set needed to execute functions
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts) 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

-- Lazygit
vim.keymap.set('n', '<leader>lg','<cmd>ToggleTerm<cr>lazygit<cr>', opts)

-- No neck pain (center the screen)
vim.keymap.set('n', '<leader>nnp', '<cmd>NoNeckPain<cr>', opts)

-- Colorizer
vim.keymap.set('n', '<leader>ca', '<cmd>ColorizerAttachToBuffer<cr>', opts)
vim.keymap.set('n', '<leader>ct', '<cmd>ColorizerToggle<cr>', opts)

-- Send to terminal
-- vim.keymap.set('n', 'g2', '<cmd>lua require("scripts").send()<CR>', opts)
-- vim.keymap.set('x', 'g2', '<cmd>lua require("scripts").send(true)<CR>', opts)
