

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token '{''}''[' ']'',''"'INT FLOAT STR '\n'':'

%%

S:
  L {printf("VALIDO\n");}
  ;
L:
  '{' C '}' {}
  | '{''\n' C '}' {}
  | '{''\n' C '\n''}' {}
  | '{' C '\n''}' {}
  |  '{' C '}''\n' {}
  |  '{' C '\n''}''\n' {}
  | L '\n' {}
  ;

C:
  STR':'B {}
  | C','C {}
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
  | '['']' {}
  ;
D:
  INT {}
  | P {}
  | STR {}
  | D','D {}
  ;



%%

void yyerror(char *s) {
	printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
