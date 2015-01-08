if exists("autocommands_loaded")
    finish
endif
let autocommands_loaded = 1

autocmd BufNewFile,BufRead *.zpt,*.inc,*.php,*.phpd,*.htm,*.html setf php

" drupal Modules
augroup drupal
    autocmd BufRead,BufNewFile *.module,*.install,*.inc,*.test setfiletype php expandtab tabstop=2 shiftwidth=2 softtabstop=2 autoindent smartindent
augroup END

" csv files
autocmd BufNewFile,BufRead *.csv,*.tsv setf csv

" vimorg
autocmd BufNewFile,BufRead *.org setf org

" Markdown
autocmd BufNewFile,BufRead *.mkd, *.markdown set ts=1 tw=80

" Puppet
autocmd BufNewFile,BufRead *.pp set filetype=ruby

" JSON
au! BufRead,BufNewFile *.json setfiletype json 
augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END

aug ALL
    au!
    " To not interfer with Templates loaders
    au BufNewFile * :let b:this_is_new_buffer=1
    " Modeline interpretation
    " au BufEnter * :call FirstModeLine()
aug END

" VBScript
autocmd BufNewFile,BufRead *.vbs,*.VBS set filetype=vb

" PHPUnit xml config
au BufNewFile phpunit.xml 0r ~/.vim/skeletons/phpunit.xml

" watchr file
au BufNewFile watchr.rb 0r ~/.vim/skeletons/watchr.rb

" mr configuration
au BufNewFile,BufRead .mrconfig set filetype=dosini

" ledger
au BufNewFile,BufRead *.dat set filetype=ledger

" Git
" ===
" Spell check commit messages
" BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
