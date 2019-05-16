
walkedge(X, Y, _) :- edge(X,Y).
walkedge(X, Y, L) :- not(member(X, L)), edge(X, Z), walkedge(Z, Y, [X|L]).

reachable :- read(R1), read(R2), findedge(R1, R2).
setedge :- read(E1), read(E2), assert(edge(E1, E2)), assert(edge(E2, E1)).

findedge(R1, R2) :- walkedge(R1, R2, []), write('Yes'), nl;
                    write('No'), nl.

for1(N) :- N > 0, N1 is N-1, setedge, for1(N1).
for1(0).
for2(Q) :- Q > 0, Q1 is Q-1, reachable, for2(Q1).
for2(0).

main :- read(W), read(N), for1(N), read(Q), for2(Q), halt.

:- initialization(main).