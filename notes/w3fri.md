# Week 3 Friday COMP-320
## Different Approach to Defining Semantics
Compilers typically only check syntax.
However in strongly typed languages, `type` information *is* semantics, which the compiler can check for us.

### Operational Semantics
Describes the behavior of language constructs by showing or describing their execution on a real or simulated machine.
- Show how it would be executed at the machine level
- Show the equivalent assembly language code
- Show the equivalent Turing Machine behavior (this is really only useful for proving things about languages)
- Show how it would appear in a more familiar high-level language

### Denotational Semantics
Model programs using mathematical objects (sets, sequences, etc.) and with mathematical functions.
Define functions that map the language constructs to the mathematical constructs.
This is hard with imperative languages as you have to take into account the memory/state and changes to the memory/state.

### Algebraic Axiom Semantics
Variation on denotational semenatics that uses algebraic concepts for reasoning about a program

Describe behavior through pre-conditions and post-conditions