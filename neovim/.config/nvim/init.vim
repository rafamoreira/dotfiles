"Plug
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    BASE                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shell=/bin/zsh

" using number with relativenumber to achieve relative line numbers except for 
" the current line
set number
set relativenumber

" use global clipboard
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 HISTORY / UNDO                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



set backup "get rid of .swp files
set backupdir=~/.config/nvim/vimswp
set directory=~/.config/nvim/vimswp
set writebackup 
set undofile " tell it to use an undo file
set undodir=~/.config/nvim/vimundo/ "set a directory to store the undo history
set undolevels=1000 
set undoreload=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   REMAPS                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



let mapleader=","
nnoremap <leader>p :FZF<cr>

