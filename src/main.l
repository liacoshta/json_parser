
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"



%}

INT [0-9]+
FLOAT {INT}[.]{INT}
palavra [a-zA-Z]+
texto {palavra}([' ']{palavra})*
STR ["]{texto}["]

%%

[0-9]+ { return INT;}
{FLOAT} { return FLOAT;}
{STR} { return STR;}
[,] {return ',';}
\: {
	return ':';}
\" {
	return '"';}
\[ {
	return '[';}
\] {
	return ']';}
\} { 
	return '}';}
\{ { 
	return '{';}
[\n] { return '\n';}
[[:space:]] ;
. { }


%%

int yywrap() {
  return 1;
}
