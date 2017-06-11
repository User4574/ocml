%{
#include "ocml.tab.h"
extern int yylval;
%}

%%
[0-9]+    yylval = atoi(yytext); return tNum;
sk        return tSkip;
ch        return tChain;
sl        return tSlip;
sc        return tSingle;
hdc       return tHalfDouble;
dc        return tDouble;
tr        return tTriple;
\{        return tStartBlock;
\}        return tEndBlock;
[ \t\n]+  ;
.         return tErr;
