encontrar_pareja :- persona(H,m,List1), persona(M,f,List2), interes_comun(List1,List2,_), write(H), write('esta muy enamorado con'), write(M), nl.
encontrar_pareja :- write('Fin de Lista.')
interes_comun(L1,L2,X) :- miembro(X,L1), miembro(X,L2),!.
persona(carlos,m,[viajar,libros,basquet]).
