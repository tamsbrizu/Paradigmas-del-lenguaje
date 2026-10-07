equipo(rojo, [juan,jose,mario,andres]).
equipo(verde, [francisco, julian, matias, rodrigo]).
equipo(azul, [marcelo,guillermo,federico]).

federados([guillermo,mario,rodrigo,julian,juan,francisco]).

listar :- write('1. Mostrar los equipos que participan.'), nl,
write('2. Mostrar para cada equipo el nombre de los lideres.'), nl,
write('3. Buscar y mostrar el capitan del equipo que este federado.'), nl,
write('4. Consultar si jose es capitan de algun equipo.'), nl,
write('0. Salir.'), nl,
read(A), opcion(A).

opcion(1) :- tarea1, listar.
opcion(2) :- tarea2, listar.
opcion(3) :- tarea3, listar.
opcion(4) :- tarea4, listar.
opcion(0) :- write('Adios'), !.

tarea1 :- equipo(X,_), write(X), nl, fail.
tarea1.
tarea2 :- equipo(_,[X|_]), write(X), nl, fail.
tarea2.
tarea3 :- equipo(_,[X|_]), federados(L), capitan(X,L), write(X), nl, fail.
tarea3.
tarea4 :- equipo(_,[jose|_]).

capitan(X,[X|_]).
capitan(X,[_|Y]) :- capitan(X,Y).


'''federados([guillermo,mario,rodrigo,julian,juan,francisco]).

mostarEquiSinFede(X,Y) :- equipo(X,J), federados(L), union(J,L,Y).

miembro(X,[X|_]).
miembro(X,[_|Y]) :- miembro(X,Y).

union([],_,[]).
union([X|L1],L2,[X|L3]) :- not(miembro(X,L2)), union(L1,L2,L3).
union([X|L1], L2, L3) :- miembro(X,L2), union(L1,L2,L3).'''

