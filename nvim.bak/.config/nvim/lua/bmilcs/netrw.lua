-----------------------------------------------------------
-- Netrw configuration file
----------------------------------------------------------

local g = vim.g
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local options_append = {
	netrw_keepdir = 0, --Keep the current directory and the browsing directory synced
	netrw_winsize = "17", -- 17% size
	netrw_banner = "0", -- hide banner
	netrw_localmkdir = "mkdir -p", -- change mkdir cmd
	netrw_localcopycmd = "cp -r", -- change copy command
	netrw_localrmdir = "rm -r", -- change delete command
	netrw_list_hide = [['\(^\|\s\s\)\zs\.\S\+']],
}

for k, v in pairs(options_append) do
	g[k] = v
end

autocmd("filetype", {
	pattern = "netrw",
	desc = "Better mappings for netrw",
	callback = function()
		local bind = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end

		-- Navigation
		bind("H", "u") -- preview dir
		bind("h", "-^") -- go up
		bind("l", "<CR>") -- open file or dir
		bind(".", "gh") -- toggle dotfiles
		bind("<leader>dd", ":Lexplore<CR>") -- close if open

		-- Marks
		bind("<TAB>", "mf") -- toggle mark
		bind("<S-TAB>", "mF") -- unmark
		bind("<leader><TAB>", "mu") -- unmark all

		-- Files
		bind("ff", ":!touch ") -- create file
		bind("fd", ":!mkdir -p ") -- create folder
		bind("fm", ":!mv ") -- move/rename
		bind("fc", ":!cp -r ") -- copy
		bind("D", ":!rm -r ") -- delete
		bind("f;", "mx") -- run command

    -- Override default
    bind("ms", ':Telescope live_grep<cr>')
	end,
})
