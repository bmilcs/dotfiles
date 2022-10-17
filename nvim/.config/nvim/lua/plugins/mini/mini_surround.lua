-----------------------------------------------------------
-- Mini Surround configuration file
----------------------------------------------------------

local status_surround, mini_surround = pcall(require, "mini.surround")
if not status_surround then
	return
end

-- Replace vim-surround:
mini_surround.setup({
	custom_surroundings = {
		["q"] = {
			input = { "“().-()”" },
			output = { left = "“", right = "”" },
		},
	},
	mappings = {
		add = "ys",
		delete = "ds",
		find = "",
		find_left = "",
		highlight = "",
		replace = "cs",
		update_n_lines = "",
		suffix_last = "N",
	},
	n_lines = 80,
	search_method = "cover_or_next",
})

-- Remap adding surrounding to Visual mode selection
vim.keymap.del("x", "ys")
vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })

-- Make special mapping for "add surrounding for line"
vim.keymap.set("n", "yss", "ys_", { noremap = false })
