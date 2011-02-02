if exists("autocommands_loaded")
    finish
endif
let autocommands_loaded = 1

autocmd BufNewFile,BufRead *.zpt,*.inc,*.php,*.phpd,*.htm,*.html setf php

" drupal Modules
augroup drupal
    autocmd BufRead,BufNewFile *.module,*.install,*.inc,*.test set filetype=php expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent smartindent
augroup END

" csv files
autocmd BufNewFile,BufRead *.csv,*.tsv setf csv

" vimorg
autocmd BufNewFile,BufRead *.org setf org
