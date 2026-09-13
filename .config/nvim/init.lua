-- plugins
vim.pack.add({
  -- themes
  { src = "https://github.com/maxmx03/dracula.nvim" },
  -- { src = "https://github.com/catppuccin/nvim" },
  -- { src = "https://github.com/folke/tokyonight.nvim" },
  -- { src = "https://github.com/gbprod/nord.nvim" },
})

-- color scheme
vim.cmd[[colorscheme dracula]]

-- leader
vim.g.mapleader = " "

-- reload nvim
vim.keymap.set('n', '<leader>r', '<cmd>restart<CR>') 

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
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- max line width
vim.opt.textwidth = 80
vim.opt.colorcolumn = "80"

-- move current line up/down - alt + movement
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


