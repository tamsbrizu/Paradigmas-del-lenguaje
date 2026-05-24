equipo(rojo,[juan,jose,mario,andres]).
equipo(verde,[francisco,julian,matias,rodrigo]).
equipo(azul,[marcelo,guillermo,federico]).

federados([guillermo,mario,rodrigo,julian,juan,francisco]).

federados_por_equipo(X,Y): equipo(X,l1), federados(l2), construcion(l1,l2,l3), write(l3), fail.
federados_por_equipo(_,_).

construcion([X|_], [X,_], []).
construcion().

