function s:build_grammar() abort
    execute 'silent !java org.antlr.v4.Tool ' . expand('%')
    if v:shell_error != 0
        echohl ErrorMsg
        echo "Error!"
        echohl None
    endif
endfunction

function s:run_grammar() abort
    execute 'silent !java org.antlr4.v4.gui.TestRig'
endfunction

nnoremap <silent><buffer> <Plug>(antlr4-build)  :call <SID>build_grammar()<CR>
nnoremap <silent><buffer> <Plug>(antlr4-run)    :call <SID>run_grammar()<CR>

setl commentstring=//\ %s
