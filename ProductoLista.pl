producto([],1).
producto([X|Y], R) :- producto(Y, R1), R is R1 * X.