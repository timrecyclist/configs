-- augroup
local function augroup(group_name)
  return vim.api.nvim_create_augroup(group_name, { clear = true })
end

-- Autocommand to make a smoother close of terminal from gitui
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup("gitui_grp"),
  callback = function()
    vim.api.nvim_input("<cr>")
  end,
})

-- Format python scripts on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("python_formatting_grp"),
  pattern="*.py",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("yank_highlighting_grp"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open csv and zip files in VisiData
-- Figure this out
-- vim.api.nvim_create_autocmd("BufReadPre", {
--   group = augroup("visidata_grp"),
--   pattern = { "*.xlsx", "*.xls", "*.csv" },
--   callback = function()
--     print("called it!")
--     vim.cmd([[terminal | vd %]])
--   end,
-- })
