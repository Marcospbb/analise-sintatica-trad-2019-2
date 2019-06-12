%{
  # include "sintatico.tab.h"
%}
%%
([0-9]{1,})((\.)?[0-9]{1,})?		{return NUM;}
("var")                                   {return VAR;}
("=="|"!="|">="|"<="|">"|"<")             {return OPR;}
("se")                                    {return SE;}
("senao")                                 {return SENAO;}
("leia")                                  {return LEIA;}
("escreva")                               {return ESCREVA;}
("int"|"float")                           {return TIPO;}
("enquanto")                              {return ENQUANTO;}
[a-zA-Z][a-zA-Z0-9]*	                    {return ID;}
\"(\\.|[^"])*\                            {return STRING;}
[ \t\n]+			                            {;}
.			                                    {return yytext[0];}
%%
int yywrap() {
  return 1;
}
