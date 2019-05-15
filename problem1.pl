is_prime(2).
is_prime(3).
is_prime(P) :- integer(P), P > 3, P mod 2 =\= 0, not(have_factor(P,3)).  

have_factor(N,L) :- N mod L =:= 0.
have_factor(N,L) :- L * L < N, L2 is L + 1, have_factor(N,L2).

goldbach(4,[2,2]) :- !.
goldbach(N,L) :- N mod 2 =:= 0, N > 4, goldbach(N,L,3).

goldbach(N,[P,Q],P) :- Q is N - P, is_prime(Q), !.
goldbach(N,L,P) :- P < N, next_prime(P,P1), goldbach(N,L,P1).

next_prime(P,P1) :- P1 is P + 2, is_prime(P1), !.
next_prime(P,P1) :- P2 is P + 2, next_prime(P2,P1).

main :- write('please input a even number which > 2'), nl, read(N), nl,  goldbach(N, L), write(L), halt.

:- initialization(main).
