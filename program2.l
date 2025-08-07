%{
#include <stdio.h>

int c = 0, w = 0, s = 0,l=0;
%}

%%
[a-zA-Z0-9]+   { w++; c ++; }
[\n]           { s++; c++;l++; }             
[\t ]+         { s ++; c ++; } 
.              { c++; }                 
%%

int main() {
    yylex();
    printf("Character = %d\n", c);
    printf("Word      = %d\n", w);
    printf("Space     = %d\n", s);
    printf("Line      = %d\n",l);
    return 0;
}


































