set shell=/bin/sh

filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles() 

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
" large history
set history=500
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode    "show current mode down the bottom
set incsearch		" do incremental searching
set hlsearch " highlight search
" Only do case sensitive match on Upper Case
set smartcase         

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab         " Expand tabs to spaces
set smarttab          " Backspace over expandtab
set showbreak=…
set wrap linebreak nolist

nmap <leader>st :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab <CR>
nmap <leader>ht :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab <CR>

set relativenumber
set colorcolumn=90
"mapping for command key to map navigation thru display lines instead
"of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^


nmap <C-tab> <C-w><C-w>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-Down> <C-w>J
nmap <C-Up> <C-w>K
nmap <C-Left> <C-w>H
nmap <C-Right> <C-w>L
set splitright
set nosplitbelow

" make Y consistent with D and C
nmap Y y$

" make gR consistent with D, C and Y
nmap gR gr$

" NERDCommenter settings
let NERDCreateDefaultMappings=0
nmap <leader>c <plug>NERDCommenterToggle

let g:quickrun_no_default_key_mappings=1

"disable visual bell
set visualbell t_vb=
"turn off needless toolbar on gvim/mvim
set guioptions-=T

set showcmd           " Show the command you have typed in
set showmatch         " Show matching brackets or parentheses
set wildmenu          " Show possible command tab completions
set ruler             " Show useful information on the command line

colorscheme railscasts

set scrolloff=3  " screen moves when cursor goes less than 3 lines from top or bottom

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

nmap <leader>ev :tabedit $MYVIMRC<CR>
nmap <leader>f mmgg=G`m
nmap <leader>s :%s/\<<C-r><C-w>\>/
syntax on

nmap <leader>g1 :diffget1<CR>
nmap <leader>g2 :diffget2<CR>
nmap <leader>g3 :diffget3<CR>

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=1
let g:CommandTCancelMap='<C-[>'


"map to CommandT TextMate style finder
nnoremap <leader>t :CommandT<CR>

nmap <silent> <Leader>d :NERDTreeToggle<CR>

" NERDTree config 
let NERDTreeQuitOnOpen=1

" Only do this part when compiled with support for autocommands.
" o

if has("autocmd")

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source  $MYVIMRC

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 E.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif

  augroup END
else

  set autoindent " always set autoindenting on

endif " has("autocmd")


" experimental cucumber table aligment
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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

