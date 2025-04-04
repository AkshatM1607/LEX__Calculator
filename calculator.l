%{
#include "calculator.tab.h"
#include <math.h>
%}

%%

[0-9]+(\.[0-9]+)?      { yylval.fval = atof(yytext); return NUMBER; }
"sin"                  { return SIN; }
"cos"                  { return COS; }
"tan"                  { return TAN; }
"^"                    { return POW; }
[-+*/()=\n]            { return *yytext; }
[ \t]                  ;    // Ignore whitespaces
.                      { printf("Unknown character: %s\n", yytext); }

%%

int yywrap() { return 1; }
