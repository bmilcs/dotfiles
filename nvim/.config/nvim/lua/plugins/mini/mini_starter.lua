-----------------------------------------------------------
-- Mini Starter configuration file
----------------------------------------------------------

local mini_starter_status, mini_starter = pcall(require, "mini.starter")
if not mini_starter_status then
	return
end

mini_starter.setup({
	content_hooks = {
		mini_starter.gen_hook.adding_bullet(""),
		mini_starter.gen_hook.aligning("center", "center"),
	},
	evaluate_single = true,
	footer = os.date(),
	header = table.concat({
		[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
		[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
		[[/ /\  /  __/ (_) \ V /| | | | | | |]],
		[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
		[[───────────────────────────────────]],
	}, "\n"),
	query_updaters = [[abcdefghiloqrstuvwxyz0123456789_-,.ABCDEFGHIJKLOQRSTUVWXYZ]],
	items = {
		{ action = "tab G", name = "F: Fugitive", section = "Git" },
		{ action = "PackerSync", name = "U: Update Plugins", section = "Plugins" },
		{ action = "enew", name = "E: New Buffer", section = "Builtin actions" },
		{ action = "qall!", name = "Q: Quit Neovim", section = "Builtin actions" },
	},
})

vim.cmd([[
  augroup MiniStarterJK
    au!
    au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
    au User MiniStarterOpened nmap <buffer> <leader>dd <Cmd>Explore<CR>
  augroup END
]])
