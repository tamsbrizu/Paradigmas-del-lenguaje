contarEleme(_,[],0).
contarEleme(X,[X|Y],R) :- contarEleme(X,Y,R1), R is R1 + 1.
contarEleme(X,[_|Y],R) :- contarEleme(X,Y,R).