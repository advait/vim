" Initialize pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" General things
set number              " show line numbers
set mouse=a             " enable the mouse
set nocompatible        " explicitly get out of vi-compatible mode
set hidden              " hide buffers instead of closing them
set history=1000        " big history
set undolevels=1000     " use many mucho levels of undo

" Color scheme
if &t_Co >= 256 || has("gui_running")
   colorscheme molokai     " color scheme
endif
if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" Enable plugins based on filetype
filetype on
filetype indent on
filetype plugin on

" Editing
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode

" Tab related preferences
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Wrap related preferences
set formatoptions=l
set lbr

" Hidden characters
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" No backup or swap files!
set nobackup
set noswapfile

" Make Python syntax highlighting highlight more things
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" Kill error bells entirely
set noerrorbells
set novisualbell
set t_vb=

" Visual things
set ruler
set showmatch           " Show matching parentheses
set scrolloff=10        " scroll before reaching the edge of the page
set guifont=DejaVu\ Sans\ Mono:h12

" Things for searching
set ignorecase
set smartcase
set hlsearch
set incsearch           " Show search matches as you type

" autocomplete when opening files. behaves somewhat similarly to bash.
set wildignore=*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe
set wildmenu
set wildmode=list:longest

" j and k move visual lines instead of actual lines 
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Reload vimrc command
nmap <Leader>s :source $MYVIMRC

" Better global copying and pasting
map <C-c> "+y
map <C-v> "+p
imap <C-v> <Esc>"+pa

" make Y and S affect to the end of the line instead of the whole line
map Y y$
map S s$

" new HTML files get automatic boilerplate
au BufNewFile *.html 0r ~/.vim/templates/template.html

" Automatically change directory when opening file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
set nocp

" Plugin Mapping
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F9> :NERDTreeToggle<CR>

" no need for a separate .gvimrc
if has('gui_running')
	set lines=60    " new gvim windows are 100x60
	set columns=100

	set guioptions-=m  " hide the menu bar
	set guioptions-=T  " hide the toolbar
	set guioptions-=r  " hide the right-hand scroll bar
	set guioptions-=l  " hide the left-hand scroll bar
	" shows/hides menu bar on Ctrl-F1
	nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
endif


