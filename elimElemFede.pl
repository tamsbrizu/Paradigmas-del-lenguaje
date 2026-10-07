equipo(rojo, [juan,jose,mario,andres]).
equipo(verde, [francisco, julian, matias, rodrigo]).
equipo(azul, [marcelo,guillermo,federico]).

eliminar(X,Y) :- equipo(_,J), miembro(X,J), elim(X,J,Y).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

elim(X,[],[]).
elim(X,[X|Y],Z) :- !, elim(X,Y,Z).
elim(X,[Y|L1], [Y|L2]) :- elim(X,L1,L2).