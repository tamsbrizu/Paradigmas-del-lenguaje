modulo(X,Y,R) :- X < Y, R is X.
modulo(X,Y,R) :- X1  is X-Y, modulo(X1,Y,R).
