# Prolog Problem Set
## Exercise 3
Write a Prolog description of your family tree (based only on facts), going back to your grandparents and including all descendants. Be sure to include all relationships.
```
% grandparents
% note: I don't know my grandparents on my father's side
male(William).
female(Linda).

% parents
female(Maria).
male(Frank).

% aunts/uncles
female(Annette).
male(Bill).

% cousins
male(Matthew).
male(Jacob).
male(Luke).
female(Linda-Marie).

% self
male(Xavier).

% parental facts
mother(Linda, Maria).
mother(Linda, Annette).
mother(Linda, Bill).
father(William, Maria).
father(William, Annette).
father(William, Bill).
mother(Maria, Xavier).
father(Frank, Xavier).
mother(Annette, Matthew).
mother(Annette, Jacob).
mother(Annette, Luke).
mother(Annette, Linda-Marie).

% aunt/uncle facts
aunt(Maria, Matthew).
aunt(Maria, Jacob).
aunt(Maria, Luke).
aunt(Maria, Linda-Marie).
uncle(Frank, Matthew).
uncle(Frank, Jacob).
uncle(Frank, Luke).
uncle(Frank, Linda-Marie).
uncle(Bill, Matthew).
uncle(Bill, Jacob).
uncle(Bill, Luke).
uncle(Bill, Linda-Marie).
aunt(Annette, Xavier).
uncle(Bill, Xavier).

% niece/nephew facts
nephew(Matthew, Maria).
nephew(Jacob, Maria).
nephew(Luke, Maria).
niece(Linda-Marie, Maria).
nephew(Matthew, Frank).
nephew(Jacob, Frank).
nephew(Luke, Frank).
niece(Linda-Marie, Frank).
nephew(Matthew, Bill).
nephew(Jacob, Bill).
nephew(Luke, Bill).
niece(Linda-Marie, Bill).
nephew(Xavier, Annette).
nephew(Xavier, Bill).

% sibling facts
sibling(Maria, Annette).
sibling(Maria, Bill).
sibling(Annette, Bill).
sibling(Matthew, Jacob).
sibling(Matthew, Luke).
sibling(Matthew, Linda-Marie).
sibling(Jacob, Luke).
sibling(Jacob, Linda-Marie).
sibling(Luke, Linda-Marie).

% cousin facts
cousin(Xavier, Matthew).
cousin(Xavier, Jacob).
cousin(Xavier, Luke).
cousin(Xavier, Linda-Marie).
```

## Exercise 4
Write a set of rules for family relationships, including all relationships from grandparents through two generations. Now add these to the facts of Problem 3, and eliminate as many of the facts as you can.

```
% sexes of people in the family
male(William).
female(Linda).
female(Maria).
male(Frank).
female(Annette).
male(Bill).
male(Matthew).
male(Jacob).
male(Luke).
female(Linda-Marie).
male(Xavier).

% parental facts
mother(Linda, Maria).
mother(Linda, Annette).
mother(Linda, Bill).
father(William, Maria).
father(William, Annette).
father(William, Bill).
mother(Maria, Xavier).
father(Frank, Xavier).
mother(Annette, Matthew).
mother(Annette, Jacob).
mother(Annette, Luke).
mother(Annette, Linda-Marie).

% rules
parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

sibling(X, Y) :- parent(P, X), parent(P, Y).
sibling(X, Y) :- sibling(Y, X)
cousin(X, Y) :- parent(P, X), parent(Q, Y), sibling(P, Q).
cousin(X, Y) :- cousin(Y, X).

aunt(A, C) :- female(A), sibling(A, P), parent(P, C).
uncle(U, C) :- male(U), sibling(U, P), parent(P, C).
niece(N, Q) :- female(N), parent(P, N), sibling(P, Q).
nephew(N, Q) :- male(N), parent(P, N), sibling(P, Q).
```