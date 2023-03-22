require('luadev')

vim.keymap.set({'n', 'v'}, '<leader>ld', '<Plug>(Luadev-RunLine)', {buffer=0, noremap=true})

