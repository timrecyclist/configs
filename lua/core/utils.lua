-- Utils Module
-- Using the table M allows us to keep things out of the global scope and to
-- use only what we need when calling the function from nvim
local M = {}

local api = vim.api

function M.makeScratch()
  -- We can create a new buffer with the enew command, and the neovim API gives
  -- us a way to call nvim commands from lua:
  api.nvim_command('enew') -- equivalent to :enew

  -- Next we want to set some buffer options so that our scratch buffer isn't
  -- listed in the buffer list and doesn't have a swapfile created
  vim.bo[0].buftype='nofile'  -- set the current buffer's (buffer 0) buftype to nofile
  vim.bo[0].bufhidden='hide'
  vim.bo[0].swapfile=false
end

return M
