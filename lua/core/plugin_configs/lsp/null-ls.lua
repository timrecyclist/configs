local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,

        --python
        null_ls.builtins.formatting.black.with({
          extra_args = {"--line-length=80"}
        }),
        null_ls.builtins.formatting.isort,
    },
})
