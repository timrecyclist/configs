-- Non-plugin stuff
require("core.keymaps")
require("core.options")
require("core.utils")

-- IMPORTANT: source lazy first
require("core.lazy")
require("core.colors")
require("core.autocmds")
require("core.plugin_configs.nvim-repl")
require("core.plugin_configs.neo-tree")
require("core.plugin_configs.telescope")
-- neodev needs to come before lsp
require("core.plugin_configs.neodev")
require("core.plugin_configs.lsp")
