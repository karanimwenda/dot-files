-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bp<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bd<cr>', { desc = 'Close buffer' })
