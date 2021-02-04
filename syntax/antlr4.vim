if exists('b:current_syntax')
    finish
endif

command -nargs=* HiLink highlight link <args>

syntax match antlr4ParName      +\<[a-z][a-zA-Z0-9]*\>+
syntax match antlr4LexName      +\<[A-Z][a-zA-Z0-9]*\>+
syntax match antlr4Assign       +[a-zA-Z]\+=+

if exists('g:antlr4_highlight_punctuation')
    syntax match antlr4Punctuation     +[\-():;]+
endif

syntax match antlr4Repeat       +[+*]+
syntax match antlr4Condition    +?+
syntax match antlr4Option       +|+
syntax match antlr4Escape       +\\[nrvt]+ contained

syntax keyword antlr4Keyword grammar
syntax keyword antlr4Keyword lexer parser options header
syntax keyword antlr4Keyword fragment

syntax keyword antlr4Import import

syntax region antlr4Set     start=+\[+  end=+\]+
syntax region antlr4Attr    start="<"   end=">"
syntax region antlr4String  start=+'+   end=+'+ contains=antlr4Escape

syntax region antlr4Comment start=+/\*+ end=+\*/+
syntax region antlr4Comment start=+//+  end=+$+

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

delcommand HiLink

let b:current_syntax = 'antlr4'
