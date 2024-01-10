# Week 1 Wednesday COMP-320
Answering chapter 1 exercise 2 as a class.

## Scheme
Starting on scheme

Either [replit.com](replit.com) or [try.scheme.org](try.scheme.org).

Basics of LISP: `car`, `cdr`, `cons` working on lists.
The single quote in the statement `'(1 2 3 4)` means to interpret this as a list and not a function call with the function `1`.

### Statements vs Expressions
`3 + 4` is an expression because it evaluates to something.
`i = 3;` is a statement as it changes the statement of the program.

LISP has `if` expressions but not `if` statements.
They take the following form:
`(if <condition> <then-expr> <else-expr>)`.