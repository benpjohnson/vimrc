" taglist
map <F2> :TagbarToggle<CR>
let tlist_php_settings = 'php;c:class;f:function;d:constant'

" Buffers
noremap <Leader>b :Unite buffer<CR>

" mru
noremap <Leader>m :Unite file_mru<CR>

" remap vcs commands to stop them messing with surround.vim
nmap <Leader>va <Plug>VCSAdd
nmap <Leader>vn <Plug>VCSAnnotate
nmap <Leader>vc <Plug>VCSCommit
nmap <Leader>vD <Plug>VCSDelete
nmap <Leader>vd <Plug>VCSDiff
nmap <Leader>vg <Plug>VCSGotoOriginal
nmap <Leader>vG <Plug>VCSGotoOriginal!
nmap <Leader>vi <Plug>VCSInfo
nmap <Leader>vl <Plug>VCSLog
nmap <Leader>vL <Plug>VCSLock
nmap <Leader>vr <Plug>VCSReview
nmap <Leader>vs <Plug>VCSStatus
nmap <Leader>vu <Plug>VCSUpdate
nmap <Leader>vU <Plug>VCSUnlock
nmap <Leader>vv <Plug>VCSVimDiff
" only for cvs buffers: (only remaped to get rid of them)
nmap <Leader>ve <Plug>CVSEdit
nmap <Leader>vE <Plug>CVSEditors
nmap <Leader>vt <Plug>CVSUnedit
nmap <Leader>vwv <Plug>CVSWatchers
nmap <Leader>vwa <Plug>CVSWatchAdd
nmap <Leader>vwn <Plug>CVSWatchOn
nmap <Leader>vwf <Plug>CVSWatchOff
nmap <Leader>vwf <Plug>CVSWatchRemove

" git fugitive commands
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gg :Ggrep<CR>

" CommandT
map <Leader>f :CommandT<CR>

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
let g:vimwiki_list = [{'path': '~/kb2/', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}] 
