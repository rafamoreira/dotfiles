vim.g.copilot_no_tab_map = true
-- vim.keymap.set({'i', 'n', 'v'}, '<C-j>', 'copilot#Accept("<CR>")'
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.keymap.set('n', '<leader>coe', '<cmd>Copilot enable<CR>')
vim.keymap.set('n', '<leader>cod', '<cmd>Copilot disable<CR>')
