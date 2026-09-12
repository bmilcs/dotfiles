-- leader
vim.g.mapleader = " "

-- clipboard config
vim.api.nvim_set_option("clipboard", "")
vim.opt.clipboard = ""
vim.opt.mouse = "a"

-- clipboard keybinds
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "" })
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true, silent = true, desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true, desc = "" })
