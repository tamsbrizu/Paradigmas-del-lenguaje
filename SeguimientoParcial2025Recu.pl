armar([],[]).
armar(L1,[X|L2]) :- busca(X,L1,L3), armar(L3,L2).
busca(X,[X|L],L).
busca(X,[Y|L1],[Y|L2]) :- busca(X,L1,L2).