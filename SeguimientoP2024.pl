arma([],[]).
arma([A|Y],[A|Z]) :- arma(Y,Z).
arma([_|Y],Z) :- arma(Y,Z), !.