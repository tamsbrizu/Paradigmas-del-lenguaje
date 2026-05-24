'''Defina el predicado ELIM que permita eliminar un elemento de una
lista.
elim(2, [3,2,1], [3,1]). ---> true
elim(2, [2,3,1], X). ---> X=[3,1]'''

elim(X, [X,Y|_], [Y|_]).
elim(X, [Y,X|_], [Y|_]).
elim(X, Y, [_|A]) :- elim(X,Y,A).