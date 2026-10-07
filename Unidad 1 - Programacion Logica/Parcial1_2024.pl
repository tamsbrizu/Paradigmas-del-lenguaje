afiliado([juan, hugo, mario, ana]). 
activo(hugo).
pasivo(juan). 
pasivo(ana). 
adherente(mario).
grupoFamiliar(juan, [carlos, susy,carolina]).
grupoFamiliar(hugo, [mauricio]). 
grupoFamiliar(mario, []). 
grupoFamiliar(ana, [ale, virginia, andres]). 
mostrar(Y, Z) :- afiliado(X), busca(X, Y, Z). 
busca([], [], []). 
busca([X|Y], [X|L], Z) :- activo(X), busca(Y, L, Z), !. 
busca([X|Y], Z, [X|L]) :- pasivo(X), busca(Y, Z, L), !. 
busca([_|Y], Z, L):- busca(Y, Z, L),!.

lista(Y) :- afiliado(A), union(A,Y).

union([],[]).
union([X|L1], [X|L2]) :- grupoFamiliar(X,[]), union(L1,L2), !.
union([X|L1], L2) :- union(L1,L2).