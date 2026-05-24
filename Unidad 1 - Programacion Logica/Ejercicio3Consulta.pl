equipo(rojo,[juan,jose,mario,andres]).
equipo(verde,[francisco,julian,matias,rodrigo]).
equipo(azul,[marcelo,guillermo,federico]).

federados([guillermo,mario,rodrigo,julian,juan,francisco]).

menu :- write('1.Listar el nombre de los equipos que participan en el torneo.'), nl,
write('2.Mostrar para cada equipo el nombre del capitan.'), nl,
write('3.Buscar y mostrar el capitan de cada equipo que este federado.'), nl,
write('4.Consultar si Jose es es capitan de algun equipo.'), nl,
write('0.Salir.'), nl,
read(A), opcion(A).

opcion(1) :- tarea1, menu.
opcion(2) :- tarea2, menu.
opcion(3) :- tarea3, menu.
opcion(4) :- tarea4(marcelo), menu.
opcion(0) :- write('adios'), !.


tarea1 :- equipo(X,_), write(X), nl, fail.
tarea1.
tarea2 :- equipo(_,[X|_]), write(X), nl, fail.
tarea2.
tarea3 :- equipo(_,[X|_]), federados(L), capitan(X, L), fail.
tarea3.
tarea4(X):- equipo(_,[X|_]).

capitan(X,[X|_]) :- write(X), nl.
capitan(X,[_|Z]) :- capitan(X,Z).

