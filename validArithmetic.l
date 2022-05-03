%{
	// CODE by Edwin
#include<stdio.h>
#include<string.h>
int operators_count = 0, operands_count = 0, valid = 1, top = -1, operatorsIndex = 0, operandsIndex = 0;
char operands [30] , operators [30], stack [100];
char temp;
%}
%%
"(" {
	temp = '(';
	top++;
	strcpy(stack+top,&temp);
}
"{" {
	temp = '{';
	top++;
	strcpy(stack+top,&temp);
}
"[" {
	temp = '[';
	top++;
	strcpy(stack+top,&temp);
}
")" {
	temp = '(';
	if (strcmp(stack+top,&temp)){
		valid = 0;
	} else if (operands_count > 0 && (operands_count-operators_count != 1)){
		valid = 0;
	}
	else {
		top--;
		operands_count = 1;
		operators_count = 0;
	}
}
"}" {
	temp = '{';
	if (strcmp(stack+top,&temp)){
		valid = 0;
	} else if (operands_count > 0 && (operands_count-operators_count != 1)){
		valid = 0;
	}
	else {
		top--;
		operands_count = 1;
		operators_count = 0;
	}
}
"]" {temp = '[';
	if (strcmp(stack+top,&temp)){
		valid = 0;
	} else if (operands_count > 0 && (operands_count-operators_count != 1)){
		valid = 0;
	}
	else {
		top--;
		operands_count = 1;
		operators_count = 0;
	}
}
"+"|"-"|"*"|"/" {
	operators_count++;
	strcpy(operators+operatorsIndex, yytext);
	operatorsIndex++;
}
[0-9]+|[a-zA-Z][a-zA-Z0-9]* {
	operands_count++;
	strcpy(operands+operandsIndex,yytext);
	operandsIndex++;
}
"\n" {
	if (operands_count - operators_count != 1){
		valid = 0;
	}
	return 0;
};
%%
int yywrap(){
	return 1;
}
int main(){
	int k;
	printf("Enter the arithmetic expression: \t");
	yylex();
	if (valid == 1 && top == -1){
		printf("%d\t%d\t\n",operands_count,operators_count );
		printf("Valid Expression\n");
	} else {
		printf("Invalid Expression\n");
	}
}