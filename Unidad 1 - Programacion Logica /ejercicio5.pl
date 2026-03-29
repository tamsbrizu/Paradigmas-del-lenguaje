potencia(_,0,1).
potencia(X,Y,R) :- Y → 0, Y is Y-1, potencia(X,Y1,R), R is X * R1.
