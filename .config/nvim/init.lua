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

-- tab behavior
vim.opt.tabstop = 2      -- number of spaces that a <tab> in the file counts for
vim.opt.softtabstop = 2  -- number of spaces that a <tab> counts for while performing editing operations
vim.opt.shiftwidth = 2   -- number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- convert tabs to spaces
