perfil(maria,254,[ana,carlos,martina,juan],[juan,estela]).
perfil(ana,340,[betina,julian],[nicolas]).
perfil(julian,278,[ana,carlos,maria,estela],[]).

mostrarLista(X,Y) :- perfil(X,_,L1,L2), concatenar(L1,L2,Y).

concatenar([],_,[]).
concatenar([X|L1], L2, [X|L3]) :- not(miembro(X,L2)), concatenar(L1,L2,L3).
concatenar([X|L1], L2, L3) :- miembro(X,L2), concatenar(L1,L2,L3).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).