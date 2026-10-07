perfil(maria, 254, [ana,carlos,martina],[juan,estela]).
perfil(ana, 340, [betina,julian], [nicolas]).
perfil(julian, 278, [ana,carlos,maria,estela], []).
 

usuarios(X) :- perfil(X,_,_,_).

cant_seguidores(X,C) :- perfil(X,_,S,_), contar(S,C).
contar([],0).
contar([_|Y], R) :- contar(Y,R1), R is R1 + 1.

sigue(X,Y) :- perfil(X,_,S,_), miembro(Y,S).
miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

no_sigue_a_nadie(X) :- perfil(X,_,_,[]).

seguidores_en_comun(X,Y,Z) :- perfil(X,_,S1,_), perfil(Y,_,S2,_), union(S1,S2,Z).
union([],_,[]).
union([X|L1],L2,[X|L3]) :- miembro(X,L2), union(L1,L2,L3).
union([X|L1],L2,L3) :- not(miembro(X,L2)), union(L1,L2,L3).

quienes_sigue(X,Y) :- perfil(Y,_,S,_), miembro(X,S).

se_siguen(X,Y) :- perfil(X,_,S1,_), miembro(Y,S1), perfil(Y,_,S2,_), miembro(X,S2).

uniones_segui(X,Y,Z) :- perfil(X,_,S1,_), perfil(Y,_,S2,_), union2(S1,S2,Z).
union2([],_,[]).
union2([X|L1],L2,[X|L3]) :- union2(L1,L2,L3).

listamasde4([X|L]) :- perfil(X,_,S,_), contar(S,R), R >= 4, listamas4(L).
listamas4([]).



