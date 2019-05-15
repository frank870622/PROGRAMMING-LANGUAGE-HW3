

relation(R1, R2) :- parent(R1, R2).
setrelation :- read(R1), read(R2), assert(parent(R1, R2)).

for1(N) :- N > 0, N1 is N-1, setrelation, for1(N1).
for1(0).
for2(Q) :- Q > 0, Q1 is Q-1, lca, for2(Q1).
for2(0).

lca :- read(L1), read(L2), ancestor(L1, L2).

ancestor(L1, L2) :- L1 =:= L2, write(L1), nl.
ancestor(L1, L2) :- parent(L1, L2), write(L1), nl.
ancestor(L1, L2) :- L1 =\= L2, not(parent(L1, L2)), relation(X, L1), ancestor(X, L2). 


main :- read(N), for1(N-1) , read(Q), for2(Q), halt.

:- initialization(main).