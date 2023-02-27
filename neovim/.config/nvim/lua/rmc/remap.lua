vim.g.mapleader = ','
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>p', [["+p]]) -- paste from system clipboard
vim.keymap.set('n', '<leader>P', [["+P]]) -- ^ before the cursor
vim.keymap.set({'x', 'n', 'v'}, '<leader>y', [["+y]]) -- yank to sys clipboard
vim.keymap.set({'x', 'n', 'v'}, '<leader>Y', [["+Y]]) -- yank to sys clipboard


-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.keymap.set("n", "<leader>vrc", "<cmd>so ~/dotfiles/neovim/.config/nvim/init.lua<CR>");
