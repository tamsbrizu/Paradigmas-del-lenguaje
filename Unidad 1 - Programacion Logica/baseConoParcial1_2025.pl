equipo(rojo,[juan,jose,mario,andres]).
equipo(verde,[francisco,julian,matias,rodrigo,marcelo]).
equipo(azul,[marcelo,guillermo,federico,juan]).

federados([guillermo,mario,rodrigo,julian,juan,francisco,franco, jorge]).

consulta6(X,Y) :- equipo(X,J), federados(F), no_union(J,F,Y).

no_union([],_,[]).
no_union([X|L1], L2, [X|L3]) :- not(miembro(X,L2)), no_union(L1,L2,L3).
no_union([X|L1], L2, L3) :- miembro(X,L2), no_union(L1,L2,L3).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

al_menos1Fede(X) :- equipo(X,J), miembro(Y,J), federados(F), miembro(Y,F).

jugadores_mas1equi(X) :- equipo(E1,J1), equipo(E2,J2), miembro(X,J1), miembro(X,J2), E1 /= E2.

lista_todosfedeEqui(L) :- equipo(_,J), federados(F), union(F,J,L).

union([],_,[]).
union([X|L1], L2, [X|L3]) :- miembro(X,L2), union(L1,L2,L3).
union([X|L1], L2, L3) :- not(miembro(X,L2)), union(L1,L2,L3).

jugadoresUn(X,Y,L) :- equipo(X,J1), equipo(Y,J2), union_equi(J1,J2,L).

union_equi([],L2,L2).
union_equi([X|L1], L2, [X|L3]) :- union_equi(L1,L2,L3).

jugadoresFedeNoEqui(X) :- federados(F), miembro(X,F), equipo(_,J), not(miembro(X,J)).


