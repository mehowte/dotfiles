" ============ Bootstrap ===============
set shell=/bin/sh
set dir=/tmp
set backupdir=/tmp

filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles() 

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

" sweet movement between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-w><C-j> <C-w>J
nnoremap <C-w><C-k> <C-w>K
nnoremap <C-w><C-h> <C-w>H
nnoremap <C-w><C-l> <C-w>L

set splitright         " move window right to current one on :vsplit
set nosplitbelow       " move window above current one on :split

" neocomplcache settings
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_snippets_dir = '$HOME/.vim/snippets'
imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
inoremap <expr><c-e>     neocomplcache#complete_common_string()


" NERDCommenter settings
let NERDCreateDefaultMappings=0
nnoremap <leader>c <plug>NERDCommenterToggle

let g:quickrun_no_default_key_mappings=1

set visualbell t_vb=  " disable visual bell
set guioptions-=T     " turn off needless toolbar on gvim/mvim

set showcmd           " Show the command you have typed in
set showmatch         " Show matching brackets or parentheses
set wildmenu          " Show possible command tab completions
set ruler             " Show useful information on the command line

colorscheme railscasts

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

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1
let g:CommandTCancelMap='<C-[>'


"map to CommandT TextMate style finder
nnoremap <leader>t :CommandT<CR>

nnoremap <silent> <Leader>d :NERDTreeToggle<CR>

" NERDTree config 
let NERDTreeQuitOnOpen=1

if has("autocmd")
  augroup vimrcEx
    autocmd!

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
