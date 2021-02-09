if !exists('g:antlr4_embedded_language')
    let g:antlr4_embedded_language = 'Java'
endif

if !exists('g:antlr4_tool_options')
    let g:antlr4_tool_options = []
endif

function s:build_grammar() abort
    let l:arguments = join(g:antlr4_tool_options)
    let l:arguments .= '-Dlanguage=' . g:antlr4_embedded_language
    execute 'silent !java org.antlr.v4.Tool ' . l:arguments . ' ' . expand('%')
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
setl include=/^import/
