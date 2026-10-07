familia(persona(tomas_garcia, fecha(7,mayo,1980), trabajo(profesor,900)), 
    persona(ana_lopez, fecha(10,marzo,1980), trabajo(docente, 520)), 
    [persona(juan_garcia, fecha(5,enero,2010), estudiante), 
    persona(maria_garcia, fecha(12,abril,2012), estudiante)]).
familia(persona(jose_perez, fecha(6,marzo,1975), trabajo(pintor,400)),
    persona(luisa_galvez, fecha(12,mayo,1962), trabajo(secretaria,600)),
    [persona(juan_luis_perez, fecha(5,febrero,2005), estudiante), 
    persona(maria_jose_perez, fecha(12,junio,2012), estudiante), 
    persona(jose_maria_perez, fecha(12,julio,2015), estudiante)]).
familia(persona(juan_luis_perez, fecha(5,febrero,2005), estudiante), 
    persona(marisa_salva, fecha(10,mayo,2005), trabajo(comercio,700)),
    [persona(elena_perez, fecha(4,junio,2023), menor)]).


esEstudiante(X, [persona(X,_,estudiante)|_]).
esEstudiante(X, [_|Y]) :- miembro(X,Y).



consulta1(X) :- familia(persona(X,_,_),_,_).
consulta2(X) :- familia(_,persona(X,_,_),_).
consulta3(X,Y) :- familia(persona(X,_,trabajo(Y,_)),_,_).
consulta4(X,Y) :-familia(persona(X,_,trabajo(_,Y)),_,_).
consulta5(X,Y) :- familia(persona(X,fecha(_,Y,_),_),_,_).
consulta6(X) :- familia(persona(X,_,estudiante),_,_).
consulta6(X) :- familia(_,persona(X,_,estudiante),_).
consulta6(X) :- familia(_,_,L), esEstudiante(X,L).
consulta7(X) :- familia(persona(X,_,trabajo(_,Y)),_,_), Y > 600.
consulta7(X) :- familia(_,persona(X,_,trabajo(_,Y)),_), Y > 600.


consulta8(X,Y) :- familia(persona(X,_,_), persona(Y,_,_), Hijos), cantidad(Hijos,R), write(X), write('tiene'), write(R), write('hijos con'), write(Y).
cantidad([],0).
cantidad([_|Y], R) :- cantidad(Y,R1), R is R1 + 1.

consulta9(X,Y) :- familia(persona(X,_,_), persona(Y,_,_), Hijos), cantidad(Hijos,R), R > 2, write(X), write('tiene'), write(R), write('hijos con'), write(Y).
consulta10(X,Y,Z) :- familia(persona(X,_,_), persona(Y,_,_), Hijos), miembro(Z, Hijos).
miembro(X, [persona(X,_,_)|_]).
miembro(X, [_|Y]) :- miembro(X,Y).

consulta11(X,Y,Z) :- familia(persona(X,_,_), persona(Y,_,_), Hijos), miembro1(Z, Hijos).
miembro1(X, [persona(X,fecha(_,_,Z),_)|_]) :- Z > 2010.
miembro1(X, [_|Y]) :- miembro(X,Y).

consulta12(X,Y,Z) :- familia(persona(X,_,_), persona(Y,_,_), Hijos), miembro2(Z, Hijos).
miembro2(X, [persona(X,_,menor)|_]).
miembro2(X, [_|Y]) :- miembro(X,Y).

consulta13(X,Y,Z) :- familia(persona(X,_,_), persona(Y,_,_), Hijos), unico(Z, Hijos).
unico(X, [persona(X,_,_)|[]]).

consulta14(X) :- familia(persona(X,fecha(_,mayo,_)),_,_).
consulta14(X) :- familia(_,persona(X,fecha(_,mayo,_)),_).
consulta14(X) :- familia(_,_,Hijos), miembro4(X,Hijos).
miembro4(X,[persona(X,fecha(_,mayo,_),_)|_]).
miembro4(X,[_|Y]) :- miembro4(X,Y).

consulta15(X) :- familia(persona(_,_,trabajo(X,_)),_,_).
consulta15(X) :- familia(_,persona(_,_,trabajo(X,_)),_).

consulta16(X,Y) :- familia(persona(X,_,trabajo(Z,_)),persona(Y,_,trabajo(Z,_)),_).

consulta18(X,M) :- familia(persona(X,fecha(_,M,_),_),_,_).
consulta18(X,M) :- familia(_,persona(X,fecha(_,M,_)),_).
consulta18(X,M) :- familia(_,_,Hijos), miembro5(M,X,Hijos).
miembro5(M,X,[persona(X,fecha(_,M,_),_)|_]).
miembro5(M,X,[_|Y]) :- miembro5(M,X,Y).

