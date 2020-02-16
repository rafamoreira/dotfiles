"Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
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
Plug 'vim-airline/vim-airline-themes'
Plug 'kchmck/vim-coffee-script'
Plug 'dracula/vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""
" Basic Configs
""""""""""""""""""""""""""""""""""""""""""
set nocompatible
syntax on
filetype indent plugin on
let mapleader=","
let os = substitute(system('uname'), "\n", "", "")
set backspace=indent,eol,start "Act as regular backspace
set encoding=utf-8

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

" source ~/codestats.vim

let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
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
set laststatus=2
set showcmd " display incomplete commands
set wildmode=longest,list " use emacs-style tab completion when selecting files, etc

"set laststatus=2 " Always display the statusline in all windows
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

"statusline setup
" set statusline=%t\   "tail of the filename
"
" "display a warning if fileformat isnt unix
" set statusline+=%#warningmsg#
" set statusline+=%{&ff!='unix'?'['.&ff.']':''}
" set statusline+=%*
"
" "display a warning if file encoding isnt utf-8
" set statusline+=%#warningmsg#
" set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
" set statusline+=%*
"
" "read only flag
" set statusline+=%#identifier#
" set statusline+=%r
" set statusline+=%*
"
" "modified flag
" set statusline+=%#warningmsg#
" set statusline+=%m
" set statusline+=%*
"
" "display a warning if &et is wrong, or we have mixed-indenting
" set statusline+=%#error#
" set statusline+=%{StatuslineTabWarning()}
" set statusline+=%*
"
" set statusline+=%#error#
" set statusline+=%{StatuslineTrailingSpaceWarning()}
" set statusline+=%*
"
" set statusline+=%{StatuslineLongLineWarning()}
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" "display a warning if &paste is set
" set statusline+=%#error#
" set statusline+=%{&paste?'[paste]':''}
" set statusline+=%*
"
" set statusline+=%=      "left/right separator
" set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
" set statusline+=%c,     "cursor column
" set statusline+=%l/%L   "cursor line/total lines
" set statusline+=\ %P    "percent through file
"
" "recalculate the trailing whitespace warning when idle, and after saving
" autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
"
" "return '[\s]' if trailing white space is detected
" "return '' otherwise
" function! StatuslineTrailingSpaceWarning()
"     if !exists("b:statusline_trailing_space_warning")
"
"         if !&modifiable
"             let b:statusline_trailing_space_warning = ''
"             return b:statusline_trailing_space_warning
"         endif
"
"         if search('\s\+$', 'nw') != 0
"             let b:statusline_trailing_space_warning = '[\s]'
"         else
"             let b:statusline_trailing_space_warning = ''
"         endif
"     endif
"     return b:statusline_trailing_space_warning
" endfunction
"
" "return the syntax highlight group under the cursor ''
" function! StatuslineCurrentHighlight()
"     if !exists('g:statusline_show_current_highlight')
"         return ''
"     endif
"
"     let name = synIDattr(synID(line('.'),col('.'),1),'name')
"     if name == ''
"         return ''
"     else
"         return '[' . name . ']'
"     endif
" endfunction
"
" "recalculate the tab warning flag when idle and after writing
" autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
"
" "return '[&et]' if &et is set wrong
" "return '[mixed-indenting]' if spaces and tabs are used to indent
" "return an empty string if everything is fine
" function! StatuslineTabWarning()
"     if !exists("b:statusline_tab_warning")
"         let b:statusline_tab_warning = ''
"
"         if !&modifiable
"             return b:statusline_tab_warning
"         endif
"
"         let tabs = search('^\t', 'nw') != 0
"
"         "find spaces that arent used as alignment in the first indent column
"         let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
"
"         if tabs && spaces
"             let b:statusline_tab_warning =  '[mixed-indenting]'
"         elseif (spaces && !&et) || (tabs && &et)
"             let b:statusline_tab_warning = '[&et]'
"         endif
"     endif
"     return b:statusline_tab_warning
" endfunction
"
" "recalculate the long line warning when idle and after saving
" autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
"
" "return a warning for "long lines" where "long" is either &textwidth or 80 (if
" "no &textwidth is set)
" "
" "return '' if no long lines
" "return '[#x,my,$z] if long lines are found, were x is the number of long
" "lines, y is the median length of the long lines and z is the length of the
" "longest line
" function! StatuslineLongLineWarning()
"     if !exists("b:statusline_long_line_warning")
"
"         if !&modifiable
"             let b:statusline_long_line_warning = ''
"             return b:statusline_long_line_warning
"         endif
"
"         let long_line_lens = s:LongLines()
"
"         if len(long_line_lens) > 0
"             let b:statusline_long_line_warning = "[" .
"                         \ '#' . len(long_line_lens) . "," .
"                         \ 'm' . s:Median(long_line_lens) . "," .
"                         \ '$' . max(long_line_lens) . "]"
"         else
"             let b:statusline_long_line_warning = ""
"         endif
"     endif
"     return b:statusline_long_line_warning
" endfunction
"
" "return a list containing the lengths of the long lines in this buffer
" function! s:LongLines()
"     let threshold = (&tw ? &tw : 80)
"     let spaces = repeat(" ", &ts)
"     let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
"     return filter(line_lens, 'v:val > threshold')
" endfunction
"
" "find the median of the given array of numbers
" function! s:Median(nums)
"     let nums = sort(a:nums)
"     let l = len(nums)
"
"     if l % 2 == 1
"         let i = (l-1) / 2
"         return nums[i]
"     else
"         return (nums[l/2] + nums[(l/2)-1]) / 2
"     endif
" endfunction

""""""""""""""""""""""""""""""""""""""""""
" Shortcuts to avoid capital W and Q
""""""""""""""""""""""""""""""""""""""""""""
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! W  write

" System dependant
" if os == "Linux"
"   set shell=/usr/bin/zsh
" else
"   set shell=/usr/local/bin/zsh " This makes RVM work inside Vim. I have no idea why.
" endif

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
set guifont=DejaVu\ Sans\ Mono\ 14

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
  autocmd FileType cs setlocal ts=4 sts=4 sw=4 expandtab

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

" CtrlP
"######
" let g:ctrlp_custom_ignore = {
"       \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"       \ 'file': '\v\.(exe|so|dll)$',
"       \ 'link': 'some_bad_symbolic_links',
"       \ }
"
" let g:ctrlp_working_path_mode = 0

" fzf
nnoremap <leader>p :FZF<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Nerdcommenter config
let NERDSpaceDelims=1

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2



" per project vimrc
set exrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN -- COC                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:coc_global_extensions = ['coc-solargraph', 'coc-json', 'coc-snippets']
"
" " if hidden is not set, TextEdit might fail.
" set hidden
"
" " Better display for messages
" set cmdheight=2
"
" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
"
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
"
" " always show signcolumns
" set signcolumn=yes
"
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" " CONFLICT WITH ENDWISE inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Create mappings for function text object, requires document symbols feature of languageserver.
"
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
"
" " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
"
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  END PLUGIN -- COC                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"

let g:user_emmet_leader_key=','

