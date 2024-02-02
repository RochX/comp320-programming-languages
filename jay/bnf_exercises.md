Exercises involving Real-World BNF Grammars

1. Looking at the (incomplete) grammar for Jay:
- Find at least two Jay constructs that are not covered by this grammar.
  > Two Jay constructs not covered by this grammar are multiplication/division and AND/OR/NOT operators.
- How would you add those to the grammar?
  > Adding `expression MULTDIV expression` as follows will add multiplication and division to the grammar:
  ```
  expression  :   INT_CONSTANT
              |   primary
              |   expression MULTDIV expression
              |   expression ADDSUB expression
              |   bool_expr
              ;
  ```
  > Adding `&&` and `||` could be added by adding `%left <keyword> AND/OR/NOT` as follows to binary operations:
  ```
    /* Binary Operations (in reverse precedence) */
  %left <keyword> EQUIV
  %left <keyword> RELOP
  %left <keyword> ADDSUB
  %left <keyword> MULTDIV
  %left <keyword> OR
  %left <keyword> AND
  %left <keyword> NOT
  ```
  > In order to implement this we also have to add the following to `bool_expr`:
  ```
    bool_expr   :   NOT bool_expr
                |   bool_expr AND bool_expr
                |   bool_expr OR bool_expr
                |   expression RELOP expression
                |   expression EQUIV expression
                ;
  ```
- Find at least one language construct that this grammar supports
  that is *not* part of the basic Jay language.
  > The grammar supports having multiple `main` functions.

2. Looking at the grammar for C:
- How can you tell the associativity (order of operation) for various operators (e.g., are multiple additions grouped left-to-right or right-to-left)?  
Work through how a concrete expression would be parsed, e.g., `x + y - 32 + z`.

- Find one binary operation whose associativity is not like the others.
Does it make sense that it would be different?  Thinking back to earlier discussions about C and other languages, it should be surprising that it's even an operator (although not to us) -- why do you think it was made an operator?

  > The assignment operator `=`.
  See statement `i = j = k = 3;` as an example.

- How can you tell the precedence of various operators?
How could you use the grammar to derive the Precence and Associativity of Operators table on p. 53 of K&R if I hadn't given it to you (after the last page of the grammar)?
- How does the grammar explain what is happening in the following
common novice error:
  ```
  while ( i < 3 ) ;
  {
      printf("%d\n", i);
      i++;
  }
  ```

3. Comparing the two grammars:
- Notice the different ways the two grammars specify operator precedence (e.g., is multiplication higher precedence than addition?) and associativity (e.g., are multiple additions grouped left-to-right or right-to-left?).

4. Why is it fair to consider the Pascal diagram a formal grammar?
