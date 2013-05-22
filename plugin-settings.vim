" CtrlP
" -----
let g:ctrlp_working_path_mode = 'a'
noremap <Leader>b :CtrlPBuffer<CR>
noremap <C-b> :CtrlPBuffer<CR>
noremap <Leader>m :CtrlPMRUFiles<CR>
noremap <Leader>db :CtrlPBookmarkDir<CR>
noremap <Leader>da :CtrlPBookmarkDirAdd<CR>

" Fugitive
" --------
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gg :Ggrep 

" PHP Documenter
" --------------
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nmap <Leader>dd :call pdv#DocumentWithSnip()<CR>

" debugbydie 
" ----------
map <Leader>di :call Die()<CR>
map <Leader>dr :call RemoveDies()<CR>

" UltiSnips
" ---------
let g:UltiSnipsEditSplit="vertical"
let g:UltipsSnippetDirectories=["UltiSnips","snippets"]

" vimwiki
" -------
let g:vimwiki_list = [{'path': '~/kb2/general', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}, {'path': '~/kb2/work', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}, {'path': '~/kb2/personal', 'syntax': 'markdown', 'ext': '.md', 'index': 'home'}] 

" csv
" ---
" Fixing default highlights
hi CSVColumnEven ctermfg=188 ctermbg=234 guifg=#dcdccc guibg=#1f1f1f
hi CSVColumnOdd  ctermfg=188 ctermbg=234 guifg=#dcdccc guibg=#1f1f1f
hi CSVColumnHeaderEven ctermfg=188 ctermbg=234 guifg=#dcdccc guibg=#1f1f1f
hi CSVColumnHeaderOdd ctermfg=188 ctermbg=234 guifg=#dcdccc guibg=#1f1f1f

" Powerline
" ---------
call Pl#Theme#InsertSegment('pwd', 'after', 'fileinfo')

" Slimux
" ------
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>

" GitGutter
" ---------
" Workaround for jumpy performance on BufEnter.
let g:gitgutter_on_bufenter = 0
let g:gitgutter_all_on_focusgained = 0
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>

" taglist
" -------
map <F2> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

" Vdebug
" ------
" let g:vdebug_keymap = { "run" : "<F6>" }

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

" vdebug
" ======
" Conflicts with the php-fpm port I tend to use
" let g:vdebug_options['port'] = 9300


" FIXME: track open pane id
" FIXME: bump up/down height

fun! RunUnder()
    if !g:opened
        call OpenUnder()
    endif
    exec("!tmux send-keys -t 1 echo 'lol'\r")
endfun

fun! OpenUnder()
    let g:opened=1
    exec("sil! !tmux splitw -p 20 && tmux selectp -t 0")
endfun

fun! CloseUnder()
    let g:opened=0
    exec("sil! !tmux killp -t 1")
endfun


