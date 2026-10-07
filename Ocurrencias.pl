contar(_,[],0).
contar(X,[X|Y],R) :- contar(X,Y,R1), R is R1 + 1.
contar(X,[_|Y],R) :- contar(X,Y,R).