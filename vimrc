" Bootstrap {{{
set shell=/bin/sh
set dir=/tmp
set backupdir=/tmp

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
"}}}


" Bundled plugins {{{
filetype off 
set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" normal mode editing extensions
Bundle 'ReplaceWithRegister'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Lokaltog/vim-easymotion'

" general development
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/simplefold'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-unimpaired'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-abolish'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle 'ujihisa/quicklearn' 
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'

" snippets with dependencies
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/snipmate-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'mattn/zencoding-vim'


" ruby development
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-rails'
Bundle 'jgdavey/vim-blockle'
Bundle 'tpope/vim-endwise'


" file navigation
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'


" colorschemes
Bundle 'altercation/vim-colors-solarized'

" filetype plugins
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/indenthtml.vim'

"unite
Bundle 'unite.vim'
Bundle 'unite-gem'
Bundle 'unite-locate'

" vim-handlebars
" vim-markdown-preview
" vimorganizer
" gist-vim              
" tagbar              
" neocomplcache         
" jshint.vim  

filetype plugin indent on

"}}}

" statusline {{{
"set statusline=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" }}}

" delimit mate options {{{
let delimitMate_expand_space = 1
" }}}

" vim-ruby options {{{
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1
let ruby_operators = 1
" let ruby_space_errors = 1
" }}}

" coffee-script options {{{
let coffee_compile_vert = 1
" }}}

" zencoding options {{{
  let g:user_zen_leader_key = '<c-j>'
" }}}
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" paragraph formatting (gq - keystroke)
" see http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par\ -w75

" large history
set history=500
set ruler	" show the cursor position all the time
set showcmd	" display normal mode commands
set showmode  "show current mode down the bottom

set incsearch	" do incremental searching
set hlsearch " highlight search
set smartcase " Only do case sensitive match on Upper Case

" indentation options
set tabstop=2         " How much space does a tab equals to
set softtabstop=2     " How many paces to insert/delete while using tab or delete  
set shiftwidth=2      " How many spaces to move while autoindenting, << and >>
set expandtab         " Expand tabs to spaces
set smarttab          " Backspace over expandtab

set showbreak=…
set nowrap            " don't wrap lines 
set linebreak         " don't break words when wrapping lines 
set nolist            " don't show nonprintable characters

set relativenumber    " show line numbers relative to cursor
set numberwidth=3     " thin linenumbers column
set colorcolumn=90    " display colored column to see maximum chars per line allowed

" Movement options {{{
" sane movement between visible lines
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
" make Y consistent with D and C
nnoremap Y y$

" make gR consistent with D, C and Y
nmap gR gr$
" }}}

" sweet movement between splits {{{
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-w><C-j> <C-w>J
nnoremap <C-w><C-k> <C-w>K
nnoremap <C-w><C-h> <C-w>H
nnoremap <C-w><C-l> <C-w>L

set splitright         " move window right to current one on :vsplit
set splitbelow       " move window above current one on :split
" }}}

" neocomplcache settings {{{
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_snippets_dir = '$HOME/.vim/snippets'
" imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
" smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
" inoremap <expr><c-e>     neocomplcache#complete_common_string()
" }}}

" NERDCommenter settings {{{
let NERDCreateDefaultMappings=0
nmap <leader>c <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterToggle
" }}}

" quickrun settings {{{
let g:quickrun_no_default_key_mappings=1
nnoremap <leader>qr :QuickRun -mode n<CR>
vnoremap <leader>qr :QuickRun -mode v<CR>
" }}}

set visualbell t_vb=  " disable visual bell
set guioptions-=T     " turn off needless toolbar on gvim/mvim

set showcmd           " Show the command you have typed in
set showmatch         " Show matching brackets or parentheses
set wildmenu          " Show possible command tab completions
set ruler             " Show useful information on the command line

colorscheme solarized
:set guifont=Monaco:h15

set scrolloff=3       " screen moves when cursor goes less than 3 lines from top or bottom

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>f mmgg=G`m
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
syntax on

nnoremap <leader>g1 :diffget1<CR>
nnoremap <leader>g2 :diffget2<CR>
nnoremap <leader>g3 :diffget3<CR>

"Command-T configuration {{{
nnoremap <leader>t :CommandT<CR>
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowReverse=1
let g:CommandTCancelMap='<C-[>'
" }}}

" NERDTree config  {{{
nnoremap <Leader>d :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'
" }}}

" Autocommands {{{
if has("autocmd")
  augroup vimrcEx
    autocmd!

    autocmd FileType vim setlocal foldmethod=marker

    " Source the vimrc file after saving it
    autocmd bufwritepost .vimrc source  $MYVIMRC

    " set wrappring in html files
    autocmd BufNewFile,BufRead *.html* setlocal wrap

    " Enable file type detection.  Use the default filetype settings, so that
    " mail gets 'tw' set to 72, 'cindent' is on in C files, etc.  Also load
    " indent files, to automatically do language-dependent indenting.
    filetype plugin indent on


    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).  Also don't do it when the mark
    " is in the first line, that is the default position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

  augroup END
else
  set autoindent " always set autoindenting on
endif 
"}}}


function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" experimental cucumber table aligment
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" simplefold
nnoremap <silent> <Leader>z <Plug>SimpleFold_Foldsearch
