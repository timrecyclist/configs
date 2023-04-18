require("telescope").setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
--        ["<C-h>"] = "which_key",
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})
local builtin = require("telescope.builtin")
local opts = { noremap = true }
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fc", builtin.commands, opts)
vim.keymap.set("n", "<leader>fm", builtin.man_pages, opts)
vim.keymap.set("n", "<leader>fq", builtin.quickfix, opts)
vim.keymap.set("n", "<leader>fo", builtin.vim_options, opts)
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { noremap = true, buffer = 0 })

-- Git
vim.keymap.set("n", "<leader>tf", builtin.git_files, opts)
vim.keymap.set("n", "<leader>tc", builtin.git_commits, opts)
vim.keymap.set("n", "<leader>td", builtin.git_bcommits, opts)
vim.keymap.set("n", "<leader>tb", builtin.git_branches, opts)
vim.keymap.set("n", "<leader>ts", builtin.git_status, opts)
vim.keymap.set("n", "<leader>tx", builtin.git_stash, opts)

-- Lua dev - reload modules
vim.keymap.set("n", "<leader>tr", "<cmd>Telescope reloader<cr>", opts)
