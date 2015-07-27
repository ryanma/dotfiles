set nocompatible " Vim only
syntax enable
colorscheme molokai

" spaces per tab
set tabstop=2
set softtabstop=2

" tabs are spaces
set expandtab

set number " show line numbers
set colorcolumn=99 " highlight column 99
set showcmd " show command while typing
set cursorline " highlight current line
filetype indent on
filetype plugin indent on " filetype specific indent files
set autoindent " indent where last line was
set wildmenu " visual autocomplete for files
set lazyredraw " minimum redraws
set showmatch " match brackets

" searching
set incsearch " search as you type
set hlsearch " highlight search results
set ignorecase
set smartcase " be smart about search for case

"folding
set foldenable "enable
set foldlevelstart=10 " open most folds by default
set foldnestmax=5 " 10 nested fold max
set foldmethod=indent " fold on indented text

" move by visual line
nnoremap j gj 
nnoremap k gk

" move with ctrl+h/j/k/l
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" leader commands
let mapleader=' '

nnoremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif

set lazyredraw

" Molokai settings
let g:rehash256=1

" Airline Configuration
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

execute pathogen#infect()
