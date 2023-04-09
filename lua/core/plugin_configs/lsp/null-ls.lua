local null_ls = require("null-ls")

null_ls.setup({
    sources = {
    -- Completion
      -- Lua
      null_ls.builtins.completion.luasnip,


    -- Formatters
      --Python
        -- black
        null_ls.builtins.formatting.black.with({
          extra_args = {"--line-length=80"}
        }),
        -- pyflakes
        null_ls.builtins.formatting.autoflake,
        -- autopep8
        null_ls.builtins.formatting.autopep8,
        -- isort - sorts imports
        null_ls.builtins.formatting.isort,
        -- pyflyby - autoimport libraries
        null_ls.builtins.formatting.pyflyby,

      -- Bash
        null_ls.builtins.formatting.beautysh,


      -- JavaScript
        -- eslint_d
        null_ls.builtins.formatting.eslint_d,

      -- JSON
        -- fixjson
        null_ls.builtins.formatting.fixjson,

      -- Lua
        -- lua_format
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.stylua,

      -- SQL
        -- pg_format
        null_ls.builtins.formatting.pg_format,

      -- Prettier - looks good for web dev/markdown
      null_ls.builtins.formatting.prettierd,
    },

})
