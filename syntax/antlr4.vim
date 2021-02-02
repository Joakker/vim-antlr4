if exists('b:current_syntax')
    finish
endif

let main_syntax = 'antlr4'


syntax keyword antlr4Keyword    locals throws catch finally mode options tokens
syntax keyword antlr4Keyword    fragment nextgroup=antlr4LexRuleName
syntax keyword antlr4Keyword    returns nextgroup=antlr4Embedded
syntax keyword antlr4Keyword    lexer parser  grammar import containedin=antlr4IdenLine

syntax keyword antlr4Function   skip channel pushState popState contained

if !exists('antlr4_embedded')
    let antlr4_embedded = 'java'
endif

execute 'syntax include @included syntax/' . antlr4_embedded . '.vim'
syntax region antlr4Embedded start="{" end="}" keepend containedin=antlr4RuleRHS contains=@included,antlr4LocalReference
syntax region antlr4Embedded    start="\[" end="\]" contains=@included keepend
syntax region antlr4String      start=/'/ end=/'/ contains=antlr4Escape
syntax region antlr4DocComment  start=/\/\*\*/ end=/\*\//
syntax region antlr4Comment     start="//" end="$" keepend
syntax region antlr4SetString   start=/\[/ end=/\]/ contained containedin=antlr4RuleRHS
            \ contains=antlr4Escape,antlr4SetStringEscape

syntax region antlr4RuleRHS     start=':' end=';' contains=antlr4ParRuleName,
            \ antlr4LexRuleName,antlr4Embedded,antlr4Operator,antlr4String,
            \ antlr4SetString,antlr4Function,antlr4Annotation
syntax region antlr4IdenLine    start='\v\zs^\ze(lexer|parser|grammar)' end=';'

syntax match antlr4Escape           /\v\\(n|t|r|u[0-9a-fA-F]{4})/ contained
syntax match antlr4SetStringEscape  /\v\\-/                 contained
syntax match antlr4Operator         /\v[+?*]/               contained
syntax match antlr4ParRuleName      /\v[a-z][a-zA-Z0-9]*/   contained
syntax match antlr4LexRuleName      /\v[A-Z][a-zA-Z0-9]*/   contained
syntax match antlr4GrammarName      /\v[[:alnum:]]+/        containedin=antlr4IdenLine
syntax match antlr4Annotation       /<.*>/                  contained
syntax match antlr4Arrow            /->/                    contained
            \ nextgroup=antlr4Function
syntax match antlr4Additional       /\v\@(members|header)/ nextgroup=antlr4Embedded
syntax match antlr4Additional       /\v\@(lexer|parser)::(members|header)/ nextgroup=antlr4Embedded
syntax match antlr4LocalReference   /\v\$[[:alpha:]][[:alnum:]]*/ containedin=ALL

syntax match antlr4ParRuleNameI     /\v^[a-z][a-zA-Z0-9]*/
syntax match antlr4LexRuleNameI     /\v^[A-Z][a-zA-Z0-9]*/

highlight link antlr4String             String
highlight link antlr4SetString          Delimiter
highlight link antlr4Escape             Special
highlight link antlr4SetStringEscape    Special
highlight link antlr4DocComment         Comment
highlight link antlr4GrammarName        Statement
highlight link antlr4Operator           Operator
highlight link antlr4ParRuleName        Type
highlight link antlr4LexRuleName        Define
highlight link antlr4ParRuleNameI       antlr4ParRuleName
highlight link antlr4LexRuleNameI       antlr4LexRuleName
highlight link antlr4Annotation         Special
highlight link antlr4Function           Function
highlight link antlr4Keyword            Keyword
highlight link antlr4Arrow              Operator
highlight link antlr4Additional         Keyword
highlight link antlr4LocalReference     Special
highlight link antlr4Comment            Comment

let b:current_syntax = 'antlr4'
