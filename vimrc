" .vimrc rebuilt from scratch
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ---------------------------------- look/feel ---------------------------------
" console support for 256 colours
set t_Co=256
" make zenburn user darker colours
let g:zenburn_high_Contrast = 1
colorscheme zenburn 
