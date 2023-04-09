-- Non-plugin stuff
require("core.options")
require("core.utils")
require("core.keymaps")

-- IMPORTANT: source lazy first
require("core.lazy")
require("core.colors")
require("core.autocmds")
require("core.plugin_configs.nvim-repl")
require("core.plugin_configs.telescope")
require("core.plugin_configs.true-zen")
-- neodev needs to come before lsp
require("core.plugin_configs.neodev")
require("core.plugin_configs.lsp")
require("core.plugin_configs.neo-tree")

require("core.plugin_configs.dadbod")
require("core.plugin_configs.autopairs")
require("core.plugin_configs.fugitive")

-- vim.cmd[[command! Scratch lua require("core.utils").makeScratch()]]
