contar([],0).
contar([X|Y], R) :- contar(Y,R1), R is R1 + 1.