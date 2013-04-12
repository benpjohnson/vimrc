" FIMXE: syntax!
function! Unserialize()
    :%!php -r "var_export(unserialize(file_get_contents('php://stdin')));"
endfunction

function! Serialize()
    :%!php -r "echo serialize(file_get_contents('php://stdin'));"
endfunction
