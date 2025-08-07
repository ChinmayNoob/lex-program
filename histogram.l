%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX_WORDS 1000

char *words[MAX_WORDS];
int freq[MAX_WORDS];
int word_count = 0;


void to_lowercase(char *s) {
    for (int i = 0; s[i]; i++)
        s[i] = tolower(s[i]);
}

void insert_word(char *word) {
    to_lowercase(word);
    for (int i = 0; i < word_count; i++) {
        if (strcmp(words[i], word) == 0) {
            freq[i]++;
            return;
        }
    }
    words[word_count] = strdup(word);
    freq[word_count] = 1;
    word_count++;
}
%}

%%
[a-zA-Z]+  { insert_word(yytext); }
.|\n       { /* ignore other characters */ }
%%

int main() {
    yylex();

    printf("\nWord Histogram:\n");
    for (int i = 0; i < word_count; i++) {
        printf("%-15s : ", words[i]);
        for (int j = 0; j < freq[i]; j++)
            printf("*");
        printf(" (%d)\n", freq[i]);
        free(words[i]);
    }

    return 0;
}

