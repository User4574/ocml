%{
#include <stdio.h>
#include <stdlib.h>

extern char* yytext;
%}

%token tSkip tChain tSlip tSingle tHalfDouble tDouble tTriple tStartBlock tEndBlock tNum tErr
%%

 start: start input
      | input
      ;

 input: stitch
      | tNum stitch
      | block
      | tNum block
      ;

stitch: tSkip
      | tChain
      | tSlip
      | tSingle
      | tHalfDouble
      | tDouble
      | tTriple
      ;

 block: tStartBlock start tEndBlock
      ;

%%
int yyerror(char* s) {
  if (yytext[0]==10) printf("!!SYNTAX ERROR!! Token read was NEWLINE.\n");
  else if (yytext[0]=='\0') printf("!!SYNTAX ERROR!! Unexpected end of input.\n");
  else printf("!!SYNTAX ERROR!! Token read was \"%s\".\n", yytext);
}

int main() {
  return yyparse();
}
