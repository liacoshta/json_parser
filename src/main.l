
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"



%}

INT [0-9]+
FLOAT {INT}[.]{INT}
palavra [a-zA-Z]*{INT}*
texto {palavra}([' ']{palavra})*
STR ["]{texto}["]
teste ["\n"]?
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
[\n] {}
[[:space:]] ;
. { }


%%

int yywrap() {
  return 1;
}
