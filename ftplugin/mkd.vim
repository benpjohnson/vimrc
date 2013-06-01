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
