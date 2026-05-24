miembro(X,[X|_]).
miembro(X,[_|Z]) :- miembro(X,Z).