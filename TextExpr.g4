/**
* Some docstring
*/
grammar TestExpr;

input:
    ( expr NL )*
    ;

expr: '(' expr ')'
    | <assoc=right> expr '^' expr
    | expr op=('+'|'-') expr
    | expr op=('*'|'/') expr
    | a=expr '=' b=expr
    | NUMBER
    | ID
    ;

NUMBER  : DIGIT+ ('.' DIGIT+)?  ;
ID      : [a-zA-Z] [a-zA-Z0-9]* ;
NL      : '\r'? '\n'            ;

fragment DIGIT: [0-9];
