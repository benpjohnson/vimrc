" tabs
noremap <C-Right> <ESC>:tabnext<CR>
noremap <C-Left> <ESC>:tabprev<CR>
noremap <Leader>to <ESC>:tabonly<CR>
" Open the current buffer in another tab
noremap <Leader>tt <ESC>:tab split<CR>

" tab next/previous
nnoremap <c-l> gt
nnoremap <c-h> gT
" new tab
map <Leader>t <ESC>:tabnew<CR>

" Open a new SQL tab 
map <Leader>ts <ESC>:tabnew +set\ filetype=sql<CR>
" Open a new PHP tab 
map <Leader>tp <ESC>:tabnew +set\ filetype=php<CR>
" Open a new PHP window
map <Leader>vp <ESC>:vert new +set\ filetype=php<CR>

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
" f6 to make
noremap <F6> :make<CR>

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

" source vimrc and local if it's about
map <Leader>sr :source $MYVIMRC \| sil! source $HOME/.vimrc.local<CR>

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
"
nmap <Leader>fp :setf php<CR>I<?php<CR><Esc>
nmap <Leader>fs :setf sql<CR>

" Create or edit the file under the cursor 
map <leader>gf :e <cfile><cr>

" Jump to tag in new vertical split
nmap <Leader>vt "zyiw:vert stjump <C-r>"<CR>
