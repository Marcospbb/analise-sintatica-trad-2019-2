%{
#include <stdio.h>
#define YYDEBUG 1
extern int yydebug;
extern FILE *yyin;
int yyerror (char *s);
int yylex ();
%}
%token NUM
%token ID
%token LEIA
%%

input:    /* empty */
        | input line
;
line:     '\n'
        | programa '\n'  { printf ("Programa sintaticamente correto!\n"); }
;
programa:	'{' lista_cmds '}'	{;}
;
lista_cmds:	cmd			{;}
		| cmd ';' lista_cmds	{;}
;
cmd:		ID '=' exp		{;}
        | leia          {;}
;
leia:   LEIA '(' ID ')' {;} /*Perguntar se "leia" é um token ou se eh definido na gramatica */
;
exp:	NUM			    {;}
		| ID			{;}
		| exp exp '+'   {;}
;
%%
int main (int argc, char *argv[])
{
    yydebug = 1;
    if (argc == 1) {
        yyin = fopen("entrada.txt", "r");
    }
    else{
        yyin = fopen(argv[1], "r");
    }
    if(yyin == NULL) {
        printf("Arquivo invalido\n");
        return 0;
    }
	yyparse ();
}
int yyerror (char *s) /* Called by yyparse on error */
{
	printf ("Problema com a analise sintatica!\n", s);
}
