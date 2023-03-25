-- augroup
local function augroup(group_name)
  return vim.api.nvim_create_augroup( group_name, {clear = true})
end

-- Autocommand to make a smoother close of terminal from gitui
vim.api.nvim_create_autocmd("TermClose",{
  group = augroup("gitui"),
  callback = function()
    vim.api.nvim_input("<cr>")
  end
})

-- Format python scripts on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("python_formatting"),
  buffer = 0,
  callback = function()
    vim.lsp.buf.format()
  end,
})
