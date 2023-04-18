vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>")
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<cr>")
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>")
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<cr>")
vim.keymap.set("n", "<leader>gx", "<cmd>Gremove<cr>")
vim.keymap.set("n", "<leader>gm", "<cmd>Gmove<cr>")
vim.keymap.set("n", "<leader>gc", "<cmd>G commit<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>G blame<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>G fetch<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>G pull<cr>")
vim.keymap.set("n", "<leader>gP", "<cmd>G push<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>GcLog<cr>")

vim.keymap.set({ "n", "v" }, "<leader>dg", "<cmd>diffget<cr>")
vim.keymap.set({ "n", "v" }, "<leader>dp", "<cmd>diffput<cr>")
vim.keymap.set({"n", "v"}, "<leader>du", "<cmd>diffupdate<cr>")

vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("fugitive_grp", {clear=true}),
  pattern = "fugitive://*",
  callback = function()
    vim.api.nvim_buf_set_option(0, 'bufhidden', 'delete')
    
  end
})
vim.cmd[[set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P]]
