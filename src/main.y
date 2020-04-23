

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{''}''[' ']'',''"'INT FLOAT STR '\n'':'

%%

S:
  L '\n'{printf("VALIDO\n");}
  ;
L:
  '{' C '}' {}
  ;

C:
  '"'STR'"'':'B {}
  | C','C {}
  ;

B:
  INT {}
  |  FLOAT {}
  |  '"'STR'"' {}
  |  P {}
  |  L {}
  |
  ;

P:
  '['D']' {}
  ;
D:
  INT {}
  | P {}
  |
  ;



%%

void yyerror(char *s) {
	printf("INVALIDO/n");
}

int main() {
  yyparse();
    return 0;

}
