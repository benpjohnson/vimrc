" taglist
map <F2> :TagbarToggle<CR>
let tlist_php_settings = 'php;c:class;f:function;d:constant'

" Buffers
noremap <Leader>b :CtrlPBuffer<CR>

" mru
noremap <Leader>m :CtrlPMRUFiles<CR>

" git fugitive commands
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gg :Ggrep<CR>

" PHP Documenter
" imap <C-d> <ESC>:set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i
 imap <C-d> <ESC>:exe PhpDoc()<CR>i
" nmap <Leader>d :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>
nmap <Leader>d :exe PhpDoc()<CR>

" ----------------------- In Progress -------------------------
" map to check html and display error in a new window
noremap \err :1<CR>yG :20new<CR>p :setfiletype html<CR> :%!tidy -i >/dev/null<CR>
" map to tidy html
noremap \tidy :%!tidy -config ~/.vim/tidy-conf -f /dev/null<CR>
" make tidy into makeprg...compiler tidy, make
"exe 'setlocal equalprg=tidy\ -quiet\ -i\ --show-body-only\ true\ -f\ '.&errorfile 
"exe 'setlocal errorformat=line\ %l\ column\ %v\ -\ %m'

let g:do_xhtml_mappings = 'yes'
let g:html_map_leader = '`'
let g:no_html_map_override = 'yes'
let g:no_html_toolbar = 'yes'
let g:html_map_entity_leader = '~'

" Don't bind the ,x ,c keys in insert mode, it's yucky!
let g:EnhCommentifyBindInInsert = 'No'
" Don't mess up the tab key
let g:no_html_tab_mapping = 'yes'

"insert from screen 
noremap <Leader>< :r /tmp/screen-exchange<CR>

" add a basic note entry
fun! NoteAdd()
    return "* " . strftime("%Y-%m-%d") . " "
endfun
fun! EntryAdd()
    return strftime("%Y-%m-%d %H:%M:%S") . " "
endfun

map <Leader>n <Esc>ggO<C-r>=NoteAdd()<CR>
map <Leader>N <Esc>ggO<C-r>=EntryAdd()<CR>

" Experiments with MozRepl
map <silent> <Leader>rr :silent !fr -e content  -j 'location.reload()'<CR>

" ACK the word at the cursor
map <C-s>] :Ack <cword> * <CR>
map <C-s>n :cnext<CR>
map <C-s>p :cprevious<CR>

" Set some basic phpdoc values
let g:pdv_cfg_Author = "Benjamin Johnson"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""

" Use debain ack version
if filereadable($HOME . "/bin/ack")
    let s:ack = $HOME . "/bin/ack"
else
    let s:ack = "ack-grep"
endif

let g:ackprg= s:ack . " -H --nocolor --nogroup --column"    

" Syntastic_enable_signs
let g:syntastic_enable_signs=1
let g:syntastic_phpcs_disable=1

" debugbydie mappings
map <Leader>di :call Die()<CR>
map <Leader>dr :call RemoveDies()<CR>

" UltiSnips
let g:UltipsSnippetDirectories=["UltiSnips","snippets"]

" vimwiki
let g:vimwiki_list = [{'path': '~/kb2/general', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}, {'path': '~/kb2/work', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}, {'path': '~/kb2/personal', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}] 
