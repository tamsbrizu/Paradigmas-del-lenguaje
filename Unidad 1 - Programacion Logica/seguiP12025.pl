busca([],[]).
busca([X|L1],[X|L2]) :- busca(L1,L2).
busca(L1,[_|L2]) :- busca(L1,L2).