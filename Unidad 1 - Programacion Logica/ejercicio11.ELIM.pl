elim(_,[],[]).
elim(X,[X|Y],Z) :- !, elim(X,Y,Z).
elim(X,[Y|H],[Y|Z]) :- elim(X,H,Z).