require('luapad').setup {
  count_limit = 150000,
  error_indicator = true,
  preview = true,
  eval_on_change = true,
  eval_on_move = false,
  print_highlight = 'Comment',
  error_highlight = 'WarningMsg',
  split_orientation = 'vertical',
  on_init = function()
    print 'Hello from Luapad!'
  end,
  context = {
    the_answer = 42,
    shout = function(str) return(string.upper(str) .. '!') end
  },
  wipe = true,
}

vim.keymap.set({'n', 'v'}, '<leader>lp', "<cmd>Luapad<cr>")
