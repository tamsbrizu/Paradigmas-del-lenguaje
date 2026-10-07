sumar([],0).
sumar([X|Y], R) :- sumar(Y, R1), R is R1 + X.