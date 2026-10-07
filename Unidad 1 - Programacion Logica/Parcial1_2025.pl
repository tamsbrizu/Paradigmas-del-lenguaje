equipo(rojo,[juan,jose,mario,andres]).
equipo(verde,[francisco,julian,matias,rodrigo]).
equipo(azul,[marcelo,guillermo,federico]).

federados([guillermo,mario,rodrigo,julian,juan,francisco]).

consulta1(X) :- equipo(X,_).
consulta2(X,Y) :- equipo(X,J), capitan(Y,J).
consulta3(X,Y) :- equipo(X,J), federados(F), capitan(Y,J), miembro(Y,F).
consulta4(X) :- equipo(_,J), capitan(X,J).

capitan(X,[X|_]).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

federados_por_equipo(X,Y) :- equipo(X,J), federados(F), union(J,F,Y).

union([],_,[]).
union([X|L1], L2, [X|L3]) :- miembro(X,L2), union(L1,L2,L3).
union([X|L1],L2,L3) :- not(miembro(X,L2)), union(L1,L2,L3).

federados_por_equipo2(X,Y) :- equipo(X,J), federados(F), union2(J,F,Y).

union2([],_,[]).
union2([X|L1], L2, [X|L3]) :- not(miembro(X,L2)), union2(L1,L2,L3).
union2([X|L1],L2,L3) :- miembro(X,L2), union2(L1,L2,L3).

