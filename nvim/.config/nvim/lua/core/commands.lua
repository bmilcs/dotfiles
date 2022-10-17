-----------------------------------------------------------
-- Command functions
-----------------------------------------------------------

local command = function(command, target)
	vim.api.nvim_create_user_command(command, target, {})
end

command("ToggleTerminal", [[:lua require("custom.toggleterm")()<cr>]]) -- custom toggleterm
