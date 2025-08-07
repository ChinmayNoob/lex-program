%{
#include <stdio.h>

int line = 1;
FILE *fp;
%}

%%

.*\n    { printf("%d: %s", line++, yytext); }

.       { /* ignore other characters */ }

%%

int main() {
    fp = fopen("input.txt", "r");
    if (!fp) {
        perror("File opening failed");
        return 1;
    }

    yyin = fp;
    yylex();
    fclose(fp);
    return 0;
}

