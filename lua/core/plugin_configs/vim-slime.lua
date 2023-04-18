vim.cmd[[let g:slime_target = "neovim"]]

-- Turn off default mappings
vim.cmd[[let g:slime_no_mappings=1]]

-- Use this ya dummy
-- vim.g.slime_get_jobid = function()
  -- some way to select and return jobid
--end


-- Float option is currently not working.
local function ipython_repl(split)
  if split == "float" then
    -- Start a buffer
    local bufnum = vim.api.nvim_create_buf(true, false)

    -- Set the option bufhidden for this buffer - i.e. delete when hidden
    vim.api.nvim_buf_set_option(bufnum, 'bufhidden', 'hide')

    -- Set the filetype
    vim.api.nvim_buf_set_option(bufnum, 'filetype', 'vim-slime')

    -- get the dimensions of the current window
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- calculate the floating window size
    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8 - 4)

    -- Starting position
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    -- set options for the window
    local opts = {
        style = "minimal", -- removes settings like linenumbers
        relative = "editor", -- display position relative to editor top left corner
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        border = "double"
    }
    -- Open window and set buffer
    local winnum = vim.api.nvim_open_win(bufnum, true, opts)
    vim.api.nvim_win_set_buf(winnum, bufnum)
    vim.cmd[[
    execute 'terminal ipython --no-autoindent'
    setlocal nonumber
    let t:term_id = b:terminal_job_id
    wincmd p
    execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
    ]]

  -- Vertical
  elseif split == "vertical" then
    vim.cmd[[vsplit]]
    local winnum = vim.api.nvim_get_current_win()
    local bufnum = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_option(bufnum, 'bufhidden', 'hide')
    vim.api.nvim_buf_set_option(bufnum, 'filetype', 'vim-slime')
    vim.api.nvim_win_set_buf(winnum, bufnum)
    vim.cmd[[
    execute 'terminal ipython --no-autoindent'
    setlocal nonumber
    let t:term_id = b:terminal_job_id
    wincmd p
    execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
    ]]

  -- Horizontal
  else
    vim.cmd[[split]]
    local winnum = vim.api.nvim_get_current_win()
    local bufnum = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_option(bufnum, 'bufhidden', 'hide')
    vim.api.nvim_buf_set_option(bufnum, 'filetype', 'vim-slime')
    vim.api.nvim_win_set_buf(winnum, bufnum)
    vim.cmd[[
    execute 'terminal ipython --no-autoindent'
    setlocal nonumber
    let t:term_id = b:terminal_job_id
    wincmd p
    execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
    ]]
  end
end

local function psql_repl(split, remote)
  if split == "float" then
    -- Start a buffer
    local bufnum = vim.api.nvim_create_buf(true, false)

    -- Set the option bufhidden for this buffer - i.e. delete when hidden
    vim.api.nvim_buf_set_option(bufnum, 'bufhidden', 'hide')

    -- Set the filetype
    vim.api.nvim_buf_set_option(bufnum, 'filetype', 'vim-slime')

    -- get the dimensions of the current window
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- calculate the floating window size
    local win_width = math.ceil(width * 0.8)
    local win_height = math.ceil(height * 0.8 - 4)

    -- Starting position
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    -- set options for the window
    local opts = {
        style = "minimal", -- removes settings like linenumbers
        relative = "editor", -- display position relative to editor top left corner
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        border = "double"
    }
    -- Open window and set buffer
    local winnum = vim.api.nvim_open_win(bufnum, true, opts)
    vim.api.nvim_win_set_buf(winnum, bufnum)

    if remote then
      vim.cmd[[
      execute 'terminal psql -U tchristy'
      setlocal nonumber
      let t:term_id = b:terminal_job_id
      wincmd p
      execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
      ]]
    else
      vim.cmd[[
      execute 'terminal psql -U timchristy -h localhost -p 5432'
      setlocal nonumber
      let t:term_id = b:terminal_job_id
      wincmd p
      execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
      ]]
    end
  -- Vertical
  elseif split == "vertical" then
    vim.cmd[[vsplit]]
    local winnum = vim.api.nvim_get_current_win()
    local bufnum = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_option(bufnum, 'bufhidden', 'hide')
    vim.api.nvim_buf_set_option(bufnum, 'filetype', 'vim-slime')
    vim.api.nvim_win_set_buf(winnum, bufnum)
    if remote then
      vim.cmd[[
      execute 'terminal psql -U tchristy'
      setlocal nonumber
      let t:term_id = b:terminal_job_id
      wincmd p
      execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
      ]]
    else
      vim.cmd[[
      execute 'terminal psql -U timchristy -h localhost -p 5432'
      setlocal nonumber
      let t:term_id = b:terminal_job_id
      wincmd p
      execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
      ]]
    end
  else
    vim.cmd[[split]]
    local winnum = vim.api.nvim_get_current_win()
    local bufnum = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_option(bufnum, 'bufhidden', 'hide')
    vim.api.nvim_buf_set_option(bufnum, 'filetype', 'vim-slime')
    vim.api.nvim_win_set_buf(winnum, bufnum)
    if remote then
      vim.cmd[[
      execute 'terminal psql -U tchristy'
      setlocal nonumber
      let t:term_id = b:terminal_job_id
      wincmd p
      execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
      ]]
    else
      vim.cmd[[
      execute 'terminal psql -U timchristy -h localhost -p 5432'
      setlocal nonumber
      let t:term_id = b:terminal_job_id
      wincmd p
      execute 'let b:slime_config = {"jobid": "'.t:term_id . '"}'
      ]]
    end
  end
end

local slopts = {noremap=true}
function Slimekeys(repl)
  if repl == "ipython" then
    vim.keymap.set({"n"}, "<leader><cr>", ipython_repl, slopts)
    vim.keymap.set({"n"}, "<cr>", "<cmd>SlimeSend<cr>", slopts)
    vim.keymap.set({"v"}, "<cr>", "<Plug>SlimeRegionSend", slopts)
  elseif repl == "psql" then
    vim.keymap.set({"n"}, "<leader><cr>", psql_repl, slopts)
    vim.keymap.set({"n"}, "<cr>", "<cmd>SlimeSendCurrentLine<cr>", slopts)
    vim.keymap.set({"v"}, "<cr>", "<Plug>SlimeRegionSend", slopts)
  else
    vim.keymap.set({"n"}, "<leader><cr>", "<cmd>sp|term<cr>", slopts)
    vim.keymap.set({"n"}, "<cr>", "<cmd>SlimeSendCurrentLine<cr>", slopts)
    vim.keymap.set({"v"}, "<cr>", "<Plug>SlimeRegionSend", slopts)
  end
end

-- Autocommands to set keybindings depending on file
local grp = vim.api.nvim_create_augroup("vim-slime", {clear=true})

vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"}, {
  group=grp,
  pattern="*.py",
  callback = function()
    Slimekeys("ipython")
  end
})

vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"}, {
  group=grp,
  pattern="*.sql",
  callback = function()
    Slimekeys("psql")
  end
})

vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"}, {
  group=grp,
  pattern="term://*",
  command="norm a"
})

