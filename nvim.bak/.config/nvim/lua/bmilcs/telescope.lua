-----------------------------------------------------------
-- Telescope configuration file
----------------------------------------------------------
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	return
end

local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	return
end

local layout_ok, actions_layout = pcall(require, "telescope.actions.layout")
if not layout_ok then
	return
end

telescope.setup({

	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},

		-- remove symbols
		entry_prefix = "  ",
		prompt_prefix = "  ",
		selection_caret = "  ",

		mappings = {
			i = {
				["<C-u>"] = false, -- clear input with C-u
				["<C-p>"] = actions.close, -- exit
				["<C-j>"] = actions.move_selection_next, -- next item
				["<C-k>"] = actions.move_selection_previous, -- previous item
				["<C-?>"] = actions.which_key, -- available keys
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist, -- add grep to quickfix
				["<C-f>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},
			n = {
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-?>"] = actions.which_key, -- see options
				["<C-w>"] = actions_layout.toggle_preview, -- toggle preview
				["<C-f>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},
		},

		file_ignore_patterns = { -- ignore these files
			"node_modules/.*",
			".git/.*",
			".next/.*",
			"dist/.*",
		},
		layout_strategy = "flex", -- display: flex;
	},
	pickers = { -- defining the options of different pickers
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		current_buffer_fuzzy_find = {
			theme = "ivy",
			previewer = false,
		},
		live_grep = {
			theme = "ivy",
		},
		lsp_references = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		diagnostics = {
			theme = "ivy",
			initial_mode = "normal",
		},
	},
	extensions = {},
})
telescope.load_extension('cder')
