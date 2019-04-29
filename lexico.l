%{
  # include "sintatico.tab.h"
%}
%%
(\+|-)?([0-9]{1,})((\.)?[0-9]{1,})?			{return NUM;}
("Leia")                                    {return LEIA;}
[a-zA-Z][a-zA-Z0-9]*	                    {return ID;}
[ \t]+			                            {;}
.|\n			                            {return yytext[0];}
%%
int yywrap() {
  return 1;
}
