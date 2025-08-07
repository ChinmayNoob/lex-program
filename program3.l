%{
#include <stdio.h>

int c = 0, w = 0, s = 0, l = 0;
FILE *out;
%}

%%
[a-zA-Z0-9]+   { w++; c++; }
\n             { s++; c++; l++; }
[\t ]+         { s++; c++; }
.              { c++; }
%%

int main() {
    FILE *fp = fopen("input.txt", "r");
    if (!fp) {
        perror("Error opening input file");
        return 1;
    }

    yyin = fp;
    out = fopen("output.txt", "w");
    if (!out) {
        perror("Error opening output file");
        return 1;
    }

    yylex();

    printf("Character = %d\n", c);
    printf("Word      = %d\n", w);
    printf("Space     = %d\n", s);
    printf("Line      = %d\n", l);

    fprintf(out, "Character = %d\n", c);
    fprintf(out, "Word      = %d\n", w);
    fprintf(out, "Space     = %d\n", s);
    fprintf(out, "Line      = %d\n", l);

    fclose(fp);
    fclose(out);

    return 0;
}

