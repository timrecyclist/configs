--[[
General format for setting options in nvim:
vim.opt.<option> = <value>
--]]

-- Window Splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Spacing/cursor stuff
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.scrolloff = 10


-- Gutter
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Other
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false


