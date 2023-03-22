-- Dapui
require("neodev").setup({
  library = { plugins = {"nvim-dap-ui" }, types = true },
})
require("dapui").setup()
vim.keymap.set("n", "<F12>", require('dapui').toggle)

-- Keymaps
vim.keymap.set("n", "<leader><leader>b", require('dap').toggle_breakpoint)
vim.keymap.set("n", "<F1>", require('dap').continue)
vim.keymap.set("n", "<F2>",require('dap').step_into)
vim.keymap.set("n", "<F3>",require('dap').step_over)
vim.keymap.set("n", "<F4>",require('dap').step_out)
-- vim.keymap.set("n", "<leader>B", require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')))

-- Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
