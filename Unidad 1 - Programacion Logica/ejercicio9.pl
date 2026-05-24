adya(X,Y,[X,Y|_]).
adya(X,Y,[Y,X|_]).
adya(X,Y,[_|Z]) :- adya(X,Y,Z).