pares([],0).
pares([X|Y], R) :- 0 is X/2, pares()