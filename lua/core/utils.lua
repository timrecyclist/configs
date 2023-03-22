-- Utils Module
local M = {}

function M.map(mode, lhs, rhs, opts)
	-- set default options
	local options = {noremap=true, silent=true}
	if opts then
		-- if opts provided, overwrite options
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

return M
