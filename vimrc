" .vimrc rebuilt from scratch
set nocompatible
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ---------------------------------- look/feel ---------------------------------
" console support for 256 colours
set t_Co=256
" make zenburn user darker colours
let g:zenburn_high_Contrast = 1
colorscheme zenburn 
" turn on auto syntax highlight
syn on
set wildmenu
set wildmode=list:longest,full
" turn bells off
set noerrorbells
set vb t_vb=
" highlight current line
set cul 
set ruler
set laststatus=2

" ------------------------------- text handling -------------------------------
" convert tabs to spaces
set expandtab
" amount of whitespace to insert
set softtabstop=4
" width of a tab in spaces
set tabstop=4
set smarttab
" controls the spaces inserted when using indentation commands
set shiftwidth=4
set cindent
set autoindent
set notagbsearch
" show line numbers by default
set number
" repair wired terminal/vim settings
set backspace=start,eol,indent
" use incremental searching
set incsearch
filetype indent on

" --------------------------------- filetypes ----------------------------------
syntax on
filetype on
filetype plugin on
filetype indent on
