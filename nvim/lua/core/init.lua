local M = {}


M.setup = function()
	require("core.options")
	require("core.remap")
    require("core.autocmds")
end

return M
