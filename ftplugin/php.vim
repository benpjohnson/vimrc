" contine comments when a newline is started
set comments=sr:/*,mb:*,ex:*/
" reverse the order of elements in an array
map <Leader>ar :s/^\s*\(.*\)\s*=>\s*\(.*\)\s*,/\2 => \1,/g<CR>gv=gv:Tab /=><CR>
" Experimenting with Neocachecomplete + phpcomplete
NeoComplCacheEnable
<<<<<<< HEAD
NeoComplCacheCachingTags

"Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
let g:neocomplcache_omni_patterns = {} 
endif 

let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Errors in status line
set statusline=%<%f\ %h%m%r
set statusline+=%#Error#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=%-14.(%l,%c%V%)\ %P
