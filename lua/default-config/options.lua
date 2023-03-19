local opts = {
  
  -- Window splitting
  splitright = true,
  splitbelow = true,

  -- Spacing and cursor
  cursorline = true,
  smartindent = false,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  scrolloff = 20,
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

  wrap = true,
  linebreak = true,
  list = false,
  textwidth=80,


  -- show invisibles
  --listchars={tab:▸\ ,eol:¬},
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
