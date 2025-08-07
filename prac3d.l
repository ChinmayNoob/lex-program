%{
#include <stdio.h>

int single_count = 0;
int multi_count = 0;
FILE *fp;
%}

%x COMMENT

%%

"//".* {
    single_count++;
    printf("Single-line comment: %s\n", yytext);
}

"/*" {
    BEGIN(COMMENT);
    printf("Multi-line comment: %s", yytext);
    multi_count++;
}

<COMMENT>"*/" {
    printf("%s\n", yytext);
    BEGIN(INITIAL);
}

<COMMENT>.|\n {
    printf("%s", yytext);
}

.|\n { }

%%

int main() {
    fp = fopen("sample.c", "r");
    if (!fp) {
        perror("Error opening file");
        return 1;
    }

    yyin = fp;
    yylex();
    fclose(fp);

    printf("\nTotal Single-line comments: %d\n", single_count);
    printf("Total Multi-line comments : %d\n", multi_count);
    return 0;
}

