% perfil, nombre, cantPubli, seguidores, seguidos %

perfil(maria,254,[ana,carlos,martina],[juan,estela]).
perfil(ana,340,[betina,julian],[nicolas]).
perfil(julian,278,[ana,carlos,maria,estela],[]).

lista :- perfil(X,_,L1,L2), union(L1,L2,R), write(X), nl, write(R), nl, fail.

union([],L2,L2).
union([X|L1], L2, [X|L3]) :- union(L1,L2,L3).