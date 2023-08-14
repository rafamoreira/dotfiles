vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true -- show line numbers
vim.wo.relativenumber = true
vim.o.hlsearch = false -- disable search highlight
vim.o.mouse = "a" -- enable mouse support
vim.o.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.o.undofile = true -- enable undo file
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- ignore case when searching lowercase only
vim.wo.signcolumn = "yes" -- always show sign column

vim.o.updatetime = 250 -- faster completion
vim.o.timeout = true -- enable timeout
vim.o.timeoutlen = 300 -- faster timeout wait time

vim.o.completeopt = "menuone,noselect" -- completion options
vim.o.termguicolors = true -- enable 24-bit RGB colors

