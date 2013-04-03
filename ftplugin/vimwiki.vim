augroup vimwiki
    au! BufWritePost $HOME/kb2/** :sil Gwrite | Gcommit -m "edit" | redraw | echo <afile>" [committed]"
augroup END
