%% EJERCICIO 7

% estado(MisionerosIzq,CanibalesIzq,Barca)
% "MisionerosIzq: número de misioneros a la izquierda € [0,3]"
% "MisionerosDer: número de caníbales a la derecha    € [0,3]"
% "Barca        : lugar donde se encuentra la barca   € [D,I]"

% ESTADO INICIAL: "3 misioneros y 3 caníbales están en la orilla de un río"
inicial(estado(3,3,I)).

% ESTADO OBJETIVO: "[...]un río que quieren cruzar[...]"
objetivo(estado(0,0,_)).

% MOVIMIENTOS "de izquierda a derecha"
mvto(estado(X,Y,I),estado(X-1,M-1,D),"+1M1C").
mvto(estado(X,Y,I),estado(X-2,M,D),"+2M").
mvto(estado(X,Y,I),estado(X,M-2,D),"+2C").

% MOVIMIENTOS "de derecha a izquierda"
mvto(estado(X,Y,D),estado(X+1,Y+1,I),"-1M1C").
mvto(estado(X,Y,D),estado(X,Y+2,I),"-2C").
mvto(estado(X,Y,D),estado(X-2,Y,I),"-2M").

% ESTADO DE PELIGRO "Los misioneros están en peligro si el número de caníbales les supera   "
peligro(estado(X,Y,_)):- Y > X.

% BÚSQUEDA
puede(Estado,[]):- objetivo(Estado).
puede(Estado,[Op | Ops]):- mvto(Estado,EstadoSig,Op),
                           !peligro(EstadoSig),
                           puede(Estado,Ops).
                           
% BÚSQUEDA CONTROL REPETICIONES
puede(Estado,[],[]):- objetivo(Estado).
puede(Estado,Vs,[Op | Ops]):- mvto(Estado,EstadoSig,Op),
                                    !peligro(EstadoSig),
                                    puede(Estado,[V | Vs], Ops).