-----------------------------------------------------------
-- Typescript configuration file
----------------------------------------------------------

local status, typescript = pcall(require, "typescript")
if not status then
	return
end

local M = {}

M.typescript_setup = function(opts)
	typescript.setup({
		disable_commands = false, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		server = opts,
	})
end

return M
