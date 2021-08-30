" Specify a directory for plugins
" - For Neovim:  . '/plugged'
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Basic
" set encoding=utf-8
" set backspace=indent,eol,start "Act as regular backspace
syntax on
set guicursor=
let mapleader=","
set clipboard+=unnamedplus " vim uses OS clipboard
set number "show line numbers
set list "show invisibles
set listchars=tab:▸\ ,eol:¬
set wildignore+=*/tmp/*,*.so,*.swp,*.zip "MacOSX/Linux

set backup "I guess it's get rid of swp files
set backupdir=~/.config/nvim/vimswp "above
set directory=~/.config/nvim/vimswp "same
set writebackup "same as above

set undofile " tell it to use an undo file
set undodir=~/.config/nvim/vimundo/ "set a directory to store the undo history
set undolevels=10000 "undo related
set undoreload=100000 "undo related

" Shortcuts to avoid capital W and Q
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! W  write

" ctrl+movement to move between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" VISUAL
packadd! dracula_pro
let g:dracula_colorterm = 0
colorscheme dracula_pro

let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'

" fzf
nnoremap <leader>p :FZF<cr>


" REMOVE TRAILING WHITSPACES ON SAVE
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,eruby,vim,css,scss autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
