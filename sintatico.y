%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
%}
%token NUM
%token ID
%token OPA
%%

input:  /* empty */
        | input line
;
line:   '\n'
        | programa '\n'  { printf ("Programa sintaticamente correto!\n"); }
;
programa:   '{' lista_cmds '}'	{;}
;
lista_cmds:	cmd                     {;}
            | cmd ';' lista_cmds    {;}
;
cmd:		ID '=' exp    {;}
;
exp:    NUM             {;}
        | ID            {;}
		| exp exp OPA   {;}
;
%%
int main ()
{
	yyparse ();

}
void yyerror (char *s) /* Called by yyparse on error */
{
    printf("Erro\n");
}
