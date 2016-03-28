set nocompatible " Vim only
filetype off

" Install Vundle by hand:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'elmcast/elm-vim'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ngmy/vim-rubocop'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-endwise'
Plugin 'vim-utils/vim-ruby-fold'

call vundle#end()

syntax enable
set background=dark
set t_Co=256
" Molokai settings
let g:rehash256=1

colorscheme molokai

" spaces per tab
set tabstop=2
set softtabstop=2

" tabs are spaces
set expandtab

set relativenumber " show line numbers
set number " show absolute line number of the current line
set colorcolumn=99 " highlight column 99
set showcmd " show command while typing
set cursorline " highlight current line
filetype indent on
filetype plugin indent on " filetype specific indent files
set autoindent " indent where last line was
set wildmenu " visual autocomplete for files
set lazyredraw " minimum redraws
set showmatch " match brackets
set backspace=eol,indent,start " make backspace work normally

" searching
set incsearch " search as you type
set hlsearch " highlight search results
set ignorecase
set smartcase " be smart about search for case

"folding
set foldmethod=syntax " fold by default

"set foldenable "enable
"set foldlevelstart=10 " open most folds by default
"set foldnestmax=5 " 10 nested fold max
"set foldmethod=indent " fold on indented text

" move with ctrl+h/j/k/l
map <C-J> <C-W>j<C-W> 
map <C-K> <C-W>k<C-W> 
map <C-H> <C-W>h<C-W> 
map <C-L> <C-W>l<C-W> 

" leader commands
let mapleader=' '
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>w :bprevious<bar>bdelete #<CR>
nnoremap <leader>c :bprevious<bar>bdelete #<CR>close #<CR>
nnoremap <leader>bl :ls<CR> " buffer list
nnoremap <leader>/ :TComment<CR> " toggle comment on the current line
nnoremap <leader>i ggvG=<CR> " reformat the current file
nnoremap <leader>r :RuboCop<CR> " run RuboCop on the current file
nnoremap <leader><space> za " toggle current line fold

" Indent guides config
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd guibg=#F0F0F0
hi IndentGuidesEven ctermbg=234

nnoremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif

set lazyredraw

" Airline Configuration
let g:airline#extensions#tabline#enabled=1
set laststatus=2 " always show status line
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_theme='lucius'
