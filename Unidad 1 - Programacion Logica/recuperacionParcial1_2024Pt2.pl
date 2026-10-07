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

consulta1(X,Y) :- familia(persona(X,_,_), persona(Y,_,_),[]).

consulta2(X) :- familia(persona(X,_,trabajo(_,Y)),_,_), Y < 500.

consulta3(X) :- familia(_, persona(X, fecha(_,_,Y),_),_), Y < 1966.

regla(X) :- familia(persona(X,_,_),_, Hijos),
miembro(persona(Z,_,_), Hijos), familia(persona(Z,_,_),_, Nietos), miembro(_,Nietos).

regla(X) :- familia(_,persona(X,_,_), Hijos),
miembro(persona(Z,_,_), Hijos), familia(persona(Z,_,_),_, Nietos), miembro(_,Nietos).

miembro(X, [X|_]).
miembro(X, [_|Y]) :- miembro(X,Y).