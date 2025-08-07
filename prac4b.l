%{
#include <stdio.h>
int is_compound = 0;
%}

%%

"if"|"else"|"while"|"for"|"switch"|"{"|"}" {
    is_compound = 1;
}

.|\n ;

%%

int main() {
    printf("Enter a C statement (end with Ctrl+D):\n");
    yylex();
    
    if (is_compound)
        printf("The given statement is COMPOUND.\n");
    else
        printf("The given statement is SIMPLE.\n");
    
    return 0;
}

