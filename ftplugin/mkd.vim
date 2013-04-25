" Underline the current line with dashes
nnoremap <Leader>h1 yyp<c-v>$r=
inoremap <Leader>h1 <Esc>yyp<c-v>$r=A

" Underline the current line with dashes
nnoremap <Leader>h2 yyp<c-v>$r-
inoremap <Leader>h2 <Esc>yyp<c-v>$r-A

" Ensure we are wrapping at 80
set textwidth=80
" Mark the boundary
set colorcolumn=80

" Use nicer spacing when I can!
set expandtab

function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

autocmd BufNewFile,BufRead * call TextEnableCodeSnip('sql',   '#sql',   '#end:sql', 'SpecialComment')
autocmd BufNewFile,BufRead * call TextEnableCodeSnip('json',   '#json',   '#end:json', 'SpecialComment')

" FIXME: use this to grab start/end positions when in a syntax block
"  Then we have teh l33t inline runnable code
"  Then have a think about flexable start/end blocks to have optional commands/etc. 
"  Add:
"  global filetype commands
"  file-specific filetype commands
"  reigon-specific commands
"  look for pre-existing ways to markup syntax esp vimwiki or markdown based
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
