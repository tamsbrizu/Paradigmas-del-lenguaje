equipo(rojo, [juan,jose,mario,andres]).
equipo(verde, [francisco, julian, matias, rodrigo]).
equipo(azul, [marcelo,guillermo,federico]).

federados([guillermo,mario,rodrigo,julian,juan,francisco]).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

union([],_,[]).
union([X|L1], L2, [X|L3]) :- miembro(X,L2), union(L1,L2,L3).
union([X|L1], L2, L3) :- not(miembro(X,L2)), union(L1,L2,L3). 

federados_por_equipo(E,L) :- equipo(E,J), federados(F), union(J,F,L).