"Plug
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

" basic configs
set shell=/bin/zsh

"using number with relativenumber, use relative for all lines except the current one
set number
set relativenumber
set clipboard=unnamedplus "use global clipboard

" Basic Remaps
let mapleader=","

" FZF
nnoremap <leader>p :FZF<cr>

"coc configs


