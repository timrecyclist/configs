-- Per setup in docs, setting the filetype repls
vim.cmd [[ let g:repl_filetype_commands = {'javascript': 'node', 'python': 'ipython', 'ruby': 'irb', 'lua':'lua'} ]]

-- Have the repl open below the current buffer
vim.cmd [[let g:repl_split = 'bottom']]

-- Create a user command to check if you want to connect locally or no
vim.api.nvim_create_user_command("SqlConnection", function()
  local host = vim.fn.input("Connect to remote? (y/N): ")
  if host == 'y' then
    vim.cmd [[ let g:repl_filetype_commands['sql'] = 'psql -U tchristy -p 5432 -d data_services']]
    vim.cmd [[ReplToggle]]
  else
    vim.cmd [[ let g:repl_filetype_commands['sql'] = 'psql -h localhost -U timchristy -p 5432']]
    vim.cmd [[ReplToggle]]
  end
end, {})

-- Create autocommands that modify the repl start
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("nvim_repl_grp", {clear = true}),
  pattern = "*",
  callback = function()
    local opts = {noremap=true}
    -- If the filetype is not sql
    if vim.bo.filetype ~= "sql" then
      vim.keymap.set({'n'}, '<leader><leader><cr>', '<cmd>ReplToggle<cr>', opts)
      vim.keymap.set({'n'}, '<leader><cr>', '<Plug>ReplSendLine', opts)
      vim.keymap.set({'v'}, '<leader><cr>', '<Plug>ReplSendVisual', opts)

    else
      vim.keymap.set({'n'}, '<leader><leader><cr>', '<cmd>SqlConnection<cr>', opts)
      vim.keymap.set({'n'}, '<leader><cr>', '<Plug>ReplSendLine', opts)
      vim.keymap.set({'v'}, '<leader><cr>', '<Plug>ReplSendVisual', opts)
    end
  end
})

