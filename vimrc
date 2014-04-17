" .vimrc rebuilt from scratch
set nocompatible
" fix for debian autoenabling filetype detection before pathogen gets started
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off
call pathogen#incubate()
call pathogen#helptags()

" ---------------------------------- look/feel ---------------------------------
" console support for 256 colours
set t_Co=256

" Zenburn
" -------
" make zenburn user darker colours
let g:zenburn_high_Contrast = 1
" Nicer selections
let g:zenburn_old_Visual = 1
let g:zenburn_alternate_Visual = 1
colorscheme zenburn 

" turn on auto syntax highlight
syn on
set wildmenu
set wildmode=list:longest,full
" turn bells off
set noerrorbells
set vb t_vb= " highlight current line
set cul 
set ruler
set laststatus=2

" Elimate delays switching out of insert mode
set ttimeoutlen=50
" ------------------------------- text handling --------------------------------
" convert tabs to spaces
set expandtab
" amount of whitespace to insert
set softtabstop=4
" width of a tab in spaces
set tabstop=4
set smarttab
" controls the spaces inserted when using indentation commands
set shiftwidth=4
" set cindent
" set autoindent
set notagbsearch
" show line numbers by default
set number
" repair wired terminal/vim settings
set backspace=start,eol,indent
" use incremental searching
set incsearch
" highlight whitespace at the end of a line, expect while typing at the end of 
" the line
" match ExtraWhitespace /\s\+\%#\@<!$/

" ----------------------------------- spelling ---------------------------------
 set spelllang=en_gb

" ---------------------------------- buffers -----------------------------------
set hidden

" auto close the preview onmi complete buffer after we are done with it
autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
" Start new splits on the rhs
set splitright

" Use * by default
if $TMUX == ''
	set clipboard=unnamed
endif

" --------------------------------- filetypes ----------------------------------
syntax on
filetype on
filetype plugin on
filetype indent on

" --------------------------------- filesystem ---------------------------------
" friendly menu when tabbing though file matches
set wildmenu
" stick backup files where they belong 
silent !mkdir ~/.vim_backup > /dev/null 2>&1
set backupdir=~/.vim_backup
set directory=~/.vim_backup
" Search upwards for a tags file
set tags=tags;

" ----------------------------------- paths ------------------------------------
" Search all the things
set path=**
" Don't require common file extensions
set suffixesadd=.php

" -------------------------------- key mappings --------------------------------
let mapleader = "\<Space>"
let maplocalleader = "\\"
source $HOME/.vim/keymaps.vim

" ---------------------------------- plugins -----------------------------------
" stop gap solution to somewhat isolate plugin-specific settings/key mappings
source $HOME/.vim/plugin-settings.vim

" Keep location-specific stuff isolated
if filereadable($HOME . "/.vimrc.local")
      exec 'source ~/.vimrc.local'
endif

" ---------------------------------- performance ---------------------------------
" fixes for syntax hightlight slowdown
set ttyfast
set lazyredraw
" Use the new regex engine
set re=1
" Don't hightlight the current line
set nocursorline
" Don't look back more than 256 lines
syntax sync minlines=256

" ------------------------------------ WIP -------------------------------------

" FIXME: handle selected range + optional argument (:help a:0) to override type
" FIXME: my own SQL formatter
function! Format(type)
  "FIXME: case
  "FIXME: handle selections
  if a:type == 'sql'
    exec "%!perl -MMysql::PrettyPrinter -e 'Mysql::PrettyPrinter->passthrough'"
  endif

  if a:type == 'json'
    exec "%!/usr/local/bin/python2.7 -mjson.tool"
  endif
  if a:type == 'xml'
    exec "%!xmlstarlet fo"

  endif

  " detect file format
  " look for a formatter
  " define Format call
  " json via python, sql
endfunction

function! FormatFromType()
  call Format(&filetype)
endfunction

function! GotoFileWithLineNum() 
    " filename under the cursor 
    let file_name = expand('<cfile>') 
    if !strlen(file_name) 
        echo 'NO FILE UNDER CURSOR' 
        return 
    endif 

    " look for a line number separated by a : 
    if search('\%#\f*:\zs[0-9]\+') 
        " change the 'iskeyword' option temporarily to pick up just numbers 
        let temp = &iskeyword 
        set iskeyword=48-57 
        let line_number = expand('<cword>') 
        exe 'set iskeyword=' . temp 
    endif 

    " edit the file 
    exe 'e '.file_name 

    " if there is a line number, go to it 
    if exists('line_number') 
        exe line_number 
    endif 
endfunction 

map gf :call GotoFileWithLineNum()<CR> 
map gsf :sp<CR>:call GotoFileWithLineNum()<CR>

" move to php.vim
" FIXME: make whitespace highlight global?? Can achieve this with a check
" in php.vim before defining it
function! ToggleStaticAnalysis()
	if !exists('g:staticAnalysis')
		" Clear ExtraWhitespace
		exec "silent! match ExtraWhitespace"
		let g:staticAnalysis = 1
	else
		" Redefine whitespace check
		exec "silent! match ExtraWhitespace /\s\+$/"
		unlet g:staticAnalysis
	endif

	exec "silent SyntasticToggleMode"
	exec "redraw!"
endfunction

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! PastePsr2()
    " write the contents of the buffer to a temp file
    " Run cs fixer on it
    " Other crap
    " Read it back in
    " paste
endfunction

" Attempt to fix formatting with patterns
function! PhpFormat() range
    " First part of an if
    sil execute ":s/if\s*(\s*/if ("
    " going to need some basic parsing perhaps pipe to PHP + recursive regex
    " to match brackets
endfunction

" Let me create an adhoc buffer I won't be prompted to save for queries/etc.
function! DisposibleBuffer(filetype)
    " Split & open.
    let bufname = "[Scratch " . a:filetype . "] " . strftime("%d/%m/%y %H:%M:%S")
    silent execute "tabnew" . bufname
    silent execute "set filetype=" . a:filetype

    let scratchbuffer = bufnr(bufname, 1)
    call setbufvar(scratchbuffer, "&swapfile", 0)
    call setbufvar(scratchbuffer, "&buftype", "nofile")
endfunction

" can we autocreate classes/etc?
" function! PhpClass(
"     let class = expand("<cword>")
"     silent execute "vert new " . bufname
"
"    Python << EOF
"    import sys, vim
"    new_path = vim.eval("expand('g:UltiSnipsPythonPath')")
"    sys.path.append(new_path)
"    from UltiSnips import UltiSnips_Manager
"    UltiSnips_Manager.expand()
"    EOF
"    return ""
"
" endfunction
