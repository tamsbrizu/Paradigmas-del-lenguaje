equipocatedra(algoritmos, [docente(mario, titular), docente(monica, jtp)]).
equipocatedra(basica, [docente(jorge, adjunto)]).
equipocatedra(computacion, [docente(isabel, titular)]).

consulta1(X,Y) :- equipocatedra(X,P), jefe(Y,P).
consulta2(X) :- equipocatedra(X,P), contar(P,R), R = 1.
consulta3(X) :- equipocatedra(_,P), jefe(X,P).

jefe(X, [docente(X,_)|_]).

contar([],0).
contar([_|Y], R) :- contar(Y,R1), R is R1 + 1. 