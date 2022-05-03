%{
// code by edwin
#include<stdio.h>
#include<string.h>
int numberOfWords = 0;
%}

%%
([a-zA-Z0-9])* {numberOfWords++;}
; {}
, {}
"\n" {printf("The numberOfWords are: \t%d\n",numberOfWords); numberOfWords = 0;}
%%
int yywrap(void){}

int main(){
	yylex();
	return 0;
}
