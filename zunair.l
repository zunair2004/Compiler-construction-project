%option noyywrap

%{
#include "z.tab.h"
#include <iostream>
using namespace std;

int line_no = 1;
%}


ID      [a-zA-Z_][a-zA-Z0-9_]*
INT     [0-9]+
FLOAT   [0-9]+"."[0-9]+
STRING  \"([^\"\\\n]|\\.)*\"

%%

"initial"      { return INITIAL; }
"pointed"      { return POINTED; }
"alphabet"     { return ALPHABET; }
"Print"        { return PRINT; }


";"            { return SEMICOLON; }
"="            { return '='; }
"+"            { return PLUS; }
"-"            { return MINUS; }
"*"            { return MUL; }
"/"            { return DIV; }
"%"            { return MOD; }
"("            { return '('; }
")"            { return ')'; }
"{"            { return LBRACE; }
"}"            { return RBRACE; }


{FLOAT}        { return FLOAT_CONST; }
{INT}          { return FLOAT_CONST; }
{STRING}       { return STRING_CONST; }


{ID}           { return ID; }


[ \t\r]+       ;
\n             { line_no++; }


. {
    cout << "Lexical Error: '" << yytext
         << "' at line " << line_no << endl;
    exit(1);
}
%%
