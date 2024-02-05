# Week 4 Reflective Journal Entry

**Xavier Silva, 2-4-2024**

## Things I learned this week from the readings and/or videos:

> This week I learned about the abstract syntax and parse trees of the Jay programming language.
  I found it interesting to apply some of the theoretical concepts from automata, such as context-free grammars, and apply it to the Jay programming language.


## How the concepts from this week apply to:
 ### Java (or Python, if you prefer)

 > The concepts from this week apply to Java because the compiler for Java has to also create a syntax trees.
  It also applies because we see that Java programs have a particular syntax and semantics that our compilers recognize.


## Answers/Reflections regarding additional questions posed for this week:
What are valid lexemes for identifiers in Java, Python, the language you are researching, and/or the languages presented this week (if that was covered)?

> In Python, some examples of valid lexemes for identifiers are:
  >- `variable`
  >- `with_underscores`
  >- `including_some_numbers3`
  >- `caseSensitiveToo`

  >In addition, Python also has the built-in function `isidentifier()` which is method of all Python strings that tells us whether the string is a valid identifier.

  > In COBOL, some examples of valid lexemes for identifiers are:
  - `VAR`
  - `only-hyphens`
  - `1-number-allowed`
  - `at-the-beginning`

What is the difference between a recognizer and a generator? What is each useful for?

> A language *recognizer* takes given statements and determines whether they are in the language.
  This is useful for compiling a language because it can recognizer whether a set of statements forms a valid program.
  A language *generator* creates random statements that are within the language.
  This is useful for learning a language because it can give examples of valid statements for the language.
  We can easily recognize patterns and use them to learn programming languages.

Does a compiler recognize and address syntax, semantics, or both? What does Rice's Theorem tell us about this? How does strong (static) vs weak type checking fit in? 

> A compiler can address both syntax and semantics.
  The compiler addresses syntax through creating the abstract syntax tree and checking for correctness within that tree.
  The compiler addresses semantics through type checking, determining whether the types of variables match where they should.
  Rice's Theorem tells us that all non-trivial semantic properties of programs are undecidable.
  What this means for us is that we can never have a "perfect" compiler that checks all of our semantics for us.