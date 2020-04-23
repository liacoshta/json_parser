
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"



%}

INT [0-9]+
FLOAT {INT}[.]{INT}
STR [a-zA-Z]+

%%

[0-9]+ { return INT;}
{FLOAT} { return FLOAT;}
{STR} { return STR;}
[,] {return ',';}
\: {return ':';}
\" {return '"';}
\[ {return '[';}
\] {return ']';}
\} { return '{';}
\{ { return '{';}
[\n] { return '\n';}
[[:space:]] ;
. {yyerror("INVALIDO\n"); }


%%

int yywrap() {
  return 1;
}
