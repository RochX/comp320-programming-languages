# Week 5 Reflective Journal Entry

**Xavier Silva, 2-12-2024**

## Things I learned this week from the readings and/or videos:

 > This week I learned about the structure of the Jay programming language.
  I am seeing how the strict limitations of Jay make it much easier to write the Jay interpreter program.
  An example of this is how all the variable declarations are first within the program, which means we only need to process the declarations at the beginning, rather than having to check whether every line is a declaration or not.


## How the concepts from this week apply to:
 ### Java (or Python, if you prefer)

 > The concepts of variable binding and state are relevant to the Java programming langauge since Java is an object-oriented language.
  Java has state, especially with the object-oriented approach, where objects have a set of values that can change over time.


## Answers/Reflections regarding additional questions posed for this week:
Talk about Memory, Environment, Variables, and Binding in relation to the reading for this week, the languages you discuss, and the Jay Interpreter. How do they compare?


In Java
- In Java we have both static and dynamic bindings.
  - We have static bindings by variables only having a given type.
  - But we also have dynamic bindings through function overriding of child classes being able to override functions of their parent classes.

In Haskell
- We have bindings in Haskell by using the `let` keyword. This lets us reuse values within functions.

In Jay Interpreter
- Only static bindings since we only has numeric and boolean types.