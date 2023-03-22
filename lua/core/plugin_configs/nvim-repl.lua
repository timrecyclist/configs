vim.cmd [[ let g:repl_filetype_commands = {'javascript': 'node', 'python': 'ipython', 'ruby': 'irb', 'sql':'psql -U tchristy -d data_services', 'lua':'lua'} ]]

vim.cmd [[let g:repl_split = 'bottom']]

local opts = {buffer=0, noremap=true}
vim.keymap.set({'n'}, '<leader><leader><cr>', '<cmd>ReplToggle<cr>', opts)
vim.keymap.set({'n'}, '<leader><cr>', '<Plug>ReplSendLine', opts)
vim.keymap.set({'v'}, '<leader><cr>', '<Plug>ReplSendVisual', opts)
