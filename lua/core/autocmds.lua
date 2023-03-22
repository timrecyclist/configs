-- Autocommand to make a smoother close of terminal from gitui
vim.cmd[[ 
augroup gitui
  autocmd!
  autocmd TermClose term://*gitui lua vim.api.nvim_input("<CR>")
augroup END
]]
