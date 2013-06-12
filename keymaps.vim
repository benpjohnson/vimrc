" tabs
" use the command key in OSX
if has("mac") 
    map <D-k> <ESC>:tabnext<CR>
    map <D-j> <ESC>:tabprev<CR>
    map <D-W> <ESC>:tabclose<CR>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
" use the ctrl key in other os
else
    noremap <C-Right> <ESC>:tabnext<CR>
    noremap <C-Left> <ESC>:tabprev<CR>
    map <D-W> <ESC>:tabclose<CR>
    map <A-1> 1gt
    map <A-2> 2gt
    map <A-3> 3gt
    map <A-4> 4gt
    map <A-5> 5gt
    map <A-6> 6gt
    map <A-7> 7gt
    map <A-8> 8gt
    map <A-9> 9gt
end
" tab next/previous
nnoremap <c-l> gt
nnoremap <c-h> gT
" new tab
map <Leader>t <ESC>:tabnew<CR>

" gnome-vim specific remap copy/paste to something sensible
" use alt instead of shift as it will override c-v for some 
" stupid reason I can't recall
nmap <C-A-V> "+gp
imap <C-A-V> <ESC><C-V>i
vmap <C-A-C> "+y 

" F3 toggle paste setting
set pastetoggle=<F3>
" I have have a spelling checker it came with my pc
map <F4> :setlocal spell! spelllang=en_gb<CR>
" f5 to make
noremap <F5> :make<CR>

" edit vimrc 
map <Leader>er :exec "e " . resolve(expand($MYVIMRC))<CR>
" edit keymaps
map <Leader>ek :exec "e " . $HOME . "/.vim/keymaps.vim"<CR>  
" edit plugin settings
map <Leader>ep :exec "e " . $HOME . "/.vim/plugin-settings.vim"<CR>  
" edit Ultisnipts
map <Leader>eu :UltiSnipsEdit<CR>
" edit todo list
map <Leader>et :e ~/todo.txt<CR>
" edit local rc file
map <Leader>el :exec "e " . $HOME . "/.vimrc.local"<CR>

" source vimrc
map <Leader>sr :source $MYVIMRC<CR>

" make ',e' (in normal mode) give a prompt for opening files
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" write with sudo powers
cmap w!! %!sudo tee > /dev/null %<CR>

" friendly vert split new file
map <Leader>v :vert botright new<cr>

" insert from screen 
noremap <Leader>< :r $HOME/.screen-exchange<CR>

set showmode
" Yank current filename to the unnamed register
nmap cp :let @" = expand("%:t")<CR>
" Yank relative to the current dir
nmap ccp :let @" = expand("%:.")<CR>

" directory navigation
nmap up :cd ..<CR>:pwd<CR>

" cd to the path of the current file
map <Leader>cd :exe 'cd ' . expand ("%:p:h")<CR>

" lcd version (cd only in the local window)
map <Leader>lcd :exe 'lcd ' . expand ("%:p:h")<CR>

" quickfix shortcuts
map <c-j> :cnext<CR>
map <c-k> :cprevious<CR>

" Send inline SQL to /tmp/q
vmap <Leader>q :w! /tmp/q<CR>

" Open my cheatsheet
nmap <Leader>ec :vsp ~/kb/cheat/VimEditor<CR>

" FIXME: This should use a template or something
nmap <Leader>fp :setf php<CR>I<?php<CR><Esc>

" Create or edit the file under the cursor 
map <leader>gf :e <cfile><cr>
