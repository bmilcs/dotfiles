-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local map = function(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true,
	}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- disable keys
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL", ",", " " }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- Buffers
map("n", "<leader>qq", ":bufdo bdelete<CR>") -- kill all buffers
map("n", "<leader>qQ", ":bufdo bdelete<CR>:q<cr>") -- kill all buffers and quit

-- Clipboard
map({ "n", "v" }, "cy", '"*y')
map({ "n", "v" }, "cp", '"*p')

-- vim-unimpaired: thanks tpope
map("n", "]e", ":m .+1<CR>==") -- move line up(n)
map("v", "]e", ":m '>+1<CR>gv=gv") -- move line up(v)
map("n", "[e", ":m .-2<CR>==") -- move line down(n)
map("v", "[e", ":m '<-2<CR>gv=gv") -- move line down(v)
map("n", "]<space>", "o<esc>k") -- create empty line below
map("n", "[<space>", "O<esc>j") -- create empty line above
map("n", "]b", ":bprevious<cr>") -- prev buffer
map("n", "[b", ":bnext<cr>") -- next buffer

-- Should be default
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode
map("v", "@", ":normal @") -- apply macro on visual range
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map("n", "<Esc>", ":nohl<CR>") -- clear search highlights

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Shortcuts
map("n", "<leader>dd", ":Lexplore<CR>") -- toggle netrw
map("n", "<leader>rr", ":so %<CR>") -- Reload configuration without restart nvim
map("n", "<C-t>", ":ToggleTerminal<cr>") -- toggle terminal

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
map("n", "<C-p>", ":Telescope find_files<CR>") -- tc: find file
map("n", "ms", ":Telescope live_grep<CR>") -- tc: find text
map("n", "<leader>cd", ":Telescope cder<cr>") -- tc: change wdir
map("n", "<leader>gg", ":tab G<cr>") -- fg: open

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- core.netrw -> local keybinds
