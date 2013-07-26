augroup vimwiki
    au! BufWritePost $HOME/kb2/** :sil Gwrite | Gcommit -m "edit" | echo <afile>" [committed]"
augroup END
