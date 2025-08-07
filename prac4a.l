%{
#include <stdio.h>
#include <string.h>

int romanToDecimal(const char *roman) {
    int total = 0, i = 0;
    while (roman[i]) {
        switch (roman[i]) {
            case 'M':
                total += 1000;
                i++;
                break;
            case 'D':
                total += 500;
                i++;
                break;
            case 'C':
                if (roman[i+1] == 'M') { total += 900; i += 2; }
                else if (roman[i+1] == 'D') { total += 400; i += 2; }
                else { total += 100; i++; }
                break;
            case 'L':
                total += 50;
                i++;
                break;
            case 'X':
                if (roman[i+1] == 'C') { total += 90; i += 2; }
                else if (roman[i+1] == 'L') { total += 40; i += 2; }
                else { total += 10; i++; }
                break;
            case 'V':
                total += 5;
                i++;
                break;
            case 'I':
                if (roman[i+1] == 'X') { total += 9; i += 2; }
                else if (roman[i+1] == 'V') { total += 4; i += 2; }
                else { total += 1; i++; }
                break;
            default:
                return -1; // Invalid
        }
    }
    return total;
}
%}

%%

[MCDXLVI]+ {
    int value = romanToDecimal(yytext);
    if (value != -1)
        printf("Roman: %s => Decimal: %d\n", yytext, value);
    else
        printf("Invalid Roman numeral: %s\n", yytext);
}

.|\n ;

%%

int main() {
    printf("Enter Roman numerals (CTRL+D to stop):\n");
    yylex();
    return 0;
}

