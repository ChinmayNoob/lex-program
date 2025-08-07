%{
#include <stdio.h>

FILE *fp;
%}

%%

"<"[^>]+">"   { printf("Tag: %s\n", yytext); }

.|\n          { /* Ignore other content */ }

%%

int main() {
    fp = fopen("sample_html.html", "r");
    if (!fp) {
        perror("Failed to open file");
        return 1;
    }

    yyin = fp;
    yylex();
    fclose(fp);

    return 0;
}

