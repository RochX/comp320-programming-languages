# Week 5 Monday COMP-320
## Testing
- Black-box testing
  - Writing test cases to specification without looking at the code.
- Code Coverage
  - Make sure every piece of code is run at least once.
- Boundary Conditions (e.g. arrays, files, valid ranges)
  - Check the base case!
- Regression
  - Run all previous tests after creating new code.

## Jay Interpreter
The dissonance of writing an interpreter for a language *with* state in a functional language *without* state.

### Keeping Track of Variables
Using a list of pairs in Haskell, something like
```
  variables = [("i", Uninitialized), ("j", 3)]
```