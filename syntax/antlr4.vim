if exists('b:current_syntax')
    finish
endif

command -nargs=* HiLink highlight link <args>

syntax match antlr4EventId      +[a-zA-Z_][a-zA-Z0-9_]*+ contained
syntax match antlr4ParName      +\<[a-z][a-zA-Z0-9_]*\>+ containedin=antlr4RHS
syntax match antlr4LexName      +\<[A-Z][a-zA-Z0-9_]*\>+ containedin=antlr4RHS
syntax match antlr4Assign       /[a-zA-Z]\++\?=/         containedin=antlr4RHS

if exists('g:antlr4_highlight_punctuation')
    syntax match antlr4Punctuation     +[\-():;]+
endif

syntax include @included syntax/java.vim

syntax region antlr4RHS     start=+:+   end=+;+ extend

syntax region antlr4Embed   start=+{+   end=+}?\?+ contains=@included,antlr4Variable keepend
    \ containedin=antlr4RHS
syntax region antlr4Embed   start=+\[+  end=+\]+   contains=@included,antlr4Variable keepend


syntax match antlr4Repeat       +[+*]+      containedin=antlr4RHS
syntax match antlr4Condition    +?+         containedin=antlr4RHS
syntax match antlr4Option       "|"         containedin=antlr4RHS

" Use specifically containedin=javaParenT so it will be highlighted inside
" parens
syntax match antlr4Variable  contained   +\$[a-zA-Z_][a-zA-Z0-9_]*+ containedin=javaParenT

syntax match antlr4Keyword      /@\(\(parser\|lexer\)::\)\?\(header\|members\)/
syntax match antlr4Keyword      /@after/

syntax match antlr4Escape       +\\[nrvt]+
syntax match antlr4Escape       +\\u[0-9a-fA-F]\{4}+
syntax match antlr4Escape       +\\u{[0-9a-fA-F]\{4}}+
syntax match antlr4Escape       +\\p{.\{-}}+

syntax match antlr4SetEscape    +\\-+       containedin=antlr4RHS

syntax keyword antlr4Keyword grammar
syntax keyword antlr4Keyword lexer parser options
syntax keyword antlr4Keyword fragment tokens
syntax keyword antlr4Keyword returns locals throws catch finally mode options

syntax keyword antlr4Import import

syntax keyword antlr4Operation skip more popMode mode pushMode type channel
    \ containedin=antlr4RHS

syntax region antlr4Set     start=+\[+  end=+\]+ contained
    \ contains=antlr4Escape,antlr4SetEscape containedin=antlr4RHS
syntax region antlr4Attr    start="<"   end=">"
    \ containedin=antlr4RHS
syntax region antlr4String  start=+'+   end=+'+ containedin=antlr4RHS contains=antlr4Escape

syntax region antlr4Comment start=+/\*+ end=+\*/+
    \ containedin=antlr4RHS
syntax region antlr4Comment start=+//+  end=+$+
    \ containedin=antlr4RHS

syntax region antlr4Event   start=+#+   end=+$+
    \ containedin=antlr4RHS contains=antlr4EventId

HiLink antlr4Comment        Comment
HiLink antlr4Keyword        KeyWord
HiLink antlr4ParName        Type
HiLink antlr4LexName        Macro
HiLink antlr4Attr           Special
HiLink antlr4Assign         Statement
HiLink antlr4Set            Character
HiLink antlr4String         String

if exists('g:antlr4_highlight_punctuation')
    HiLink antlr4Punctuation    Operator
endif

HiLink antlr4Repeat         Repeat
HiLink antlr4Condition      Conditional
HiLink antlr4Option         Delimiter
HiLink antlr4Import         PreProc
HiLink antlr4Escape         Special
HiLink antlr4SetEscape      antlr4Escape
HiLink antlr4Operation      Function
HiLink antlr4EventId        Function
HiLink antlr4Annotation     KeyWord
HiLink antlr4Variable       Special

delcommand HiLink

let b:current_syntax = 'antlr4'
