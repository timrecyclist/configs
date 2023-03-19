local opts = { silent = true, noremap = true }
vim.cmd [[let g:repl_filetype_commands = {'javascript': 'node', 'python': 'ipython --no-autoindent', 'ruby': 'irb', 'sql': 'psql -U tchristy -d data_services'}]]
vim.cmd [[let g:repl_split = 'bottom']]
vim.keymap.set('n', '<leader><leader><CR>', '<CMD>ReplToggle<CR>', opts)
vim.keymap.set('n','<leader><CR>', '<Plug>ReplSendLine', opts)
-- vim.keymap.set('v', '<leader><CR>', '<Plug>ReplSendVisual', opts)
vim.keymap.set('v', '<leader><CR>', '<Plug>ReplSendVisual<cr>', opts)

