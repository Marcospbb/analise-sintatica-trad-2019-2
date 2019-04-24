%{
# include "sintatico.tab.h"
%}
word            ((if)|(else)|(else[ ]{1,}if)){1}\n
operador_arit   [+-/\*\%]\n
operador_relac	((\<\=)|(\>\=)|(\!\=)|>|<|=){1}\n
begin           (\{)\n
end             (\})\n
id              [a-zA-Z][a-zA-Z0-9]*
number          (\+|-)?([0-9]{1,})((\.)?[0-9]{1,})?\n
comment	        (\(\*)[^\*]*(([^\*\)][^\*]*\*)|\*)*\)\n
outro	          .*\n

%%
{word}            {}
{begin}           {}
{operador_arit}	  {return OPA;}
{operador_relac}  {}
{end}             {}
{id}		      {return ID;}
{number}          {return NUM;}
{comment}         {}
{outro}		      {}
%%

int yywrap() {
 return 1;
}
