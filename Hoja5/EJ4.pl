%% EJERCICIO 4

% relacion_repetida(+C1, +C2, ?Relacion, ?NumRep)
% "C1       : concepto 1 de la relación"
% "C2       : concepto 2 de la relación"
% "Relacion : nombre de la relación"
% "NumRep   : número repeticiones relación"

% arista(NRelación,Origen,Destino).

relacion_repetida(C1,C2,R,NR):-
    relacion_repetida_aux(C1,C2,R,NR) ; relacion_repetida_aux(C2,C1,R,NR).
    
relacion_repetida_aux(C1,C2,R,1):-
    arista(R,C1,C2).

relacion_repetida_aux(C1,C2,R,N):-
    arista(R,C1,X),
    relacion_repetida_aux(X,C2,R,M),
    N is M + 1.
    

% camino(+C1,+C2,?CadRel)
% "C1     : concepto 1 de la relación"
% "C2     : concepto 2 de la relación"
% "CadRel : cadena de relaciones que une C1 y C2"
camino(X,X,[X]).
camino(X,Y,[X,R | []]):-
    arista(X,Z,R),
    camino(Z,Y,R).


% busq_rel(+C1,+C2,?CadRel).
busq_rel(X,X,[X],[X],X).
	% Arcos dirigidos desde X
busq_rel(X,Y,Camino,[Y],Y):-
	camino(X,Y,Camino).
	% Arcos dirigidos desde Y
busq_rel(X,Y,[X],Camino,X):-
	camino(Y,X,Camino).
	% Arcos desde X y desde Y
busq_rel(X,Y,[X,R1 | Izda],[Y,R2 | Dcha],I):-
	arista(R1,X,Z1),
	arista(R2,Y,Z2),
	busq_rel(Z1,Z2,Izda,Dcha,I).