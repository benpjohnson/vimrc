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
    map <C-Right> <ESC>:tabnext<CR>
    map <C-Left> <ESC>:tabprev<CR>
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
nmap <C-A-V> "+gP
imap <C-A-V> <ESC><C-V>i
vmap <C-A-C> "+y 

" f5 to make
map <F5> :make<CR>

" edit vimrc 
map <Leader>er :e $MYVIMRC<CR>
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

" toggle paste setting
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode
" Yank current filename to the unnamed register
nmap cp :let @" = expand("%:t")<CR>
