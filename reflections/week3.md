# Week 3 Reflective Journal Entry

**Xavier Silva, 1-28-2024**

## Things I learned this week from the readings and/or videos:

 > This week learned about the basics of Haskell.
  I found the way Haskell defines functions to be very intuitive, especially coming from a mathematical background.
  The pattern matching makes it easy to consider each case of what we want the function to do.
  I like this way of defining functions as we don't have to create the pattern checking with `if` statements like you would have to do in other non-functional languages.


## How the concepts from this week apply to:
 ### Java (or Python, if you prefer)

 > One concept that applies to Java is the idea of testing our functions with a dedicated class.
  By having to create a dedicated set of tests for our functions, we can easily see if the function is working as intended.
  It also allows us to make changes to functions to add additional functionality and determine whether we have broken previous uses of the function.

## Reflection on the language(s) presented this week: Haskell
> I found Haskell to be a more interesting and intuitive language than Scheme.
  I found the reading of [Learn You a Haskell](https://learnyouahaskell.com/chapters) to be very helpful for getting the basics down.
  Haskell feels like a powerful functional langauge that is easy to use.
  I still found that I had to change my mindset to coding in a functional manner, but the syntax (and mainly the large amount of parenthesis) did not get in the way of programming, unlike Scheme.

## Answers/Reflections regarding additional questions posed for this week:
One of the differences between Scheme and Haskell is whether operators such as + and == are infix or prefix. Give an advantage of each.

> The biggest advantage of prefix operators is that no parentheses are required in order to determine an order of operations.
  An advantage of infix operators is that it can be easier to read in many cases.

Pick at least one other difference between these two functional languages to discuss using the language evaluation criteria introduced in Chapter 1 (readability, writeability, etc.).

> There is a significant readability difference between Haskell and Scheme.
  In Scheme parentheses are required for every expression, and so when reading a complicated Scheme function, it is hard to determine what elements belong to which functions.
  In this regard Haskell is much easier to read.
  While Haskell still has cases where parentheses are required, this makes it easier to tell when parentheses are used for a particular purpose, such as in the case `contains x (tail lst)` where `tail lst` is the 2nd argument of the `contains` functions, rather than there being 3 arguments.

What is lazy evaluation, and what is the connection to Haskell? (And why does that make the [xkcd Very Important Handout](https://xkcd.com/1312/) even funnier?) 

> Lazy evaluation is where expressions are not evaluated until they are needed by other computations.
  Haskell uses lazy evaluation when running programs.
  The joke with the xkcd comic is funny because if no Haskell program is run, then Haskell itself isn't evaluated.
