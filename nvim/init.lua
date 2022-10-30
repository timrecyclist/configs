--[[ 
:help runtimepath

These two paths are automatically sourced
~/.config/nvim/init.lua
~/.config/nvim/after/plugin

This path will need you to require it in ~/.config/nvim/init.lua
~/.config/nvim/lua/tim/init.lua

All the lua files you put in lua/tim/ will have to be required in tim/init.lua.
e.g. tim.options
--]]

require("tim")

