" taglist
map <F2> :TlistToggle<CR>
let tlist_php_settings = 'php;c:class;f:function;d:constant'

" Lusty juggler
map <Leader>b :LustyBufferExplorer<CR>
map <Leader>j :LustyJuggler<CR>

" alignmaps
map <Leader>a= :Align =<CR>

" mru
noremap <Leader>m :MRU<CR>
let MRU_Max_Entries = 40

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
imap <C-d> <ESC>:set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i
nmap <Leader>d :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>

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
map <Leader>n <Esc>ggO<C-r>=NoteAdd()<CR>

" Experiments with MozRepl
map <silent> <Leader>rr :silent !fr -e content  -j 'location.reload()'<CR>

" ACK the word at the cursor
map <C-s>] :Ack <cword> * <CR>
map <C-s>n :cnext<CR>
map <C-s>p :cprevious<CR>
