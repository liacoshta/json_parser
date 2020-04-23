

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
  A {}
  |
  ;
A:
  '"'STR'"'':' B {}
  ;
B:
  INT {}
  |  FLOAT {}
  |  '"'STR'"'{}
  |  L{}
  |  P{}
  |
  ;

P:
  '['D']' {}
  ;
D:
  INT {}
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
