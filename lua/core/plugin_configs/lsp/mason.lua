require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "vtsls" },
})

-- Icons for diagnostic errors
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Create Global mappings for the LSP
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>;", vim.diagnostic.setloclist)

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function()
  local opts = { buffer = 0, noremap = true }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
--[[
    vim.keymap.set('n', '<space>pa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>pr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>pl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
--]]

  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)

  -- Toggle diagnostics
  vim.keymap.set("n", "<space>de", vim.diagnostic.enable, opts)
  vim.keymap.set("n", "<space>dd", vim.diagnostic.disable, opts)
end

-- Handlers
-- Lua
require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnositcs = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- If I don't do this, I get "do you need to configure your work environment as luv"
      },
    },
  },
})

-- Python
require("lspconfig").jedi_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").pyre.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").ruff_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- Emmet
require("lspconfig").emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- HTML

require("lspconfig").html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- CSS
require("lspconfig").cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").cssmodules_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").unocss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- Javascript
require("lspconfig").quick_lint_js.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").vtsls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- Ruby
require("lspconfig").solargraph.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").sorbet.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").ruby_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
require("lspconfig").standardrb.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- SQL
require("lspconfig").sqlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- JSON
require("lspconfig").jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
