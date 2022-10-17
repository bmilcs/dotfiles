-----------------------------------------------------------
-- Mini configuration file
----------------------------------------------------------

-- Mini pairs
local status_pair, mini_pairs = pcall(require, "mini.pairs")
if not status_pair then
	return
end

mini_pairs.setup({})

-- Mini indent
local status_indentscope, mini_indentscope = pcall(require, "mini.indentscope")
if not status_indentscope then
	return
end

mini_indentscope.setup({
	draw = { delay = 0 },
	symbol = "׃",
})

-- Mini comment
local status_comment, mini_comment = pcall(require, "mini.comment")
if not status_comment then
	return
end

mini_comment.setup({
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
	},
})

-- Mini jump
local status_jump, mini_jump = pcall(require, "mini.jump")
if not status_jump then
	return
end

mini_jump.setup({
	mappings = {
		repeat_jump = "",
	},
})

-- Mini jump2d
local status_jump2d, mini_jump2d = pcall(require, "mini.jump2d")
if not status_jump2d then
	return
end

mini_jump2d.setup({
	mappings = {
		start_jumping = "<BS>",
	},
})

require("plugins.mini.mini_base16")
require("plugins.mini.mini_starter")
require("plugins.mini.mini_surround")
require("plugins.mini.mini_cmp")
