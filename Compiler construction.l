%{
#include <iostream>
#include <string>
using namespace std;

int line_no = 1;       
int token_count = 0;   
%}

%option noyywrap

DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*
FLOAT      [0-9]*\.[0-9]+
STRING     \"[a-zA-Z0-9]*\"

%%

"initial"              { token_count++; cout << "Keyword: initial\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"pointed"              { token_count++; cout << "Keyword: pointed\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"point var"            { token_count++; cout << "Keyword: point var\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"alphabet"             { token_count++; cout << "Keyword: alphabet\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"truse"                { token_count++; cout << "Keyword: truse\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"then"                 { token_count++; cout << "Keyword: then\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"swap"                 { token_count++; cout << "Keyword: swap\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"suit-case"            { token_count++; cout << "Keyword: suit-case\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"breakUp"              { token_count++; cout << "Keyword: breakUp\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"continued"            { token_count++; cout << "Keyword: continued\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"form"                 { token_count++; cout << "Keyword: form\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"white"                { token_count++; cout << "Keyword: white\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"structure"            { token_count++; cout << "Keyword: structure\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"uni-class"            { token_count++; cout << "Keyword: uni-class\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"@all"                 { token_count++; cout << "Keyword: @all\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"Print"                 { token_count++; cout << "Keyword: Print\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }

"+"                    { token_count++; cout << "Operator: +\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"-"                    { token_count++; cout << "Operator: -\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"*"                    { token_count++; cout << "Operator: *\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"/"                    { token_count++; cout << "Operator: /\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"%"                    { token_count++; cout << "Operator: %\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }


";"                    { token_count++; cout << "Punctuation: ;\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
","                    { token_count++; cout << "Punctuation: ,\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"{"                    { token_count++; cout << "Punctuation: {\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"}"                    { token_count++; cout << "Punctuation: }\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"["                    { token_count++; cout << "Punctuation: [\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
"]"                    { token_count++; cout << "Punctuation: ]\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }


{FLOAT}                { token_count++; cout << "Float constant: " << yytext << "\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
{STRING}               { token_count++; cout << "String: " << yytext << "\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }
{ID}                   { token_count++; cout << "Identifier: " << yytext << "\t[Line: " << line_no << ", Tokens: " << token_count << "]" << endl; }

\n                     { line_no++; }       
[ \t\r]+               ;                   
.                      ;                  

%%

int main() {
    cout << " Lexical Analyzer Started (Live Count) \n\n";
    yylex();
    cout << " Lexical analysis complete.\n";
    cout << "--------------------------------------\n";
    cout << "Final Total Tokens: " << token_count << endl;
    cout << "Final Total Lines:  " << line_no << endl;
    cout << "--------------------------------------\n";
    return 0;
}
