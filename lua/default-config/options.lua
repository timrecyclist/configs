local opts = {
  
  -- Window splitting
  splitright = true,
  splitbelow = true,

  -- Spacing and cursor
  cursorline = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false,
  scrolloff = 10,
  sidescrolloff = 10,

  relativenumber = true,
  number = true,
  numberwidth = 4,
--  signcolumn = "yes",
  colorcolumn = "80",

  fileencoding = "utf-8",
  swapfile = false,

  ignorecase = true,
  smartcase = true,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
