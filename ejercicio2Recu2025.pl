% perfil, nombre, cantPubli, seguidores, seguidos %

perfil(maria,254,[ana,carlos,martina],[juan,estela]).
perfil(ana,340,[betina,julian],[nicolas]).
perfil(julian,278,[ana,carlos,maria,estela],[]).

consultas :- write('1. Usuarios que tienen mas de 300 publicaciones.'), nl,
write('2. Usuarios con mas de 100.000 seguidores.'), nl,
write('3. Usuarios que no siguen a nadie.'), nl,
write('0. Salir de las consultas.'), nl,
read(A), opcion(A).

opcion(1) :- tarea1, consultas.
opcion(2) :- tarea2, consultas.
opcion(3) :- tarea3, consultas.
opcion(0) :- write('Adios'), !.

tarea1 :- perfil(X,Y,_,_), Y > 300, write(X), nl, fail.
tarea1.
tarea2 :- perfil(X,_,L,_), contarElementos(L,R), R > 2, write(X), nl, fail.
tarea2.
tarea3 :- perfil(X,_,_,L), L = [], write(X), nl, fail.  
tarea3.


contarElementos([],0).
contarElementos([_|Z], R) :- contarElementos(Z,R1), R is R1 + 1.