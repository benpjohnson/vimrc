" Credit http://d.hatena.ne.jp/studio-m/20090717/1247815987

if !has("ruby") 
    echon "Sorry, mozrepl.vim requires ruby.  "
    finish
endif

noremap <silent> <Leader> r: <Cu> call ReloadFirefox () <CR>

function! ReloadFirefox ()
    call s:mozrepl("content.location.reload()")
endfunction

function! s:mozrepl(mozcommand)
ruby << EOF
    require 'net/telnet'
    telnet = Net:: Telnet. new ({
        "Host" => "localhost",
        "Port" => 4242
    })
    telnet.puts (VIM::evaluate("a:mozcommand"))
    telnet. close
EOF
endfunction
