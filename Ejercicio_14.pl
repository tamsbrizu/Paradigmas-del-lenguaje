auto(10,ford,8000).
auto(20,fiat,9000).
socio(100, juan,8000).
socio(200, luis, 5000). 
socio(300, carlos,9000). 
socio(400, raul, 4500). 
socio(500, mario, 8000). 
grupo(10, [200,500,400]).
grupo(20, [300,400]).
listado(P) :- auto(A,P,Precio), !,grupo(A, Lista),sigue(Lista, Precio). 
sigue([ ], _) :- write(' Listado completo para: '), nl. 
sigue([X|Y], Precio) :- socio(X,Nom,Pagado), Pagado=Precio, write(Nom), nl, sigue(Y,Precio),!. 
sigue([_|Y],P) :- sigue(Y,P). 