/**
* Some docstring
*/
grammar TestExpr;

input:
    ( expr NL )*
    ;

expr returns [int i]: '(' expr ')'
    | <assoc=right> expr '^' expr
    | expr op=('+'|'-') expr
    | expr op=('*'|'/') expr
    | a=expr '=' b=expr
    | NUMBER
    | { true }? ID
    ;

NUMBER  : DIGIT+ ('.' DIGIT+)?      ;
ID      : [a-zA-Z] [a-zA-Z0-9\-]*   ;
NL      : '\r'? '\n'                ;
WS      : [ \t] -> skip             ;

fragment DIGIT: [0-9];
