if exists("autocommands_loaded")
    finish
endif
let autocommands_loaded = 1

" markdown settings
augroup markdown
    autocmd BufRead,BufNewFile *.mkd setfiletype mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:> textwidth=80
augroup END

autocmd BufNewFile,BufRead *.zpt,*.inc,*.php,*.phpd,*.htm,*.html setf php

" drupal Modules
augroup drupal
    autocmd BufRead,BufNewFile *.module,*.install,*.inc,*.test set filetype=php expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent smartindent
augroup END
