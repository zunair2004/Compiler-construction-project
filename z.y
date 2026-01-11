%{
#include <iostream>
#include <cstdlib>
using namespace std;

extern int yylex();
void yyerror(const char *s);
%}



%token INITIAL POINTED POINT_VAR ALPHABET TRUSE THEN
%token SWAP SUITCASE BREAKUP CONTINUED FORM WHITE
%token STRUCTURE UNICLASS ALL PRINT

%token ID FLOAT_CONST STRING_CONST

%token PLUS MINUS MUL DIV MOD
%token SEMICOLON COMMA
%token LBRACE RBRACE LBRACKET RBRACKET

/* Operator precedence */
%left PLUS MINUS
%left MUL DIV MOD

%%



program
    : INITIAL block
    ;

block
    : LBRACE statements RBRACE
    ;

statements
    : statements statement
    | statement
    ;

statement
    : declaration
    | assignment
    | print_stmt
    | expression SEMICOLON
    ;

declaration
    : POINTED ID SEMICOLON
    | POINT_VAR ID SEMICOLON
    | ALPHABET ID SEMICOLON
    ;

assignment
    : ID '=' expression SEMICOLON
    ;

print_stmt
    : PRINT expression SEMICOLON
    ;

expression
    : expression PLUS expression
    | expression MINUS expression
    | expression MUL expression
    | expression DIV expression
    | expression MOD expression
    | '(' expression ')'
    | ID
    | FLOAT_CONST
    | STRING_CONST
    ;

%%



void yyerror(const char *s) {
    cout << "Syntax Error: " << s << endl;
}



int main() {
    cout << "Syntax Analyzer Started...\n";
    yyparse();
    cout << "Syntax Analysis Completed Successfully.\n";
    return 0;
}