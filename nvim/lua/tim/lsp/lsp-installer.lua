lsp_installer = require('nvim-lsp-installer')

-- Register a handler that will be called for all installed servers.
-- Alternatively, ypu may also register handlers on specific server instances
-- instead. See below
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('tim.lsp.handlers').on_attach,
    capabilities = require('tim.lsp.handlers').capabilities,
  }

    if server.name == 'jsonls' then
      local jsonls_opts = require('tim.lsp.settings.jsonls')
      opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
    end

    if server.name == 'sumneko_lua' then 
      local sumneko_opts = require('tim.lsp.settings.sumneko_lua')
      opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    if server.name == 'pyright' then 
      local pyright_opts = require('tim.lsp.settings.pyright')
      opts = vim.tbl_deep_extend('force', pyright_opts, opts)
    end

    -- This setup() function is exatly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
  end)
