%{
#include <iostream>
using namespace std;

extern int yylex();
extern int line_no;
void yyerror(const char *s);
%}

/* ---------- TOKENS ---------- */
%token INITIAL POINTED ALPHABET PRINT
%token ID FLOAT_CONST STRING_CONST
%token PLUS MINUS MUL DIV MOD
%token SEMICOLON
%token LBRACE RBRACE

/* ---------- PRECEDENCE ---------- */
%left PLUS MINUS
%left MUL DIV MOD

%%
program
    : statements
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
    | block
    | error SEMICOLON { yyerror("Invalid statement"); yyerrok; }
    ;

block
    : LBRACE statements RBRACE
    ;

declaration
    : INITIAL ID SEMICOLON
    | POINTED ID SEMICOLON
    | ALPHABET ID SEMICOLON
    ;

assignment
    : ID '=' expression SEMICOLON
    ;

print_stmt
    : PRINT ID SEMICOLON
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
    cout << "Syntax Error at line " << line_no << ": " << s << endl;
}

int main() {
    cout << "Syntax Analyzer Started...\n";
    yyparse();
    cout << "Syntax Analysis Completed Successfully.\n";
    return 0;
}
