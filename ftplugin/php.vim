autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" contine comments when a newline is started
set comments=sr:/*,mb:*,ex:*/
" reverse the order of elements in an array
map <Leader>ar :s/^\s*\(.*\)\s*=>\s*\(.*\)\s*,/\2 => \1,/g<CR>gv=gv:Tab /=><CR>
"  case
map <Leader>cc :s/_\([a-z]\)/\U\1/g<CR>

" Experimenting with Neocachecomplete + phpcomplete
NeoComplCacheEnable
