afiliado([juan, hugo, mario, ana]). 
activo(hugo).
pasivo(juan). 
pasivo(ana). 
adherente(mario).
grupoFamiliar(juan, [carlos, susy,carolina]).
grupoFamiliar(hugo, []). 
grupoFamiliar(mario, []). 
grupoFamiliar(ana, [ale, virginia, andres]). 
mostrar(Y, Z) :- afiliado(X), busca(X, Y, Z). 
busca([], [], []). 
busca([X|Y], [X|L], Z) :- activo(X), busca(Y, L, Z), !. 
busca([X|Y], Z, [X|L]) :- pasivo(X), busca(Y, Z, L), !. 
busca([_|Y], Z, L):- busca(Y, Z, L),!.

perfil(maria, 254, [ana,carlos,martina],[juan,estela]).
perfil(ana, 340, [betina,julian], [nicolas]).
perfil(julian, 278, [ana,carlos,maria,estela], []).

ocurrencias(_,[],0).
ocurrencias(X,[X|Y],R) :- ocurrencias(X,Y,R1), R is R1 + 1.
ocurrencias(X,[_|Y],R) :- ocurrencias(X,Y,R).

generarLista(L) :- afiliado(A), union(A,L).

union([],[]).
union([X|L1], [X|L2]) :- grupoFamiliar(X,[]), union(L1,L2), !.
union([X|L1], L2) :- union(L1,L2).

contar([],0).
contar([_|Y], R) :- contar(Y,R1), R is R1 + 1.

con1(X) :- perfil(X,Y,_,_), Y > 300.
con2(X) :- perfil(X,_,S,_), contar(S,R), R > 2.
con3(X) :- perfil(X,_,_,[]).


