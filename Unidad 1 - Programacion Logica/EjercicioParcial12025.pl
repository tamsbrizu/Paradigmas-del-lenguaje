perfil(maria, 254,[ana,carlos,martina], [juan,estela]).
perfil(ana,340,[betina,julian],[nicolas]).
perfil(julian, 278, [ana,carlos, maria,estela], []).

% inciso 3
menu :- write("D. Usuarios que tiene mas  de 300 publicaciones."), nl,
write("E. Usuarios con mas de 100.000 seguidores."), nl,
write("F. Usuarios que no siguen a nadie."), nl,
read(A), opcion(A).

opcion(d) :- buscar_op1, menu.

buscar_op1 :- perfil(X,Y,_,_), Y > 300, write(X), nl, fail.
buscar_op1.