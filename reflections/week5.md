# Week 5 Reflective Journal Entry

**Xavier Silva, 2-12-2024**

## Things I learned this week from the readings and/or videos:

 > This week I learned about the structure of the Jay programming language.
  I am seeing how the strict limitations of Jay make it much easier to write the Jay interpreter program.
  An example of this is how all the variable declarations are first within the program, which means we only need to process the declarations at the beginning, rather than having to check whether every line is a declaration or not.
  Understanding the structure of the Jay programming language has allowed me to easily write the Jay interpreter program.


## How the concepts from this week apply to:
 ### Java (or Python, if you prefer)

 > The concepts of variable binding and state are relevant to the Java programming langauge since Java is an object-oriented language.
  Java has state, especially with the object-oriented approach, where objects have a set of values that can change over time.


## Answers/Reflections regarding additional questions posed for this week:
### Talk about Memory, Environment, Variables, and Binding in relation to the reading for this week, the languages you discuss, and the Jay Interpreter. How do they compare?

In Java, we have both static and dynamic bindings for variables.
Since each variable must have a type, we have static typing and we have dynamic bindings in other cases, such as how a child class can override functions of their parent classes.
This overriding capability causes dynamic binding to occur since the Java runtime has to decide which function to use at runtime.

In Haskell we have bindings by defining functions and using the `let` keyword.
This keyword allows us to assign a value to a variable which we can reuse within functions.
However, this does not allow us to declare global variables typically used to represent a global state (since functional languages don't have state).

In the Jay interpreter we only have static bindings since variables can only be either an `int` or a `bool` value.

In all of these examples memory is handled by a garbage collector of some kind (since the Jay Interpreter written in Haskell, it uses Haskell's garbage collector).
This makes it so we as the programmer do not have to think about memory management, unlike in languages such as C and C++.