-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<cr>", { desc = "Close buffer" })

-- Term window size
vim.keymap.set("n", "<leader>ts", "15<C-w>_", { desc = "Set window height to 15 lines" })
vim.keymap.set("n", "<leader>tv", "15<C-w>|", { desc = "Set windows width to 15 lines" })

-- Search for the next match of word under cursor, but do not move the jumplist
vim.keymap.set(
	"n",
	"*",
	[[:keepjumps normal! mi*`i<CR>]],
	{ noremap = true, silent = true, desc = "Search for next word under cursor" }
)

vim.keymap.set("n", "<leader>nh", ":nohlsearch<cr>", { desc = "Clear search higlights" })
