"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'nathanaelkane/vim-indent-guides'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'valloric/youcompleteme'
endif
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'tobyS/vmustache'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'felixhummel/setcolors.vim'
Plug 'tpope/vim-eunuch'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-easy-align'
Plug 'wakatime/vim-wakatime'
"Plug 'https://gitlab.com/code-stats/code-stats-vim.git'
Plug 'vim-airline/vim-airline'
Plug 'kchmck/vim-coffee-script'
Plug 'dracula/vim'
Plug 'dyng/ctrlsf.vim'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""
" Basic Configs
""""""""""""""""""""""""""""""""""""""""""
set nocompatible
syntax on
filetype plugin indent on
let mapleader=","
let os = substitute(system('uname'), "\n", "", "")
set backspace=indent,eol,start "Act as regular backspace
set encoding=utf-8


"source ~/codestats.vim

let g:airline_powerline_fonts = 1"
"let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype', '%{CodeStatsXp()}'])

""""""""""""""""""""""""""""""""""""""""""
" first the configs which i don't know what do
""""""""""""""""""""""""""""""""""""""""""
set showmatch
set incsearch
set hlsearch
set switchbuf=useopen
set wildmenu
set showmode

""""""""""""""""""""""""""""""""""""""""""
" Now the configs which I know, or at least think I know what it's done.
""""""""""""""""""""""""""""""""""""""""""
set mouse=a "On Gvim you can use the mouse to select text, and it will go direct to visual mode
set guioptions-=L "Config which toolbal etc will appear on Gvim
set guioptions-=m "Config which toolbal etc will appear on Gvim
set guioptions-=T "Config which toolbal etc will appear on Gvim
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
set cursorline " Highlight the current line
set cmdheight=1 " 2 lines height the command lines
set showtabline=1 "always show tab line
set winwidth=81 "set the width of the panes to auto resize when get focus if is less than

set showcmd " display incomplete commands
set wildmode=longest,list " use emacs-style tab completion when selecting files, etc
set laststatus=2 " Always display the statusline in all windows
set clipboard=unnamedplus " vim uses OS clipboard
set number "show line number
set list "show invisibles
set listchars=tab:▸\ ,eol:¬
set wildignore+=*/tmp/*,*.so,*.swp,*.zip "MacOSX/Linux

set backup "I guess it's get rid of swp files
set backupdir=~/.vim/vimswp "above
set directory=~/.vim/vimswp "same
set writebackup "same as above

set undofile " tell it to use an undo file
set undodir=~/.vim/vimundo/ "set a directory to store the undo history
set undolevels=1000 "undo related
set undoreload=10000 "undo related

set viminfo+=n~/.vim/viminfo "viminfo on .vim dir

set visualbell t_vb= "stop the dings

""""""""""""""""""""""""""""""""""""""""""
" Shortcuts to avoid capital W and Q
""""""""""""""""""""""""""""""""""""""""""""
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! W  write

" System dependant
if os == "Linux"
  set shell=/usr/bin/zsh
else
  set shell=/usr/local/bin/zsh " This makes RVM work inside Vim. I have no idea why.
endif

" MISC KEY MAPS
"#############################################################################
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

""""""""""""""""""""""""""""""""""""""""""
" NERDTREE
""""""""""""""""""""""""""""""""""""""""""
map <C-t> :NERDTreeToggle<CR>


" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>

" Paste and no paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F-keys to resize the pane
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :vertical resize -5<cr>
nnoremap <F6> :resize +5<cr>
nnoremap <F7> :resize -5<cr>
" autocmd VimEnter * unmap! <F8> "There is a plugin hijacking the F8
nnoremap <F8> :vertical resize +5<cr>
"fix conEmu sending C-\ instead of C-] on pt-br keyboards
nnoremap <C-\> <C-]>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Performance enhancements, at least is what they say :|
"###################################################
set ttyfast
set lazyredraw

" REMOVE TRAILING WHITSPACES ON SAVE
"######################################################
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,eruby,vim,css,scss autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Highlight after column 100
" #########################

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""""""""
"  COLORS/VISUALS
""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
color dracula
set guifont=Source\ Code\ Pro\ SemiBold\ 9

""""""""""""""""""""""
" filetypes and indentation
""""""""""""""""""""""
set expandtab
set ts=2
set sts=2
set sw=2

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType eruby.yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab

  autocmd BufNewFile,BufRead *.rss setfiletype xml " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.arb setfiletype eruby " Treat .arb files as eruby
  autocmd BufNewFile,BufRead *.conf setfiletype nginx " Treat .conf files as nginx
endif


" YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" Ultisnips to work with YouCompleteMe
"#####################################
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" fzf
nnoremap <leader>p :FZF<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Nerdcommenter config
let NERDSpaceDelims=1

