medico(m1,rosales).
medico(m2,manni).
paciente(p1,juan).
paciente(p2,ana).
atiende(m1,p1).
atiende(m1,p2).
atiende(m2,p2).

menu :- write("1. Listar los paciente que atiende un medico en especifico."), nl,
write("2. Listar los medicos que atienden a un paciente en especifico."), nl,
write("3. Terminar."), nl, read(A), opcion(A).

opcion(1) :- write("Ingrese el nombre del medico: "), nl, read(B), buscar_op1(B), menu.
opcion(2) :- write("Ingrese el nombre del paciente: "), nl, read(B), buscar_op2(B), menu.
opcion(3) :- write("Adios."), !.

buscar_op1(B) :- medico(X,B), atiende(X,Y), paciente(Y,Z), write(Z), nl, fail.
buscar_op1(_).
buscar_op2(B) :- paciente(X,B), atiende(Y,X), medico(Y,Z), write(Z), nl,fail.
buscar_op2(_).

