

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
  | '{''\n' C '}' {}
  | '{''\n' C '\n''}' {}
  | '{' C '\n''}' {}
  |
  ;

C:
  STR':'B {}
  | C','C {}
  | C',''\n'C {}
  ;

B:
  INT {}
  |  FLOAT {}
  |  STR {}
  |  P {}
  |  L {}
  ;

P:
  '['D']' {}
  ;
D:
  INT {}
  | P {}
  | STR {}
  | D','D {}
  | D',''\n'D {}
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
