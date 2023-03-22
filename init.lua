-- Plug-in free modules
require("core.keymaps")
require("core.options")
require("core.utils")

-- IMPORTANT: You need to source lazy before sourcing anything plug-in related
require("core.lazy")
require("core.colors")
require("core.autocmds")
-- neodev needs to come before lsp
require("core.plugin_configs.neodev")
require("core.plugin_configs.lsp")
require("core.plugin_configs.treesitter")
require("core.plugin_configs.cmp")
require("core.plugin_configs.nvim-repl")
require("core.plugin_configs.neo-tree")
