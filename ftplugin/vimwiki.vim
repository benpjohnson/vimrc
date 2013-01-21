augroup vimwiki
    au! BufWritePost $HOME/kb2/** :sil Gwrite | Gcommit -m "edit" | redraw | echo "test" . " [commited]"
augroup END</wbr>
