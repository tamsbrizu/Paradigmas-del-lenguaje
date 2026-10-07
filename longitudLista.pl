longitud([],0).
longitud([_|Y], R) :- longitud(Y,R1), R is R1 + 1. 