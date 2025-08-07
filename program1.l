%{
#include <stdio.h>
%}

%%
[0-9]+  { printf("Number: %s\n", yytext); }
[a-zA-Z]+ { printf("Word: %s\n", yytext); }
.       { /* ignore other characters */ }
%%

int main(void) {
    yylex();
    return 0;
}

