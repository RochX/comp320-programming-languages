# Week 2 Reflective Journal Entry

**Xavier Silva, 1-21-2024**

## Things I learned this week from the readings and/or videos:

 > The main thing I learned this week was how to shift my mental thinking process to functional programming.
 I found that it was harder to figure out to write functions that I would normally write iteratively, such as a reversing a list.

 > I also began to look at some of the very basics of Haskell.
 Haskell feels more familar than Scheme does, but I can tell there is more unknown syntax with Haskell that I haven't seen yet.

## How the concepts from this week apply to:
 ### Java (or Python, if you prefer)

 > The concepts this week covers some of the basic data structures and control flows used within Java, such as the stack and queue.
These functional programming concepts also apply to Java as we could write any of the Scheme functions from this week in Java as well.

## Reflection on the language presented this week: Scheme
> Scheme as a language behaves very differently from Java and Python.
Most obviously is the amount of parentheses required within a Scheme program.
Another difference is how Scheme has no form of iteration, so no `for` loops or similar structures.
Having to think recursively for every type of function is a difficult mental shift when writing programs.
I found that I was able to understand the basic functions within Scheme, but it became more difficult when we did the functional programming exercises.

## Answers/Reflections regarding additional questions posed for this week:
Why is it useful to understand the difference between expressions and statements when learning about functional languages?

> It is useful to understand the difference between expressions and statement for functional languages because functional languages don't have state, so they cannot have statements.
The `if` statements we are normally accustomed to in other programming languages are replaced with `if` expressions in functional programming languages.


What do you think are some advantages or disadvantages to using recursion as opposed to loops? (Anyone who has already taken Computer Organization should be able to use the phrase "function overhead" in their response and explain its significance.) 

> One disadvantage to recursion is the function overhead required to manage the recursion.
The program needs to switch control flow in order to handle the new function call.
There is also function overhead because the program needs to know where to return to after finishing with one function call.
One advantage of recursion is that it makes algorithms easier to conceptualize and write. An example of this is how the Fibonacci sequence is easily defined as a recursive function ($F_n = F_{n-1} + F_{n-2}$), but defining the Fibonacci sequence iteratively is more difficult.
