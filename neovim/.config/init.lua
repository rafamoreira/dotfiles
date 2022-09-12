-- init.lua
lua require('plugins')

" vim.g.mapleader = ","
" 
" -- Load custom tree-sitter grammar for org filetype
" require('orgmode').setup_ts_grammar()
" 
" -- Tree-sitter configuration
" require'nvim-treesitter.configs'.setup {
"   -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
"   highlight = {
"     enable = true,
"     additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
"   },
"   ensure_installed = {'org'}, -- Or run :TSUpdate org
" }
" 
" require('orgmode').setup({
"   org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
"   org_default_notes_file = '~/Dropbox/org/refile.org',
" })
" 
" -- basic configs
" vim.o.termguicolors = true
" vim.o.syntax = 'on'
" -- o.errorbells = false
" -- o.smartcase = true
" -- o.showmode = false
" -- bo.swapfile = false
" -- o.backup = false
" vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
" vim.o.undofile = true
" -- o.incsearch = true
" -- o.hidden = true
" -- o.completeopt='menuone,noinsert,noselect'
" -- bo.autoindent = true
" -- bo.smartindent = true
" -- o.tabstop = 2
" -- o.softtabstop = 2
" -- o.shiftwidth = 2
" -- o.expandtab = true
" vim.wo.number = true
" -- wo.relativenumber = true
" -- wo.signcolumn = 'yes'
" -- wo.wrap = false
" 
" 
" vim.o.colorscheme = dracula_pro
" vim.g.dracula_colorterm = 0

