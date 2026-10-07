perfil(maria, 254, [ana,carlos,martina],[juan,estela]).
perfil(ana, 340, [betina,julian], [nicolas]).
perfil(julian, 278, [ana,carlos,maria,estela], []).

consulta1(X) :- perfil(X,Y,_,_), Y > 300.
consulta2(X)  :- perfil(X,_,S,_), contar(S,R), R > 100.000.
consulta3(X) :- perfil(X,_,_,[]).

contar([],0).
contar([_|Y], R) :- contar(Y,R1), R is R1 + 1.

mostrar(X,Y) :- perfil(X,_,SE,S), union(SE,S,Y).

union([],L2,L2).
union([X|L1], L2, [X|L3]) :- union(L1,L2,L3).