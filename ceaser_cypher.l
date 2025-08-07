%{
#include <stdio.h>
#include <ctype.h>

// Shift function
char shift(char ch, int offset) {
    if (isupper(ch))
        return 'A' + (ch - 'A' + offset) % 26;
    else if (islower(ch))
        return 'a' + (ch - 'a' + offset) % 26;
    else
        return ch;
}

int offset = 3; // Caesar cipher shift
%}

%%
[a-zA-Z]  { char encrypted = shift(yytext[0], offset); printf("%c", encrypted); }
.|\n      { printf("%s", yytext); } // Print all other characters as-is
%%

int main() {
    yylex();
    return 0;
}

