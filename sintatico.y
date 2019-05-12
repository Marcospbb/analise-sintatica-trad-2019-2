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
%token ESCREVA
%token OPA
%token OPM
%token STRING
%token TIPO
%token VAR

%%

programa:	bloco_var
					'{' lista_cmds '}'	{printf ("Programa sintaticamente correto!\n");}
;
bloco_var: /*empty*/
					| VAR '{' lista_decl_var '}' {;}
;
lista_decl_var: decl_var {;}
						| decl ';' lista_decl_var {;}
;
decl_var: TIPO lista_var {;}
;
lista_cmds:	cmd			{;}
		| cmd ';' lista_cmds	{;}
;
cmd:		ID '=' exp		{;}
        |   leia          {;}
        |   escreva       {;}
;
leia:   LEIA '(' lista_var ')' {;} /*Perguntar se "leia" é um token ou se eh definido na gramatica */
;
escreva: ESCREVA '(' lista_output ')' {;}
;
lista_var: 	ID 										{;}
                | ID ',' lista_var {;}
;
lista_output: 	output    							{;}
              | output ',' lista_output {;}
;
output: exp {;}
        /*| '"' STRING '"' {;} */
;
exp:
			termo 				{;}
    | exp '+' termo {;}
		| exp '-' termo {;}
;

termo:
			fator           	{;}
    | termo '*' fator 	{;}
		| termo '/' fator 	{;}
;

fator:
	NUM           	{;}
	| ID 						{;}
  | '(' exp ')'   {;}
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
	printf ("Problema com a analise sintatica!\n");
}
