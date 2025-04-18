-- telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- nerdtree
vim.keymap.set("n", "<leader>ne", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle nerdtree" })

-- format code using LSP
vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, { desc = "Format code using lsp" })

-- format code using LSP
vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, { desc = "Format code using lsp" })

-- buffers
vim.keymap.set("n", "<leader>bo", ":BufOnly<CR>", { noremap = true, silent = true, desc = "Close other buffers" })
