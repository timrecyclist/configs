-- VSCode
-- if vim.g.vscode then
--     -- VSCode extension
-- else
--     -- ordinary Neovim
-- end
-- Non-plugin stuff
require("core.options")
require("core.utils")
require("core.keymaps")

-- IMPORTANT: source lazy first
require("core.lazy")
require("core.colors")
require("core.autocmds")
require("core.plugin_configs.telescope")
-- require("core.plugin_configs.true-zen")
-- neodev needs to come before lsp
require("core.plugin_configs.neodev")
require("core.plugin_configs.lsp")
require("core.plugin_configs.neo-tree")

-- require("core.plugin_configs.dadbod")
require("core.plugin_configs.autopairs")
require("core.plugin_configs.fugitive")
require("core.plugin_configs.nvim-luapad")
--require("core.plugin_configs.toggle-term")
-- require("core.plugin_configs.nvim-repl") -- Don't try this one again.
-- require("core.plugin_configs.vim-repl")
require("core.plugin_configs.vim-slime")
-- vim.cmd[[command! Scratch lua require("core.utils").makeScratch()]]
-- :lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))


