require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
  open_mapping = [[<c-\>]],
  -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
  hide_numbers = true, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  --highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
   -- Normal = {
   --   guibg = "<VALUE-HERE>",
   -- },
   -- NormalFloat = {
   --   link = 'Normal'
   -- },
   -- FloatBorder = {
   --   guifg = "<VALUE-HERE>",
   --   guibg = "<VALUE-HERE>",
   -- },
  --},
  --shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  --shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float', --'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit = false, -- close the terminal window when the process exits
   -- Change the default shell. Can be a string or a function returning a string
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'double', --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = math.ceil(vim.api.nvim_win_get_width(0)*0.8),
    height = math.ceil(vim.api.nvim_win_get_height(0)*0.8),
    winblend = 3,
    zindex = 1,
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}


-- TODO: Set up keymap to start connection
-- Set up shortcuts to run lines/visual mode
-- Pop up results in floating window for exploration
-- Shortcut to hide window


-- Function to prompt for remote or local connection
function sql_connect()
  local remote = vim.fn.input("Connect Remote? (y/N)")
  vim.cmd[[2ToggleTerm direction=horizontal size=25]]
  if remote ~= "y" then
    vim.cmd[[2TermExec cmd="psql -U timchristy -h localhost -p 5432 -d timchristy"]]
  else
    vim.cmd[[2TermExec cmd="psql -U tchristy -d data_services"]]
  end
end


-- vim.keymap.set({"t", "n", "i"}, "t", "<cmd>echo 'works!'<cr>", {noremap=true})

-- General function to set toggleterm keymappings based on filetype
local function set_toggleterm_keymap()
  -- Always use this
  -- Python - always terminal 1
  if vim.bo.filetype == "python" then
    vim.keymap.set("n", '<leader><cr>', '<cmd>ToggleTerm direction=horizontal size=25<cr><cmd>TermExec cmd="ipython"<cr>')
    vim.keymap.set("n", "<cr>", "<cmd>ToggleTermSendCurrentLine<cr>", {noremap=true})
    vim.keymap.set("v", "<cr>", "<cmd>ToggleTermSendVisualLines<cr>", {noremap=true})

  -- SQL
  elseif vim.bo.filetype == "sql" then
    vim.keymap.set("n", '<leader><cr>', '<cmd>lua sql_connect()<cr>', {noremap=true})
    vim.keymap.set("n", '<cr>', '<cmd>ToggleTermSendCurrentLine 2<cr>', {noremap=true})
    vim.keymap.set("v", '<cr>', '<cmd>ToggleTermSendVisualLines 2<cr>', {noremap=true})

  else
    vim.keymap.set("n", '<leader><cr>', '<cmd>5ToggleTerm direction=horizontal size=25<cr>')
    vim.keymap.set("n", '<cr>', '<cmd>ToggleTermSendCurrentLine 5<cr>', {noremap=true})
    vim.keymap.set("v", '<cr>', '<cmd>ToggleTermSendVisualLines 5<cr>', {noremap=true})
  end
end


-- Auto commands
-- Group function
local function group(grp)
  vim.api.nvim_create_augroup(grp, {clear=true})
end

-- change keymaps depending on filetype
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*",
  group = group("toggle_term_grp"),
  callback = set_toggleterm_keymap,
})

-- Always enter terminals in terminal mode
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern="",
  group=group("toggle_term_grp"),
  command="norm i",
})

