%{
// code by Edwin
#include<stdio.h>	
%}
%%
[a-z] {printf("%s Lower Case Letter\n",yytext);}
[A-Z] {printf("%s Upper Case Letter\n",yytext);}
[' '] {}
; {}
, {}
%%
int yywrap(){};
int main(){
	yylex();
	return 0;
}
