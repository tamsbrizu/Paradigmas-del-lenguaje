reves([],[]).
reves([X|Y],Z) :- Z = [X], reves(Y,Z).