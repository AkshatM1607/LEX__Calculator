%{
#include <stdio.h>
#include <math.h>
%}

%union {
    float fval;
}

%token <fval> NUMBER
%token SIN COS TAN POW

%left '+' '-'
%left '*' '/'
%right POW
%right UMINUS

%type <fval> expr

%%

input:
    | input line
    ;

line:
      expr '\n'   { printf("= %f\n", $1); }
    ;

expr:
      NUMBER              { $$ = $1; }
    | expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr       { $$ = $1 / $3; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | expr POW expr       { $$ = pow($1, $3); }
    | '(' expr ')'        { $$ = $2; }
    | SIN '(' expr ')'    { $$ = sin($3); }
    | COS '(' expr ')'    { $$ = cos($3); }
    | TAN '(' expr ')'    { $$ = tan($3); }
    ;

%%

int main() {
    printf("Enter expressions (Ctrl+C to exit):\n");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
