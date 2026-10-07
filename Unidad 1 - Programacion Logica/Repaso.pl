contar([],0).
contar([_|Y], R) :- contar(Y,R1), R is R1 + 1.

miembro(X, [X|_]).
miembro(X, [_|Y]) :- miembro(X,Y).

elim(X,[],[]).
elim(X,[X|Y], Z) :- !, elim(X,Y,Z).
elim(X,[Y|H],[Y|Z]) :- elim(X,H,Z).

reves([],[]).
reves([X|Y], Z) :- reves(Y,J), union(J,[X],Z).

union([],L1,L2).
union([X|L1], L2, [X|L3]) :- union(L1,L2,L3).

adya(X,Y,[X,Y|_]).
adya(X,Y,[Y,X|_]).
adya(X,Y,[_|Z]) :- adya(X,Y,Z).  