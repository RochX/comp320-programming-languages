# Week 8 Reflective Journal Entry

**Xavier Silva, 3-4-2024**

## Things I learned this week from the readings and/or videos:

 > This week I found myself understanding and using more complicated constructs in the Haskell language. 
 I find that I understand how to use the `let`, `in`, and `where` keywords when defining functions. 
 I also have been able to apply the `map` function along with lambda functions that are often used with `map`.
 Surprisingly, I found it easier to think about finding *all* solutions to the N queens problem in a functional context rather than just finding one.
 I think its because I couldn't think of how to implement backtracking within a functional language and instead used a method that does not involve backtracking.


## How the concepts from this week apply to:
 ### Python

 > Python has a map function, that works similarly to Haskell's map function.

## Answers/Reflections regarding additional questions posed for this week:
Pick one topic from Chapters 5 - 10 of our textbook and discuss what it would mean to add it to Jay. You don't have to add it (unless you want to!), but think/write about what it would take to do so. Some examples are listed in the Jay Follow-up document. 
 > Adding arrays would be a simple next choice to add to Jay.
 In order to do this, our state would have elements like `("arr", [x, y, z])`.
 In order to simplify things, we would force all arrays to be static arrays, so when initializing the state in Haskell, we would have an expression something like `("arr", replicate n 0)`.
 Then when accessing an element of the array, we can simply access elements using Haskell functions and see if our index is within bounds by using the `length` function.
 Additionally, adding dynamically sized arrays actually wouldn't be too hard if we had the starting framework for static arrays.
 Since Haskell natively has the `++` operator for arrays, appending new elements simply looks like `arr ++ [newElem]` in Haskell.