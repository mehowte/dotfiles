" Bootstrap {{{
set shell=/bin/sh
set dir=/tmp
set backupdir=/tmp
let g:netrw_home='/Users/mehowte/.vim'

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
"}}}

" builtin config {{{
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set encoding=utf-8
setglobal fileencoding=utf-8

" this along with vitality.vim allows immediate change of the cursor in
" terminal
inoremap <ESC> <ESC><ESC>

" map leader to space!!!
let mapleader = " "

" paragraph formatting (gq - keystroke)
" see http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par\ -w75

" commands config {{{
set history=500       " large history
set wildmenu          " Show possible command tab completions
" }}}

" ruler config {{{
set showcmd	          " display normal mode commands
set showmode          " show current mode down the bottom
set ruler             " Show useful information on the command line
" statusline {{{
"set statusline=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" }}}
" }}}


" search config {{{
set incsearch	        " do incremental searching
set hlsearch          " highlight search
set ignorecase        " search is case insensitive
set smartcase         " only do case sensitive match on Upper Case
"clear search highlight after hitting return
nnoremap <CR> :nohlsearch<CR>
" }}}

" indentation config {{{
set tabstop=2         " How much space does a tab equals to
set softtabstop=2     " How many paces to insert/delete while using tab or delete  
set shiftwidth=2      " How many spaces to move while autoindenting, << and >>
set expandtab         " Expand tabs to spaces
set smarttab          " Backspace over expandtab
" }}}

" word wrapping config {{{
"set showbreak=…
set nowrap            " don't wrap lines 
set linebreak         " don't break words when wrapping lines 
set nolist            " don't show nonprintable characters
" }}}

set showmatch         " Show matching brackets or parentheses

" line numbers config {{{

set relativenumber    " show line numbers relative to cursor
set numberwidth=3     " thin linenumbers column
set colorcolumn=90    " display colored column to see maximum chars per line allowed

" }}}


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

" word transpositions mapped close to line transpositions from unimpaired plugin
nnoremap <silent> [w "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nnoremap <silent> ]w "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

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
set splitbelow         " move window below current one on :split

" }}}

" }}}

set visualbell t_vb=  " disable visual bell

if has("gui_running")
  set guifont=Monaco:h15
  " Don't show scroll bars in the GUI
  set guioptions-=L
  set guioptions-=r
  set guioptions-=T     " turn off needless toolbar on gvim/mvim
endif


set scrolloff=3       " screen moves when cursor goes less than 3 lines from top or bottom

" shortcut for repeating . for every line in visual mode
xnoremap . :normal .<CR>

nnoremap <leader>gi :tabedit ~/code/github/mehowte/dotfiles/vimrc<CR>:cd ~/code/github/mehowte/dotfiles<CR> " quick editing of .vimrc
nnoremap <leader>gg :topleft 100 :split Gemfile<CR> " quick editing of .vimrc
nnoremap <leader>gu :topleft 100 :split Guardfile<CR> " quick editing of .vimrc
nnoremap <leader>gr :topleft 100 :split config/routes.rb<CR> " quick editing of .vimrc
nnoremap <leader><leader> <C-^>
nnoremap <leader>v <C-W>v<C-^>
nnoremap <leader>s <C-W>s<C-^>
nnoremap <leader>aa :A<cr>
nnoremap <leader>av :AV<cr>
nnoremap <leader>as :AS<cr>
nnoremap <leader>rr :R<cr>
nnoremap <leader>rv :RV<cr>
nnoremap <leader>rs :RS<cr>
nnoremap <leader>rco :Rcontroller<cr>
nnoremap <leader>rmo :Rmodel<cr>
nnoremap <leader>rvi :Rview<cr>
nnoremap <leader>rmi :Rmigration<cr>
nnoremap <leader>= mmgg=G`m " formatting
syntax on

" }}}

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
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'sickill/vim-pasta'

" general development
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/simplefold'
Bundle 'tpope/vim-unimpaired'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-abolish'
Bundle 'Shougo/vimproc'
Bundle 'thinca/vim-quickrun'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'

" snippets
Bundle 'SirVer/ultisnips'


" ruby development
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-rails'
Bundle 'jgdavey/vim-blockle'
Bundle 'tpope/vim-endwise'


" file navigation
Bundle 'scrooloose/nerdtree' 
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'

" colorschemes
Bundle 'altercation/vim-colors-solarized'

" filetype plugins
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/indenthtml.vim'
Bundle 'nelstrom/vim-markdown-preview'

" experimental
" makes vim play nicely with iterm2/tmux
Bundle 'sjl/vitality.vim' 
Bundle 'tpope/vim-dispatch'

filetype plugin indent on

"}}}

" Plugins config {{{

" {{{ colorscheme config
colorscheme solarized
set background=dark
" }}}

"{{{ Ack config
  let g:ackprg = 'ag --nogroup --nocolor --column'
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

" UltiSnips {{{
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
" }}}

" NERDTree config  {{{ 

nnoremap <Leader>d :NERDTreeToggle<CR> 
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'

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

"Command-T config {{{
"nnoremap <leader>gv :CommandTFlush<cr>\|:CommandT app/views<CR>
"nnoremap <leader>gm :CommandTFlush<cr>\|:CommandT app/models<CR>
"nnoremap <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<CR>
"nnoremap <leader>gd :CommandTFlush<cr>\|:CommandT app/domain<CR>
"nnoremap <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<CR>
"nnoremap <leader>gs :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<CR>
"nnoremap <leader>gl :CommandTFlush<cr>\|:CommandT lib<CR>
"nnoremap <leader>gt :CommandTFlush<cr>\|:CommandT spec/<CR>
"nnoremap <leader>gf :CommandTFlush<cr>\|:CommandT features/<CR>
"nnoremap <leader>f :CommandTFlush<cr>\|:CommandT<CR>

"let g:CommandTMaxHeight=10
"let g:CommandTMatchWindowReverse=1
"let g:CommandTCancelMap='<C-[>'
" }}}

"CtrlP config {{{
nnoremap <leader>gv :CtrlP app/views<CR>
nnoremap <leader>gm :CtrlP app/models<CR>
nnoremap <leader>gc :CtrlP app/controllers<CR>
nnoremap <leader>gd :CtrlP app/domain<CR>
nnoremap <leader>gj :CtrlP app/assets/javascripts<CR>
nnoremap <leader>gs :CtrlP app/assets/stylesheets<CR>
nnoremap <leader>gl :CtrlP lib<CR>
nnoremap <leader>gt :CtrlP spec/<CR>
nnoremap <leader>gf :CtrlP features/<CR>
nnoremap <leader>f  :CtrlP<CR>

let g:ctrlp_dotfiles = 0
" }}}

" {{{ Tabularize config
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

" }}}

" {{{ simplefold config

nnoremap <silent> <Leader>z <Plug>SimpleFold_Foldsearch

" }}}

" }}}

" Autocommands {{{
if has("autocmd")
  augroup vimrcEx
    autocmd!

    autocmd FileType,BufWrite vim setlocal foldmethod=marker
    autocmd FileType,BufWrite vim setlocal foldenable

    " Source the vimrc file after saving it
    autocmd bufwritepost ~/code/github/mehowte/dotfiles/vimrc source $MYVIMRC

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
" }}}

