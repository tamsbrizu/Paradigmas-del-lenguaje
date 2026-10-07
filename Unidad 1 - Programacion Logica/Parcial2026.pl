tipo(especiales, [m1,m2,v5,v8]). 
tipo(burbujas, [b1,c3,t1]). 
tipo(comun, [c1,c2,m7]). 
tipo(metalicos, [h1,c4,h5]).

precio(especiales, 70). 
precio(burbujas, 80). 
precio(metalicos, 100). 
precio(comun, 50).

busca(A,X):- member(X,A), verifica(X).
verifica(U):- tipo(_,L), member(U,L), !, fail. 
verifica(_).

% cantidad de esmaltes del tipo metalicos %
cantidad(X,Y) :- tipo(X,L), length(L,Y).


% mostrar todos los codigos de esmlates que tiene el taller %
mostrar(X) :- tipo(_,L), member(X,L).

% Generar una lista a partir de otra lista %

usados([], []).
usados([H|T], R) :- usados(T, R1), union(H, R1, R).

union([],L2,L2).
union([X|L1], L2, [X|L3]) :- union(L1,L2,L3).