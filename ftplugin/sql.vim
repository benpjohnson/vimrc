" Loads FirstModeLine()
if !exists('*FirstModeLine')
  " :Runtime emules :runtime with VIM 5.x
  Runtime plugin/let-modeline.vim
endif
if exists('*FirstModeLine')
  aug ALL
    au!
    " To not interfer with Templates loaders
    au BufNewFile * :let b:this_is_new_buffer=1
    " Modeline interpretation
    au BufEnter * :call FirstModeLine()
  aug END
endif

" FIXME: generate this on the fly
set dictionary-=$HOME/.dbtables dictionary+=$HOME/.dbtables
