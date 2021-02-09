/**
* Some docstring
*/
grammar TestExpr;

import Something;

@lexer::header {
package com.github.joakker;
}

input:
    ( expr NL )*
    ;

expr
@after { System.out.println("Did expression"); }
returns [int i]
    : '(' expr ')'
    | <assoc=right> expr '^' expr
    | expr op=('+'|'-') expr
    | expr op=('*'|'/') expr
    | a=expr '=' b=expr
    | NUMBER
    | { true }? ID { System.out.println($i); }         # A
    ;

NUMBER  : DIGIT+ ('.' DIGIT+)?      ;
ID      : [a-zA-Z] [a-zA-Z0-9\-]*   ;
NL      : '\r'? '\n'                ;
WS      : [ \t] -> skip             ;

fragment DIGIT: [0-9];
