" contine comments when a newline is started
set comments=sr:/*,mb:*,ex:*/
" reverse the order of elements in an array
map <Leader>ar :s/^\s*\(.*\)\s*=>\s*\(.*\)\s*,/\2 => \1,/g<CR>gv=gv:Tab /=><CR>
"  case
map <Leader>cc :s/_\([a-z]\)/\U\1/g<CR>

" Convert display format print_r array mappings [1] => ANAHSBND into actuals 
" of course var_export may be a better choice!
" '<,'>s/\[\([0-9]\+\)\] => \([a-zA-Z0-9_]\+\)/\1 => "\2"/

"Enable heavy omni completion. 
" if !exists('g:neocomplcache_omni_patterns') 
" let g:neocomplcache_omni_patterns = {} 
" endif 

" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Errors in status line
set statusline=%<%f\ %h%m%r
set statusline+=%#Error#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%-14.(%l,%c%V%)\ %P

set keywordprg=pman

" let g:syntastic_php_checkers=['php', 'phpmd']
" TEMP removed because slow on prov code
let g:syntastic_php_checkers=['php', 'phpcs']
" let g:syntastic_php_checkers=['php']
set shiftwidth=4

" Highlight embeded SQL queries
let php_sql_query=1

" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=236 guibg=#313633

match ExtraWhitespace /\s\+$/
