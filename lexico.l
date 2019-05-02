%{
  # include "sintatico.tab.h"
%}
%%
("+"|"-")                                   {return OPA;}
("*"|"/")                                   {return OPM;}
("+"|"-")?([0-9]{1,})((\.)?[0-9]{1,})?		{return NUM;}
("leia")                                    {return LEIA;}
("escreva")                                 {return ESCREVA;}
[a-zA-Z][a-zA-Z0-9]*	                    {return ID;}
\"(\\.|[^"])*\                              {return STRING;}
[ \t\n]+			                            {;}
.			                                {return yytext[0];}
%%
int yywrap() {
  return 1;
}
