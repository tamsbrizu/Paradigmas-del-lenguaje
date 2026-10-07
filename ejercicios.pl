reves([],[]).
reves([X|Y], Z) :- reves(Y,J), union(J,[X],Z).
union([],L2,L2).
union([X|L1], L2, [X|L3]) :- union(L1,L2,L3)
