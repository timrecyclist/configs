require("core.plugin_configs.lsp.dap")
require("core.plugin_configs.lsp.mason")
require("core.plugin_configs.lsp.cmp")
require("core.plugin_configs.lsp.treesitter")
require("core.plugin_configs.lsp.null-ls")

-- Add borders to windows
local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = 'double'
  return opts
end
